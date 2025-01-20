@interface PLUniformTypeIdentifier
+ (BOOL)isPlayableVideoTypeIdentifierString:(id)a3;
+ (id)jpegUniformTypeIdentifier;
+ (id)plistUniformTypeIdentifier;
+ (id)quicktimeUniformTypeIdentifier;
+ (id)utiWithCompactRepresentation:(id)a3 conformanceHint:(signed __int16)a4;
+ (id)utiWithIdentifier:(id)a3;
- (BOOL)conformsToAudio;
- (BOOL)conformsToData;
- (BOOL)conformsToHEIC;
- (BOOL)conformsToHEIF;
- (BOOL)conformsToImage;
- (BOOL)conformsToJPEG;
- (BOOL)conformsToMovie;
- (BOOL)conformsToRawImage;
- (BOOL)isDynamic;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUniformTypeIdentifier:(id)a3;
- (BOOL)isLosslessEncoding;
- (BOOL)isPlayableVideo;
- (BOOL)isPrimaryImageFormat;
- (NSString)compactRepresentation;
- (NSString)identifier;
- (PLUniformTypeIdentifier)initWithIdentifier:(id)a3 conformanceHint:(signed __int16)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)preferredExtension;
- (signed)conformanceHint;
- (unint64_t)hash;
- (unsigned)wellKnownFileType;
@end

@implementation PLUniformTypeIdentifier

- (void).cxx_destruct
{
}

- (signed)conformanceHint
{
  return self->_conformanceHint;
}

- (unsigned)wellKnownFileType
{
  return self->_wellKnownFileType;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isDynamic
{
  v2 = (void *)MEMORY[0x1E4F8CDF8];
  v3 = [(PLUniformTypeIdentifier *)self identifier];
  v4 = [v2 typeWithIdentifier:v3];
  char v5 = [v4 isDynamic];

  return v5;
}

- (BOOL)isLosslessEncoding
{
  if ([(PLUniformTypeIdentifier *)self conformsToRawImage]) {
    return 1;
  }
  if ([(PLUniformTypeIdentifier *)self conformsToImage]) {
    return self->_wellKnownFileType - 6 < 3;
  }
  if ([(PLUniformTypeIdentifier *)self conformsToMovie]) {
    return 0;
  }
  return ![(PLUniformTypeIdentifier *)self conformsToAudio];
}

- (id)preferredExtension
{
  v2 = [(PLUniformTypeIdentifier *)self identifier];
  v3 = +[PLManagedAsset preferredFileExtensionForType:v2];

  return v3;
}

- (BOOL)conformsToHEIC
{
  return self->_wellKnownFileType == 3;
}

- (BOOL)conformsToHEIF
{
  return self->_wellKnownFileType == 4;
}

- (BOOL)conformsToJPEG
{
  return self->_wellKnownFileType - 1 < 2;
}

- (BOOL)conformsToData
{
  v3 = [(PLUniformTypeIdentifier *)self identifier];
  v4 = [MEMORY[0x1E4F8CDF8] supplementalResourceAAEType];
  char v5 = [v4 identifier];
  if ([v3 isEqualToString:v5])
  {
    char v6 = 1;
  }
  else
  {
    v7 = [(PLUniformTypeIdentifier *)self identifier];
    v8 = [MEMORY[0x1E4F8CDF8] supplementalResourceXMPType];
    v9 = [v8 identifier];
    char v6 = [v7 isEqualToString:v9];
  }
  v10 = [(PLUniformTypeIdentifier *)self identifier];
  if (v6)
  {
    char v11 = 1;
  }
  else
  {
    v12 = [MEMORY[0x1E4F8CDF8] typeWithIdentifier:v10];
    char v11 = [v12 conformsToType:*MEMORY[0x1E4F44378]];
  }
  return v11;
}

- (BOOL)conformsToAudio
{
  v2 = (void *)MEMORY[0x1E4F8CDF8];
  v3 = [(PLUniformTypeIdentifier *)self identifier];
  v4 = [v2 typeWithIdentifier:v3];
  char v5 = [v4 conformsToType:*MEMORY[0x1E4F44330]];

  return v5;
}

- (BOOL)isPlayableVideo
{
  v3 = objc_opt_class();
  v4 = [(PLUniformTypeIdentifier *)self identifier];
  LOBYTE(v3) = [v3 isPlayableVideoTypeIdentifierString:v4];

  return (char)v3;
}

- (BOOL)conformsToMovie
{
  return self->_conformanceHint == 3;
}

- (BOOL)conformsToRawImage
{
  return self->_conformanceHint == 2;
}

- (BOOL)conformsToImage
{
  return (unsigned __int16)self->_conformanceHint - 1 < 2;
}

- (BOOL)isPrimaryImageFormat
{
  v2 = [(PLUniformTypeIdentifier *)self identifier];
  BOOL v3 = +[PLManagedAsset isPrimaryImageFormatForUTI:v2];

  return v3;
}

- (NSString)compactRepresentation
{
  v2 = [(PLUniformTypeIdentifier *)self identifier];
  BOOL v3 = +[PLUniformTypeIdentifierIntegratedLookup compactRepresentationForIdentifier:v2];

  return (NSString *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [PLUniformTypeIdentifier alloc];
  char v5 = [(PLUniformTypeIdentifier *)self identifier];
  char v6 = [(PLUniformTypeIdentifier *)v4 initWithIdentifier:v5 conformanceHint:[(PLUniformTypeIdentifier *)self conformanceHint]];

  return v6;
}

- (id)description
{
  BOOL v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PLUniformTypeIdentifier;
  v4 = [(PLUniformTypeIdentifier *)&v8 description];
  char v5 = [(PLUniformTypeIdentifier *)self identifier];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (unint64_t)hash
{
  v2 = [(PLUniformTypeIdentifier *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PLUniformTypeIdentifier *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0
      && [(PLUniformTypeIdentifier *)self isEqualToUniformTypeIdentifier:v4];
  }

  return v5;
}

- (BOOL)isEqualToUniformTypeIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PLUniformTypeIdentifier *)self identifier];
  char v6 = [v4 identifier];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (PLUniformTypeIdentifier)initWithIdentifier:(id)a3 conformanceHint:(signed __int16)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLUniformTypeIdentifier;
  objc_super v8 = [(PLUniformTypeIdentifier *)&v13 init];
  if (v8)
  {
    if (![v7 length])
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, v8, @"PLUniformTypeIdentifier.m", 127, @"Invalid parameter not satisfying: %@", @"identifier.length > 0" object file lineNumber description];
    }
    uint64_t v9 = [v7 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v8->_conformanceHint = a4;
    v8->_wellKnownFileType = PLFileTypeFromIdentifier(v7);
  }

  return v8;
}

