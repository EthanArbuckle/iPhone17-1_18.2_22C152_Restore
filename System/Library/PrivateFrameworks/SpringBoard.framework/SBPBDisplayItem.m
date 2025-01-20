@interface SBPBDisplayItem
- (BOOL)hasSceneIdentifier;
- (BOOL)hasWebClipIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (__CFString)typeAsString:(__CFString *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)StringAsType:(uint64_t)a1;
- (uint64_t)bundleIdentifier;
- (uint64_t)sceneIdentifier;
- (uint64_t)setType:(uint64_t)result;
- (uint64_t)type;
- (uint64_t)webClipIdentifier;
- (unint64_t)hash;
- (void)copyTo:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)setBundleIdentifier:(uint64_t)a1;
- (void)setSceneIdentifier:(uint64_t)a1;
- (void)setWebClipIdentifier:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation SBPBDisplayItem

- (__CFString)typeAsString:(__CFString *)a1
{
  if (a1)
  {
    if (a2 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = off_1E6B00A58[(int)a2];
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)StringAsType:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    id v5 = v3;
    if ([v5 isEqualToString:@"App"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"HomeScreen"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"RemoteAlert"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"SwitcherService"])
    {
      uint64_t v6 = 3;
    }
    else if ([v5 isEqualToString:@"ContinuityApp"])
    {
      uint64_t v6 = 4;
    }
    else if ([v5 isEqualToString:@"WebApp"])
    {
      uint64_t v6 = 5;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)hasSceneIdentifier
{
  if (result) {
    return *(void *)(result + 16) != 0;
  }
  return result;
}

- (BOOL)hasWebClipIdentifier
{
  if (result) {
    return *(void *)(result + 32) != 0;
  }
  return result;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SBPBDisplayItem;
  v4 = [(SBPBDisplayItem *)&v8 description];
  id v5 = [(SBPBDisplayItem *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t type = self->_type;
  if (type >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = off_1E6B00A58[type];
  }
  [v3 setObject:v5 forKey:@"type"];

  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier) {
    [v3 setObject:bundleIdentifier forKey:@"bundleIdentifier"];
  }
  sceneIdentifier = self->_sceneIdentifier;
  if (sceneIdentifier) {
    [v3 setObject:sceneIdentifier forKey:@"sceneIdentifier"];
  }
  webClipIdentifier = self->_webClipIdentifier;
  if (webClipIdentifier) {
    [v3 setObject:webClipIdentifier forKey:@"webClipIdentifier"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SBPBDisplayItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  if (!self->_bundleIdentifier) {
    -[SBPBDisplayItem writeTo:]();
  }
  PBDataWriterWriteStringField();
  if (self->_sceneIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_webClipIdentifier) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v3[6] = *(_DWORD *)(a1 + 24);
    uint64_t v6 = v3;
    -[SBPBDisplayItem setBundleIdentifier:]((uint64_t)v3, *(void **)(a1 + 8));
    id v4 = *(void **)(a1 + 16);
    if (v4) {
      -[SBPBDisplayItem setSceneIdentifier:]((uint64_t)v6, v4);
    }
    id v5 = *(void **)(a1 + 32);
    id v3 = v6;
    if (v5)
    {
      -[SBPBDisplayItem setWebClipIdentifier:]((uint64_t)v6, v5);
      id v3 = v6;
    }
  }
}

- (void)setBundleIdentifier:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (void)setSceneIdentifier:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (void)setWebClipIdentifier:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 24) = self->_type;
  uint64_t v6 = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSString *)self->_sceneIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  uint64_t v10 = [(NSString *)self->_webClipIdentifier copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_type == *((_DWORD *)v4 + 6)
    && ((bundleIdentifier = self->_bundleIdentifier, !((unint64_t)bundleIdentifier | v4[1]))
     || -[NSString isEqual:](bundleIdentifier, "isEqual:"))
    && ((sceneIdentifier = self->_sceneIdentifier, !((unint64_t)sceneIdentifier | v4[2]))
     || -[NSString isEqual:](sceneIdentifier, "isEqual:")))
  {
    webClipIdentifier = self->_webClipIdentifier;
    if ((unint64_t)webClipIdentifier | v4[4]) {
      char v8 = -[NSString isEqual:](webClipIdentifier, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = 2654435761 * self->_type;
  NSUInteger v4 = [(NSString *)self->_bundleIdentifier hash];
  NSUInteger v5 = v4 ^ [(NSString *)self->_sceneIdentifier hash];
  return v5 ^ [(NSString *)self->_webClipIdentifier hash] ^ v3;
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v3 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 24) = v3[6];
    NSUInteger v4 = (void *)*((void *)v3 + 1);
    v7 = v3;
    if (v4)
    {
      objc_storeStrong((id *)(a1 + 8), v4);
      uint64_t v3 = v7;
    }
    NSUInteger v5 = (void *)*((void *)v3 + 2);
    if (v5)
    {
      objc_storeStrong((id *)(a1 + 16), v5);
      uint64_t v3 = v7;
    }
    uint64_t v6 = (void *)*((void *)v3 + 4);
    if (v6)
    {
      objc_storeStrong((id *)(a1 + 32), v6);
      uint64_t v3 = v7;
    }
  }
}

- (uint64_t)type
{
  if (result) {
    return *(unsigned int *)(result + 24);
  }
  return result;
}

- (uint64_t)setType:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 24) = a2;
  }
  return result;
}

- (uint64_t)bundleIdentifier
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (uint64_t)sceneIdentifier
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (uint64_t)webClipIdentifier
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webClipIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SBPBDisplayItem writeTo:]", "SBPBDisplayItem.m", 121, "nil != self->_bundleIdentifier");
}

@end