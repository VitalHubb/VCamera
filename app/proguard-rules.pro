# 1. Configuración de Ofuscación Agresiva
-optimizationpasses 5
-dontusemixedcaseclassnames
-dontskipnonpubliclibraryclasses
-dontpreverify
-verbose
-optimizations !code/simplification/arithmetic,!field/*,!class/merging/*

# 2. Renombrado de paquetes para camuflaje
# Esto mueve tus clases a un paquete que parece de Google
-repackageclasses 'com.google.android.gms.internal'
-allowaccessmodification
-overloadaggressively

# 3. Eliminación de Metadatos de Depuración
# Borramos cualquier rastro que indique dónde se programó la app
-keepattributes !SourceFile,!LineNumberTable,!Signature,!EnclosingMethod
-renamesourcefileattribute SourceFile

# 4. Reglas Anti-Detección de "Virtual" y "Hook"
# Estas reglas fuerzan el cambio de nombre de cualquier método que 
# use palabras clave que los bancos rastrean en la RAM.
-keepclassmembernames class * {
    *** *Virtual*;
    *** *Hook*;
    *** *Camera*;
    *** *Stream*;
}

# 5. Protección de librerías nativas
# Esto asegura que la conexión con el native-lib.cpp no se rompa,
# pero mantiene el interior oculto.
-keepclasseswithmembernames class * {
    native <methods>;
}

# 6. Bypass de chequeo de firmas
# Evita que se analice la estructura de las clases internas
-dontnote **
-dontwarn **
-ignorewarnings
