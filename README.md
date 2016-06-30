### Signer - Utils

Bei der Verwendung der Apache-Commons-Codec-Klassen gibt es Probleme unter Android

Aus diesem Grund wird mit [jarjar](https://code.google.com/archive/p/jarjar/downloads) 
der Packagename geändert.

```java
    // Von:
        import org.apache.commons.codec.binary.Base64
        
    // Nach:        
        import android.org.apache.commons.codec.binary.Base64;
   
```    

Repository in build.gradle:
       
    repositories {
            // Inhalt wird per Script generiert (Signer/utils/genjar.sh)
            maven { url "file://Volumes/programming/Maven/private.flat.repository/"  }
        }
            
Dependencies in build.gradle

    dependencies {
        compile  group: 'repackaged.for.android', name: 'commons-codec', version: '1.10'
    }
        
Weitere Infos: [Commons Codec on Android](http://blog.osom.info/2015/04/commons-codec-on-android.html)