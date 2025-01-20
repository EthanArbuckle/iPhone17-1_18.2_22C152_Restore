@interface TLITunesTone
+ (id)_identifierForPropertyListRepresentation:(id)a3;
- (BOOL)isDuplicateOfTone:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrivateTone;
- (BOOL)isProtectedContent;
- (BOOL)isPurchased;
- (BOOL)isRingtone;
- (NSNumber)fadeInDurationNumber;
- (NSNumber)fadeOutDurationNumber;
- (NSNumber)syncIdentifier;
- (NSString)albumTitle;
- (NSString)artistName;
- (NSString)artworkFile;
- (NSString)filePath;
- (NSString)genreName;
- (NSString)identifier;
- (NSString)name;
- (NSString)storeFrontIdentifier;
- (TLITunesTone)initWithPropertyListRepresentation:(id)a3 filePath:(id)a4;
- (TLITunesTone)initWithToneStoreDownload:(id)a3;
- (double)duration;
- (id)description;
- (unint64_t)hash;
- (unint64_t)storeItemIdentifier;
@end

@implementation TLITunesTone

- (TLITunesTone)initWithPropertyListRepresentation:(id)a3 filePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v83.receiver = self;
  v83.super_class = (Class)TLITunesTone;
  v8 = [(TLITunesTone *)&v83 init];
  if (v8)
  {
    v9 = [(id)objc_opt_class() _identifierForPropertyListRepresentation:v6];
    v10 = [v6 objectForKey:@"Name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    id v12 = v11;

    if (v9) {
      BOOL v13 = v12 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13)
    {
      v14 = TLLogToneManagement();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[TLITunesTone initWithPropertyListRepresentation:filePath:]((uint64_t)v8, v6, v14);
      }

      fadeOutDurationNumber = v8;
      v8 = 0;
    }
    else
    {
      uint64_t v16 = [v9 copy];
      identifier = v8->_identifier;
      v8->_identifier = (NSString *)v16;

      uint64_t v18 = [v12 copy];
      name = v8->_name;
      v8->_name = (NSString *)v18;

      uint64_t v20 = [v7 copy];
      filePath = v8->_filePath;
      v8->_filePath = (NSString *)v20;

      v22 = [v6 objectForKey:@"Album"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass) {
        v24 = v22;
      }
      else {
        v24 = 0;
      }
      id v25 = v24;

      uint64_t v26 = [v25 copy];
      albumTitle = v8->_albumTitle;
      v8->_albumTitle = (NSString *)v26;

      v28 = [v6 objectForKey:@"Artist"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v29 = v28;
      }
      else {
        v29 = 0;
      }
      id v30 = v29;

      uint64_t v31 = [v30 copy];
      artistName = v8->_artistName;
      v8->_artistName = (NSString *)v31;

      v33 = [v6 objectForKey:@"Genre"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v34 = v33;
      }
      else {
        v34 = 0;
      }
      id v35 = v34;

      uint64_t v36 = [v35 copy];
      genreName = v8->_genreName;
      v8->_genreName = (NSString *)v36;

      v38 = [v6 objectForKey:@"Purchased"];
      if (objc_opt_respondsToSelector()) {
        char v39 = [v38 BOOLValue];
      }
      else {
        char v39 = 0;
      }
      v8->_purchased = v39;

      v40 = [v6 objectForKey:@"PID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v41 = v40;
      }
      else {
        v41 = 0;
      }
      id v42 = v41;

      uint64_t v43 = [v42 copy];
      syncIdentifier = v8->_syncIdentifier;
      v8->_syncIdentifier = (NSNumber *)v43;

      id v45 = [v6 objectForKey:@"Store Item ID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v46 = v45;
      }
      else {
        v46 = 0;
      }
      if (v46)
      {
        id v47 = v46;
        v48 = (const char *)[v47 unsignedLongLongValue];
      }
      else
      {
        id v49 = v45;
        id v50 = 0;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v51 = v49;
        }
        else {
          v51 = 0;
        }
        id v52 = v51;

        id v53 = v52;
        v48 = (const char *)[v53 UTF8String];

        if (v48) {
          v48 = (const char *)strtoull(v48, 0, 10);
        }
      }

      v8->_storeItemIdentifier = (unint64_t)v48;
      v54 = [v6 objectForKey:@"Store Front ID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v55 = v54;
      }
      else {
        v55 = 0;
      }
      id v56 = v55;

      uint64_t v57 = [v56 copy];
      storeFrontIdentifier = v8->_storeFrontIdentifier;
      v8->_storeFrontIdentifier = (NSString *)v57;

      v59 = [v6 objectForKey:@"Artwork File"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v60 = v59;
      }
      else {
        v60 = 0;
      }
      id v61 = v60;

      uint64_t v62 = [v61 copy];
      artworkFile = v8->_artworkFile;
      v8->_artworkFile = (NSString *)v62;

      v64 = [v6 objectForKey:@"Total Time"];
      char v65 = objc_opt_respondsToSelector();
      double v66 = 0.0;
      if (v65) {
        double v66 = (double)(unint64_t)objc_msgSend(v64, "unsignedIntegerValue", 0.0);
      }
      v8->_duration = v66 / 1000.0;

      v67 = [v6 objectForKey:@"Protected Content"];
      if (objc_opt_respondsToSelector()) {
        char v68 = [v67 BOOLValue];
      }
      else {
        char v68 = 0;
      }
      v8->_protectedContent = v68;

      v69 = [v6 objectForKey:@"Private"];
      if (objc_opt_respondsToSelector()) {
        char v70 = [v69 BOOLValue];
      }
      else {
        char v70 = 0;
      }
      v8->_privateTone = v70;

      v71 = [v6 objectForKey:@"Media Kind"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v72 = v71;
      }
      else {
        v72 = 0;
      }
      id v73 = v72;

      char v74 = [v73 isEqualToString:@"tone"];
      v8->_ringtone = v74 ^ 1;
      v75 = [v6 objectForKey:@"Fade In"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v76 = v75;
      }
      else {
        v76 = 0;
      }
      v77 = v76;

      fadeInDurationNumber = v8->_fadeInDurationNumber;
      v8->_fadeInDurationNumber = v77;

      v79 = [v6 objectForKey:@"Fade Out"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v80 = v79;
      }
      else {
        v80 = 0;
      }
      v81 = v80;

      fadeOutDurationNumber = v8->_fadeOutDurationNumber;
      v8->_fadeOutDurationNumber = v81;
    }
  }
  return v8;
}

