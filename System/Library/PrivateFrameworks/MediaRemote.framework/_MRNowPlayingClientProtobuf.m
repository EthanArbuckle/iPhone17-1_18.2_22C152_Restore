@interface _MRNowPlayingClientProtobuf
+ (Class)extendedBundleIdentifierHierarchyType;
- (BOOL)hasBundleIdentifier;
- (BOOL)hasDisplayName;
- (BOOL)hasIconURL;
- (BOOL)hasIsEmptyDeprecated;
- (BOOL)hasNowPlayingVisibility;
- (BOOL)hasParentApplicationBundleIdentifier;
- (BOOL)hasProcessIdentifier;
- (BOOL)hasProcessUserIdentifier;
- (BOOL)hasTintColor;
- (BOOL)isEmptyDeprecated;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)extendedBundleIdentifierHierarchys;
- (NSString)bundleIdentifier;
- (NSString)displayName;
- (NSString)iconURL;
- (NSString)parentApplicationBundleIdentifier;
- (_MRColorProtobuf)tintColor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)extendedBundleIdentifierHierarchyAtIndex:(unint64_t)a3;
- (id)nowPlayingVisibilityAsString:(int)a3;
- (int)StringAsNowPlayingVisibility:(id)a3;
- (int)nowPlayingVisibility;
- (int)processIdentifier;
- (int)processUserIdentifier;
- (unint64_t)extendedBundleIdentifierHierarchysCount;
- (unint64_t)hash;
- (void)addExtendedBundleIdentifierHierarchy:(id)a3;
- (void)clearExtendedBundleIdentifierHierarchys;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setExtendedBundleIdentifierHierarchys:(id)a3;
- (void)setHasIsEmptyDeprecated:(BOOL)a3;
- (void)setHasNowPlayingVisibility:(BOOL)a3;
- (void)setHasProcessIdentifier:(BOOL)a3;
- (void)setHasProcessUserIdentifier:(BOOL)a3;
- (void)setIconURL:(id)a3;
- (void)setIsEmptyDeprecated:(BOOL)a3;
- (void)setNowPlayingVisibility:(int)a3;
- (void)setParentApplicationBundleIdentifier:(id)a3;
- (void)setProcessIdentifier:(int)a3;
- (void)setProcessUserIdentifier:(int)a3;
- (void)setTintColor:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRNowPlayingClientProtobuf

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_parentApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_extendedBundleIdentifierHierarchys, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)setHasProcessUserIdentifier:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setTintColor:(id)a3
{
}

- (void)setProcessUserIdentifier:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_processUserIdentifier = a3;
}

- (void)setProcessIdentifier:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_processIdentifier = a3;
}

- (void)setParentApplicationBundleIdentifier:(id)a3
{
}

- (void)setNowPlayingVisibility:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_nowPlayingVisibility = a3;
}

- (void)setIconURL:(id)a3
{
}

- (void)setHasProcessIdentifier:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setHasNowPlayingVisibility:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setExtendedBundleIdentifierHierarchys:(id)a3
{
}

- (void)setDisplayName:(id)a3
{
}

- (void)setBundleIdentifier:(id)a3
{
}

- (_MRColorProtobuf)tintColor
{
  return self->_tintColor;
}

- (int)processUserIdentifier
{
  return self->_processUserIdentifier;
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (NSString)parentApplicationBundleIdentifier
{
  return self->_parentApplicationBundleIdentifier;
}

- (int)nowPlayingVisibility
{
  if (*(unsigned char *)&self->_has) {
    return self->_nowPlayingVisibility;
  }
  else {
    return 0;
  }
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)hasIconURL
{
  return self->_iconURL != 0;
}

- (NSMutableArray)extendedBundleIdentifierHierarchys
{
  return self->_extendedBundleIdentifierHierarchys;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_bundleIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_parentApplicationBundleIdentifier) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_tintColor) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_displayName) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_extendedBundleIdentifierHierarchys;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_iconURL) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)hasProcessIdentifier
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0;
}