+ (id)plistUniformTypeIdentifier
{
  unint64_t v3 = [(id)*MEMORY[0x1E4F44488] identifier];
  id v4 = [a1 utiWithIdentifier:v3];

  return v4;
}

+ (id)quicktimeUniformTypeIdentifier
{
  unint64_t v3 = [(id)*MEMORY[0x1E4F44490] identifier];
  id v4 = [a1 utiWithIdentifier:v3];

  return v4;
}

+ (id)jpegUniformTypeIdentifier
{
  unint64_t v3 = [(id)*MEMORY[0x1E4F44410] identifier];
  id v4 = [a1 utiWithIdentifier:v3];

  return v4;
}

+ (BOOL)isPlayableVideoTypeIdentifierString:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    unint64_t v3 = objc_msgSend(MEMORY[0x1E4F8CDF8], "typeWithIdentifier:");
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = objc_msgSend(MEMORY[0x1E4F8CDF8], "supportedMovieTypes", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v10;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v4);
          }
          if ([v3 conformsToType:*(void *)(*((void *)&v9 + 1) + 8 * i)])
          {
            LOBYTE(v5) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

+ (id)utiWithCompactRepresentation:(id)a3 conformanceHint:(signed __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  if ([v6 length])
  {
    id v7 = +[PLUniformTypeIdentifierIntegratedLookup identifierFromCompactRepresentation:v6];
    if ([v7 length]) {
      objc_super v8 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v7 conformanceHint:v4];
    }
    else {
      objc_super v8 = 0;
    }
  }
  else
  {
    objc_super v8 = 0;
  }

  return v8;
}

+ (id)utiWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length]) {
    uint64_t v5 = objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:conformanceHint:", v4, +[PLUniformTypeIdentifierIntegratedLookup conformanceHintForIdentifier:](PLUniformTypeIdentifierIntegratedLookup, "conformanceHintForIdentifier:", v4));
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

@end