- (TLITunesTone)initWithToneStoreDownload:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TLITunesTone;
  v5 = [(TLITunesTone *)&v23 init];
  if (v5)
  {
    id v6 = [v4 toneIdentifier];
    if (!v6)
    {
      id v6 = [v4 identifier];
    }
    uint64_t v7 = [v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = [v4 name];
    uint64_t v10 = [v9 copy];
    name = v5->_name;
    v5->_name = (NSString *)v10;

    id v12 = [v4 albumTitle];
    uint64_t v13 = [v12 copy];
    albumTitle = v5->_albumTitle;
    v5->_albumTitle = (NSString *)v13;

    v15 = [v4 artistName];
    uint64_t v16 = [v15 copy];
    artistName = v5->_artistName;
    v5->_artistName = (NSString *)v16;

    uint64_t v18 = [v4 genreName];
    uint64_t v19 = [v18 copy];
    genreName = v5->_genreName;
    v5->_genreName = (NSString *)v19;

    v5->_storeItemIdentifier = [v4 storeItemIdentifier];
    [v4 duration];
    v5->_duration = v21;
    v5->_ringtone = [v4 isRingtone];
    v5->_purchased = 1;
  }
  return v5;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  [v6 appendFormat:@"; identifier = \"%@\"", self->_identifier];
  [v6 appendFormat:@"; name = \"%@\"", self->_name];
  if (self->_albumTitle) {
    [v6 appendFormat:@"; albumTitle = \"%@\"", self->_albumTitle];
  }
  if (self->_artistName) {
    [v6 appendFormat:@"; artistName = \"%@\"", self->_artistName];
  }
  if (self->_genreName) {
    [v6 appendFormat:@"; genreName = \"%@\"", self->_genreName];
  }
  if (self->_duration > 0.00000011920929) {
    objc_msgSend(v6, "appendFormat:", @"; duration = %f", *(void *)&self->_duration);
  }
  uint64_t v7 = kToneMediaKindRingtone;
  if (!self->_ringtone) {
    uint64_t v7 = kToneMediaKindAlertTone;
  }
  [v6 appendFormat:@"; mediaKind = %@", *v7];
  if (self->_purchased) {
    [v6 appendString:@"; isPurchased = YES"];
  }
  if (self->_protectedContent) {
    [v6 appendString:@"; isProtectedContent = YES"];
  }
  if (self->_privateTone) {
    [v6 appendString:@"; isPrivateTone = YES"];
  }
  if (self->_storeItemIdentifier) {
    objc_msgSend(v6, "appendFormat:", @"; storeItemIdentifier = %llu", self->_storeItemIdentifier);
  }
  if (self->_storeFrontIdentifier) {
    [v6 appendFormat:@"; storeFrontIdentifier = \"%@\"", self->_storeFrontIdentifier];
  }
  if (self->_syncIdentifier) {
    [v6 appendFormat:@"; syncIdentifier = %@", self->_syncIdentifier];
  }
  if (self->_filePath) {
    [v6 appendFormat:@"; filePath = %@", self->_filePath];
  }
  [v6 appendString:@">"];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TLITunesTone *)a3;
  if (self == v4)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      identifier = v5->_identifier;
      unint64_t v7 = self->_identifier;
      unint64_t v8 = identifier;
      v9 = (void *)v8;
      if (!(v7 | v8)) {
        goto LABEL_11;
      }
      LOBYTE(v10) = 0;
      if (!v7 || !v8) {
        goto LABEL_88;
      }
      if (v7 == v8)
      {
LABEL_11:
      }
      else
      {
        int v10 = [(id)v7 isEqualToString:v8];

        if (!v10) {
          goto LABEL_89;
        }
      }
      name = v5->_name;
      unint64_t v7 = self->_name;
      unint64_t v12 = name;
      v9 = (void *)v12;
      if (!(v7 | v12)) {
        goto LABEL_18;
      }
      LOBYTE(v10) = 0;
      if (!v7 || !v12) {
        goto LABEL_88;
      }
      if (v7 == v12)
      {
LABEL_18:
      }
      else
      {
        int v10 = [(id)v7 isEqualToString:v12];

        if (!v10) {
          goto LABEL_89;
        }
      }
      filePath = v5->_filePath;
      unint64_t v7 = self->_filePath;
      unint64_t v14 = filePath;
      v9 = (void *)v14;
      if (!(v7 | v14)) {
        goto LABEL_25;
      }
      LOBYTE(v10) = 0;
      if (!v7 || !v14) {
        goto LABEL_88;
      }
      if (v7 == v14)
      {
LABEL_25:
      }
      else
      {
        int v10 = [(id)v7 isEqualToString:v14];

        if (!v10) {
          goto LABEL_89;
        }
      }
      albumTitle = v5->_albumTitle;
      unint64_t v7 = self->_albumTitle;
      unint64_t v16 = albumTitle;
      v9 = (void *)v16;
      if (!(v7 | v16)) {
        goto LABEL_32;
      }
      LOBYTE(v10) = 0;
      if (!v7 || !v16) {
        goto LABEL_88;
      }
      if (v7 == v16)
      {
LABEL_32:
      }
      else
      {
        int v10 = [(id)v7 isEqualToString:v16];

        if (!v10) {
          goto LABEL_89;
        }
      }
      artistName = v5->_artistName;
      unint64_t v7 = self->_artistName;
      unint64_t v18 = artistName;
      v9 = (void *)v18;
      if (!(v7 | v18)) {
        goto LABEL_39;
      }
      LOBYTE(v10) = 0;
      if (!v7 || !v18) {
        goto LABEL_88;
      }
      if (v7 == v18)
      {
LABEL_39:
      }
      else
      {
        int v10 = [(id)v7 isEqualToString:v18];

        if (!v10) {
          goto LABEL_89;
        }
      }
      genreName = v5->_genreName;
      unint64_t v7 = self->_genreName;
      unint64_t v20 = genreName;
      v9 = (void *)v20;
      if (!(v7 | v20)) {
        goto LABEL_46;
      }
      LOBYTE(v10) = 0;
      if (!v7 || !v20) {
        goto LABEL_88;
      }
      if (v7 == v20)
      {
LABEL_46:
      }
      else
      {
        int v10 = [(id)v7 isEqualToString:v20];

        if (!v10) {
          goto LABEL_89;
        }
      }
      if (!self->_purchased == v5->_purchased) {
        goto LABEL_80;
      }
      syncIdentifier = v5->_syncIdentifier;
      unint64_t v7 = self->_syncIdentifier;
      unint64_t v22 = syncIdentifier;
      v9 = (void *)v22;
      if (!(v7 | v22)) {
        goto LABEL_54;
      }
      LOBYTE(v10) = 0;
      if (!v7 || !v22) {
        goto LABEL_88;
      }
      if (v7 == v22)
      {
LABEL_54:
      }
      else
      {
        int v10 = [(id)v7 isEqualToNumber:v22];

        if (!v10) {
          goto LABEL_89;
        }
      }
      if (self->_storeItemIdentifier != v5->_storeItemIdentifier) {
        goto LABEL_80;
      }
      storeFrontIdentifier = v5->_storeFrontIdentifier;
      unint64_t v7 = self->_storeFrontIdentifier;
      unint64_t v24 = storeFrontIdentifier;
      v9 = (void *)v24;
      if (!(v7 | v24)) {
        goto LABEL_62;
      }
      LOBYTE(v10) = 0;
      if (!v7 || !v24) {
        goto LABEL_88;
      }
      if (v7 == v24)
      {
LABEL_62:
      }
      else
      {
        int v10 = [(id)v7 isEqualToString:v24];

        if (!v10) {
          goto LABEL_89;
        }
      }
      artworkFile = v5->_artworkFile;
      unint64_t v7 = self->_artworkFile;
      unint64_t v26 = artworkFile;
      v9 = (void *)v26;
      if (!(v7 | v26)) {
        goto LABEL_69;
      }
      LOBYTE(v10) = 0;
      if (!v7 || !v26) {
        goto LABEL_88;
      }
      if (v7 == v26)
      {
LABEL_69:
      }
      else
      {
        int v10 = [(id)v7 isEqualToString:v26];

        if (!v10) {
          goto LABEL_89;
        }
      }
      if (llround(self->_duration) != llround(v5->_duration)
        || !self->_protectedContent == v5->_protectedContent
        || !self->_privateTone == v5->_privateTone
        || !self->_ringtone == v5->_ringtone)
      {
LABEL_80:
        LOBYTE(v10) = 0;
LABEL_89:

        goto LABEL_90;
      }
      fadeInDurationNumber = v5->_fadeInDurationNumber;
      unint64_t v7 = self->_fadeInDurationNumber;
      unint64_t v28 = fadeInDurationNumber;
      v9 = (void *)v28;
      if (!(v7 | v28)) {
        goto LABEL_81;
      }
      LOBYTE(v10) = 0;
      if (!v7 || !v28) {
        goto LABEL_88;
      }
      if (v7 == v28)
      {
LABEL_81:
      }
      else
      {
        int v10 = [(id)v7 isEqualToNumber:v28];

        if (!v10) {
          goto LABEL_89;
        }
      }
      fadeOutDurationNumber = self->_fadeOutDurationNumber;
      id v30 = v5->_fadeOutDurationNumber;
      unint64_t v7 = fadeOutDurationNumber;
      unint64_t v31 = v30;
      v9 = (void *)v31;
      if (!(v7 | v31)) {
        goto LABEL_87;
      }
      LOBYTE(v10) = 0;
      if (!v7 || !v31) {
        goto LABEL_88;
      }
      if (v7 == v31) {
LABEL_87:
      }
        LOBYTE(v10) = 1;
      else {
        LOBYTE(v10) = [(id)v7 isEqualToNumber:v31];
      }