- (BOOL)hasParentApplicationBundleIdentifier
{
  return self->_parentApplicationBundleIdentifier != 0;
}

- (BOOL)hasProcessUserIdentifier
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasNowPlayingVisibility
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)nowPlayingVisibilityAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E57D71E8[a3];
  }

  return v3;
}

- (int)StringAsNowPlayingVisibility:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Undefined"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AlwaysVisible"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"VisibleWhenBackgrounded"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NeverVisible"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasTintColor
{
  return self->_tintColor != 0;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (void)clearExtendedBundleIdentifierHierarchys
{
}

- (void)addExtendedBundleIdentifierHierarchy:(id)a3
{
  id v4 = a3;
  extendedBundleIdentifierHierarchys = self->_extendedBundleIdentifierHierarchys;
  id v8 = v4;
  if (!extendedBundleIdentifierHierarchys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_extendedBundleIdentifierHierarchys;
    self->_extendedBundleIdentifierHierarchys = v6;

    id v4 = v8;
    extendedBundleIdentifierHierarchys = self->_extendedBundleIdentifierHierarchys;
  }
  [(NSMutableArray *)extendedBundleIdentifierHierarchys addObject:v4];
}

- (unint64_t)extendedBundleIdentifierHierarchysCount
{
  return [(NSMutableArray *)self->_extendedBundleIdentifierHierarchys count];
}

- (id)extendedBundleIdentifierHierarchyAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_extendedBundleIdentifierHierarchys objectAtIndex:a3];
}

+ (Class)extendedBundleIdentifierHierarchyType
{
  return (Class)objc_opt_class();
}

- (void)setIsEmptyDeprecated:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isEmptyDeprecated = a3;
}

- (void)setHasIsEmptyDeprecated:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsEmptyDeprecated
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRNowPlayingClientProtobuf;
  id v4 = [(_MRNowPlayingClientProtobuf *)&v8 description];
  v5 = [(_MRNowPlayingClientProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    id v4 = [NSNumber numberWithInt:self->_processIdentifier];
    [v3 setObject:v4 forKey:@"processIdentifier"];
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier) {
    [v3 setObject:bundleIdentifier forKey:@"bundleIdentifier"];
  }
  parentApplicationBundleIdentifier = self->_parentApplicationBundleIdentifier;
  if (parentApplicationBundleIdentifier) {
    [v3 setObject:parentApplicationBundleIdentifier forKey:@"parentApplicationBundleIdentifier"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_super v8 = [NSNumber numberWithInt:self->_processUserIdentifier];
    [v3 setObject:v8 forKey:@"processUserIdentifier"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t nowPlayingVisibility = self->_nowPlayingVisibility;
    if (nowPlayingVisibility >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_nowPlayingVisibility);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E57D71E8[nowPlayingVisibility];
    }
    [v3 setObject:v10 forKey:@"nowPlayingVisibility"];
  }
  tintColor = self->_tintColor;
  if (tintColor)
  {
    long long v12 = [(_MRColorProtobuf *)tintColor dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"tintColor"];
  }
  displayName = self->_displayName;
  if (displayName) {
    [v3 setObject:displayName forKey:@"displayName"];
  }
  extendedBundleIdentifierHierarchys = self->_extendedBundleIdentifierHierarchys;
  if (extendedBundleIdentifierHierarchys) {
    [v3 setObject:extendedBundleIdentifierHierarchys forKey:@"extendedBundleIdentifierHierarchy"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v15 = [NSNumber numberWithBool:self->_isEmptyDeprecated];
    [v3 setObject:v15 forKey:@"isEmptyDeprecated"];
  }
  iconURL = self->_iconURL;
  if (iconURL) {
    [v3 setObject:iconURL forKey:@"iconURL"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRNowPlayingClientProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[14] = self->_processIdentifier;
    *((unsigned char *)v4 + 76) |= 2u;
  }
  long long v11 = v4;
  if (self->_bundleIdentifier)
  {
    objc_msgSend(v4, "setBundleIdentifier:");
    id v4 = v11;
  }
  if (self->_parentApplicationBundleIdentifier)
  {
    objc_msgSend(v11, "setParentApplicationBundleIdentifier:");
    id v4 = v11;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[15] = self->_processUserIdentifier;
    *((unsigned char *)v4 + 76) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[10] = self->_nowPlayingVisibility;
    *((unsigned char *)v4 + 76) |= 1u;
  }
  if (self->_tintColor) {
    objc_msgSend(v11, "setTintColor:");
  }
  if (self->_displayName) {
    objc_msgSend(v11, "setDisplayName:");
  }
  if ([(_MRNowPlayingClientProtobuf *)self extendedBundleIdentifierHierarchysCount])
  {
    [v11 clearExtendedBundleIdentifierHierarchys];
    unint64_t v6 = [(_MRNowPlayingClientProtobuf *)self extendedBundleIdentifierHierarchysCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(_MRNowPlayingClientProtobuf *)self extendedBundleIdentifierHierarchyAtIndex:i];
        [v11 addExtendedBundleIdentifierHierarchy:v9];
      }
    }
  }
  v10 = v11;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v11[72] = self->_isEmptyDeprecated;
    v11[76] |= 8u;
  }
  if (self->_iconURL)
  {
    objc_msgSend(v11, "setIconURL:");
    v10 = v11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_processIdentifier;
    *(unsigned char *)(v5 + 76) |= 2u;
  }
  uint64_t v7 = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v7;

  uint64_t v9 = [(NSString *)self->_parentApplicationBundleIdentifier copyWithZone:a3];
  v10 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v9;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 60) = self->_processUserIdentifier;
    *(unsigned char *)(v6 + 76) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v6 + 40) = self->_nowPlayingVisibility;
    *(unsigned char *)(v6 + 76) |= 1u;
  }
  id v12 = [(_MRColorProtobuf *)self->_tintColor copyWithZone:a3];
  long long v13 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v12;

  uint64_t v14 = [(NSString *)self->_displayName copyWithZone:a3];
  v15 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v14;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v16 = self->_extendedBundleIdentifierHierarchys;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "copyWithZone:", a3, (void)v25);
        [(id)v6 addExtendedBundleIdentifierHierarchy:v21];
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v18);
  }

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(unsigned char *)(v6 + 72) = self->_isEmptyDeprecated;
    *(unsigned char *)(v6 + 76) |= 8u;
  }
  uint64_t v22 = -[NSString copyWithZone:](self->_iconURL, "copyWithZone:", a3, (void)v25);
  v23 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v22;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_processIdentifier != *((_DWORD *)v4 + 14)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
    goto LABEL_31;
  }
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((void *)v4 + 1)
    && !-[NSString isEqual:](bundleIdentifier, "isEqual:"))
  {
    goto LABEL_31;
  }
  parentApplicationBundleIdentifier = self->_parentApplicationBundleIdentifier;
  if ((unint64_t)parentApplicationBundleIdentifier | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](parentApplicationBundleIdentifier, "isEqual:")) {
      goto LABEL_31;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 4) == 0 || self->_processUserIdentifier != *((_DWORD *)v4 + 15)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 4) != 0)
  {
    goto LABEL_31;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_nowPlayingVisibility != *((_DWORD *)v4 + 10)) {
      goto LABEL_31;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
    goto LABEL_31;
  }
  tintColor = self->_tintColor;
  if ((unint64_t)tintColor | *((void *)v4 + 8) && !-[_MRColorProtobuf isEqual:](tintColor, "isEqual:")) {
    goto LABEL_31;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_31;
    }
  }
  extendedBundleIdentifierHierarchys = self->_extendedBundleIdentifierHierarchys;
  if ((unint64_t)extendedBundleIdentifierHierarchys | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](extendedBundleIdentifierHierarchys, "isEqual:")) {
      goto LABEL_31;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    if ((*((unsigned char *)v4 + 76) & 8) == 0) {
      goto LABEL_37;
    }
LABEL_31:
    char v10 = 0;
    goto LABEL_32;
  }
  if ((*((unsigned char *)v4 + 76) & 8) == 0) {
    goto LABEL_31;
  }
  if (!self->_isEmptyDeprecated)
  {
    if (!*((unsigned char *)v4 + 72)) {
      goto LABEL_37;
    }
    goto LABEL_31;
  }
  if (!*((unsigned char *)v4 + 72)) {
    goto LABEL_31;
  }