LABEL_88:

      goto LABEL_89;
    }
    LOBYTE(v10) = 0;
  }
LABEL_90:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_name hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_filePath hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_albumTitle hash];
  NSUInteger v7 = [(NSString *)self->_artistName hash];
  NSUInteger v8 = v6 ^ v7 ^ [(NSString *)self->_genreName hash] ^ self->_purchased;
  unint64_t v9 = [(NSNumber *)self->_syncIdentifier hash] ^ self->_storeItemIdentifier;
  NSUInteger v10 = v9 ^ [(NSString *)self->_storeFrontIdentifier hash];
  NSUInteger v11 = v8 ^ v10 ^ [(NSString *)self->_artworkFile hash] ^ self->_protectedContent ^ self->_privateTone ^ llround(self->_duration);
  BOOL ringtone = self->_ringtone;
  uint64_t v13 = ringtone ^ [(NSNumber *)self->_fadeInDurationNumber hash];
  return v11 ^ v13 ^ [(NSNumber *)self->_fadeOutDurationNumber hash];
}

- (BOOL)isDuplicateOfTone:(id)a3
{
  NSUInteger v4 = a3;
  id v5 = v4;
  unint64_t storeItemIdentifier = self->_storeItemIdentifier;
  if (!storeItemIdentifier || ((uint64_t v7 = v4[9]) != 0 ? (v8 = storeItemIdentifier == v7) : (v8 = 0), !v8))
  {
    unint64_t v9 = (void *)v4[3];
    NSUInteger v10 = self->_name;
    unint64_t v11 = v9;
    unint64_t v12 = (void *)v11;
    if (!((unint64_t)v10 | v11)) {
      goto LABEL_12;
    }
    if (!v10 || !v11) {
      goto LABEL_34;
    }
    if (v10 == (NSString *)v11)
    {
LABEL_12:
    }
    else
    {
      BOOL v13 = [(NSString *)v10 isEqualToString:v11];

      if (!v13) {
        goto LABEL_35;
      }
    }
    unint64_t v14 = (void *)*((void *)v5 + 4);
    NSUInteger v10 = self->_albumTitle;
    unint64_t v15 = v14;
    unint64_t v12 = (void *)v15;
    if (!((unint64_t)v10 | v15)) {
      goto LABEL_20;
    }
    if (!v10 || !v15) {
      goto LABEL_34;
    }
    if (v10 == (NSString *)v15)
    {
LABEL_20:
    }
    else
    {
      BOOL v16 = [(NSString *)v10 isEqualToString:v15];

      if (!v16) {
        goto LABEL_35;
      }
    }
    unint64_t v18 = (void *)*((void *)v5 + 5);
    NSUInteger v10 = self->_artistName;
    unint64_t v19 = v18;
    unint64_t v12 = (void *)v19;
    if (!((unint64_t)v10 | v19)) {
      goto LABEL_27;
    }
    if (!v10 || !v19) {
      goto LABEL_34;
    }
    if (v10 == (NSString *)v19)
    {
LABEL_27:
    }
    else
    {
      BOOL v20 = [(NSString *)v10 isEqualToString:v19];

      if (!v20) {
        goto LABEL_35;
      }
    }
    double v21 = (void *)*((void *)v5 + 6);
    NSUInteger v10 = self->_genreName;
    unint64_t v22 = v21;
    unint64_t v12 = (void *)v22;
    if (!((unint64_t)v10 | v22)) {
      goto LABEL_37;
    }
    if (v10 && v22)
    {
      if (v10 != (NSString *)v22)
      {
        BOOL v23 = [(NSString *)v10 isEqualToString:v22];

        if (v23) {
          goto LABEL_38;
        }
LABEL_35:
        BOOL v17 = 0;
        goto LABEL_36;
      }
LABEL_37:

LABEL_38:
      if (!self->_purchased != (*((unsigned char *)v5 + 8) != 0)
        && !self->_privateTone != (*((unsigned char *)v5 + 11) != 0)
        && !self->_ringtone != (*((unsigned char *)v5 + 9) != 0))
      {
        BOOL v17 = llround(self->_duration) == llround(*((double *)v5 + 12));
        goto LABEL_36;
      }
      goto LABEL_35;
    }
LABEL_34:

    goto LABEL_35;
  }
  BOOL v17 = 1;
LABEL_36:

  return v17;
}