LABEL_37:
  iconURL = self->_iconURL;
  if ((unint64_t)iconURL | *((void *)v4 + 4)) {
    char v10 = -[NSString isEqual:](iconURL, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_32:

  return v10;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_processIdentifier;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_bundleIdentifier hash];
  NSUInteger v5 = [(NSString *)self->_parentApplicationBundleIdentifier hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v6 = 2654435761 * self->_processUserIdentifier;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if (*(unsigned char *)&self->_has)
    {
LABEL_6:
      uint64_t v7 = 2654435761 * self->_nowPlayingVisibility;
      goto LABEL_9;
    }
  }
  uint64_t v7 = 0;
LABEL_9:
  unint64_t v8 = [(_MRColorProtobuf *)self->_tintColor hash];
  NSUInteger v9 = [(NSString *)self->_displayName hash];
  uint64_t v10 = [(NSMutableArray *)self->_extendedBundleIdentifierHierarchys hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v11 = 2654435761 * self->_isEmptyDeprecated;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(NSString *)self->_iconURL hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  NSUInteger v4 = a3;
  id v5 = v4;
  if ((v4[19] & 2) != 0)
  {
    self->_processIdentifier = v4[14];
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 1)) {
    -[_MRNowPlayingClientProtobuf setBundleIdentifier:](self, "setBundleIdentifier:");
  }
  if (*((void *)v5 + 6)) {
    -[_MRNowPlayingClientProtobuf setParentApplicationBundleIdentifier:](self, "setParentApplicationBundleIdentifier:");
  }
  char v6 = *((unsigned char *)v5 + 76);
  if ((v6 & 4) != 0)
  {
    self->_processUserIdentifier = *((_DWORD *)v5 + 15);
    *(unsigned char *)&self->_has |= 4u;
    char v6 = *((unsigned char *)v5 + 76);
  }
  if (v6)
  {
    self->_uint64_t nowPlayingVisibility = *((_DWORD *)v5 + 10);
    *(unsigned char *)&self->_has |= 1u;
  }
  tintColor = self->_tintColor;
  uint64_t v8 = *((void *)v5 + 8);
  if (tintColor)
  {
    if (v8) {
      -[_MRColorProtobuf mergeFrom:](tintColor, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[_MRNowPlayingClientProtobuf setTintColor:](self, "setTintColor:");
  }
  if (*((void *)v5 + 2)) {
    -[_MRNowPlayingClientProtobuf setDisplayName:](self, "setDisplayName:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = *((id *)v5 + 3);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[_MRNowPlayingClientProtobuf addExtendedBundleIdentifierHierarchy:](self, "addExtendedBundleIdentifierHierarchy:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }

  if ((*((unsigned char *)v5 + 76) & 8) != 0)
  {
    self->_isEmptyDeprecated = *((unsigned char *)v5 + 72);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v5 + 4)) {
    -[_MRNowPlayingClientProtobuf setIconURL:](self, "setIconURL:");
  }
}

- (BOOL)isEmptyDeprecated
{
  return self->_isEmptyDeprecated;
}

- (NSString)iconURL
{
  return self->_iconURL;
}

@end