+ (id)_identifierForPropertyListRepresentation:(id)a3
{
  NSUInteger v3 = [a3 objectForKey:@"GUID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    NSUInteger v4 = v3;
  }
  else {
    NSUInteger v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    NSUInteger v6 = [@"itunes:" stringByAppendingString:v5];
  }
  else
  {
    NSUInteger v6 = 0;
  }

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (NSString)genreName
{
  return self->_genreName;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (NSNumber)syncIdentifier
{
  return self->_syncIdentifier;
}

- (unint64_t)storeItemIdentifier
{
  return self->_storeItemIdentifier;
}

- (NSString)storeFrontIdentifier
{
  return self->_storeFrontIdentifier;
}

- (BOOL)isPurchased
{
  return self->_purchased;
}

- (BOOL)isRingtone
{
  return self->_ringtone;
}

- (NSString)artworkFile
{
  return self->_artworkFile;
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)isProtectedContent
{
  return self->_protectedContent;
}

- (BOOL)isPrivateTone
{
  return self->_privateTone;
}

- (NSNumber)fadeInDurationNumber
{
  return self->_fadeInDurationNumber;
}

- (NSNumber)fadeOutDurationNumber
{
  return self->_fadeOutDurationNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fadeOutDurationNumber, 0);
  objc_storeStrong((id *)&self->_fadeInDurationNumber, 0);
  objc_storeStrong((id *)&self->_artworkFile, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
  objc_storeStrong((id *)&self->_syncIdentifier, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_genreName, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_albumTitle, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithPropertyListRepresentation:(NSObject *)a3 filePath:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = objc_opt_class();
  id v6 = v5;
  uint64_t v7 = [a2 allKeys];
  int v8 = 138543618;
  unint64_t v9 = v5;
  __int16 v10 = 2114;
  unint64_t v11 = v7;
  _os_log_error_impl(&dword_1DB936000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Returning nil from initializer because of a missing identifier. Available keys in property list representation: %{public}@.", (uint8_t *)&v8, 0x16u);
}

@end