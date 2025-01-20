@interface ATXPBProactiveSuggestionExecutableSpecification
- (BOOL)hasExecutable;
- (BOOL)hasExecutableClassString;
- (BOOL)hasExecutableDescription;
- (BOOL)hasExecutableIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (__CFString)executableTypeAsString:(__CFString *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)StringAsExecutableType:(uint64_t)a1;
- (uint64_t)executable;
- (uint64_t)executableClassString;
- (uint64_t)executableDescription;
- (uint64_t)executableIdentifier;
- (uint64_t)executableObjectHash;
- (uint64_t)executableType;
- (uint64_t)hasExecutableObjectHash;
- (uint64_t)hasExecutableType;
- (uint64_t)setExecutableObjectHash:(uint64_t)result;
- (uint64_t)setExecutableType:(uint64_t)result;
- (uint64_t)setHasExecutableObjectHash:(uint64_t)result;
- (uint64_t)setHasExecutableType:(uint64_t)result;
- (unint64_t)hash;
- (void)copyTo:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)setExecutable:(uint64_t)a1;
- (void)setExecutableClassString:(uint64_t)a1;
- (void)setExecutableDescription:(uint64_t)a1;
- (void)setExecutableIdentifier:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBProactiveSuggestionExecutableSpecification

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executableIdentifier, 0);
  objc_storeStrong((id *)&self->_executableDescription, 0);
  objc_storeStrong((id *)&self->_executableClassString, 0);
  objc_storeStrong((id *)&self->_executable, 0);
}

- (uint64_t)executable
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (uint64_t)executableObjectHash
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (uint64_t)executableDescription
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (uint64_t)executableClassString
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (uint64_t)executableType
{
  if (result)
  {
    if ((*(unsigned char *)(result + 52) & 2) != 0) {
      return *(unsigned int *)(result + 48);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)executableIdentifier
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (BOOL)hasExecutable
{
  if (result) {
    return *(void *)(result + 16) != 0;
  }
  return result;
}

- (uint64_t)setExecutableObjectHash:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 52) |= 1u;
    *(void *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasExecutableObjectHash:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 52) = *(unsigned char *)(result + 52) & 0xFE | a2;
  }
  return result;
}

- (uint64_t)hasExecutableObjectHash
{
  if (result) {
    return *(unsigned char *)(result + 52) & 1;
  }
  return result;
}

- (BOOL)hasExecutableClassString
{
  if (result) {
    return *(void *)(result + 24) != 0;
  }
  return result;
}

- (BOOL)hasExecutableDescription
{
  if (result) {
    return *(void *)(result + 32) != 0;
  }
  return result;
}

- (BOOL)hasExecutableIdentifier
{
  if (result) {
    return *(void *)(result + 40) != 0;
  }
  return result;
}

- (uint64_t)setExecutableType:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 52) |= 2u;
    *(_DWORD *)(result + 48) = a2;
  }
  return result;
}

- (uint64_t)setHasExecutableType:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 2;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 52) = *(unsigned char *)(result + 52) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasExecutableType
{
  if (result) {
    return (*(unsigned __int8 *)(result + 52) >> 1) & 1;
  }
  return result;
}

- (__CFString)executableTypeAsString:(__CFString *)a1
{
  if (a1)
  {
    if (a2 >= 0xB)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = off_1E5F01060[(int)a2];
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)StringAsExecutableType:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    id v5 = v3;
    if ([v5 isEqualToString:@"Unknown"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"App"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"Action"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"Widget"])
    {
      uint64_t v6 = 3;
    }
    else if ([v5 isEqualToString:@"Tip"])
    {
      uint64_t v6 = 4;
    }
    else if ([v5 isEqualToString:@"AppClip"])
    {
      uint64_t v6 = 5;
    }
    else if ([v5 isEqualToString:@"Interaction"])
    {
      uint64_t v6 = 6;
    }
    else if ([v5 isEqualToString:@"ContextualAction"])
    {
      uint64_t v6 = 7;
    }
    else if ([v5 isEqualToString:@"SpotlightAction"])
    {
      uint64_t v6 = 8;
    }
    else if ([v5 isEqualToString:@"ShortcutsAction"])
    {
      uint64_t v6 = 9;
    }
    else if ([v5 isEqualToString:@"LinkAction"])
    {
      uint64_t v6 = 10;
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBProactiveSuggestionExecutableSpecification;
  v4 = [(ATXPBProactiveSuggestionExecutableSpecification *)&v8 description];
  id v5 = [(ATXPBProactiveSuggestionExecutableSpecification *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  executable = self->_executable;
  if (executable) {
    [v3 setObject:executable forKey:@"executable"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = [NSNumber numberWithUnsignedLongLong:self->_executableObjectHash];
    [v4 setObject:v6 forKey:@"executableObjectHash"];
  }
  executableClassString = self->_executableClassString;
  if (executableClassString) {
    [v4 setObject:executableClassString forKey:@"executableClassString"];
  }
  executableDescription = self->_executableDescription;
  if (executableDescription) {
    [v4 setObject:executableDescription forKey:@"executableDescription"];
  }
  executableIdentifier = self->_executableIdentifier;
  if (executableIdentifier) {
    [v4 setObject:executableIdentifier forKey:@"executableIdentifier"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t executableType = self->_executableType;
    if (executableType >= 0xB)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_executableType);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E5F01060[executableType];
    }
    [v4 setObject:v11 forKey:@"executableType"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBProactiveSuggestionExecutableSpecificationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_executable)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_executableClassString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_executableDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_executableIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 16);
    id v8 = v3;
    if (v4)
    {
      -[ATXPBProactiveSuggestionExecutableSpecification setExecutable:]((uint64_t)v3, v4);
      id v3 = v8;
    }
    if (*(unsigned char *)(a1 + 52))
    {
      *((void *)v3 + 1) = *(void *)(a1 + 8);
      *((unsigned char *)v3 + 52) |= 1u;
    }
    id v5 = *(void **)(a1 + 24);
    if (v5)
    {
      -[ATXPBProactiveSuggestionExecutableSpecification setExecutableClassString:]((uint64_t)v8, v5);
      id v3 = v8;
    }
    uint64_t v6 = *(void **)(a1 + 32);
    if (v6)
    {
      -[ATXPBProactiveSuggestionExecutableSpecification setExecutableDescription:]((uint64_t)v8, v6);
      id v3 = v8;
    }
    v7 = *(void **)(a1 + 40);
    if (v7)
    {
      -[ATXPBProactiveSuggestionExecutableSpecification setExecutableIdentifier:]((uint64_t)v8, v7);
      id v3 = v8;
    }
    if ((*(unsigned char *)(a1 + 52) & 2) != 0)
    {
      *((_DWORD *)v3 + 12) = *(_DWORD *)(a1 + 48);
      *((unsigned char *)v3 + 52) |= 2u;
    }
  }
}

- (void)setExecutable:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (void)setExecutableClassString:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)setExecutableDescription:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)setExecutableIdentifier:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_executable copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_executableObjectHash;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_executableClassString copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_executableDescription copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  uint64_t v12 = [(NSString *)self->_executableIdentifier copyWithZone:a3];
  v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_executableType;
    *(unsigned char *)(v5 + 52) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  executable = self->_executable;
  if ((unint64_t)executable | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](executable, "isEqual:")) {
      goto LABEL_19;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_executableObjectHash != *((void *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
LABEL_19:
    BOOL v9 = 0;
    goto LABEL_20;
  }
  executableClassString = self->_executableClassString;
  if ((unint64_t)executableClassString | *((void *)v4 + 3)
    && !-[NSString isEqual:](executableClassString, "isEqual:"))
  {
    goto LABEL_19;
  }
  executableDescription = self->_executableDescription;
  if ((unint64_t)executableDescription | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](executableDescription, "isEqual:")) {
      goto LABEL_19;
    }
  }
  executableIdentifier = self->_executableIdentifier;
  if ((unint64_t)executableIdentifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](executableIdentifier, "isEqual:")) {
      goto LABEL_19;
    }
  }
  BOOL v9 = (*((unsigned char *)v4 + 52) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_executableType != *((_DWORD *)v4 + 12)) {
      goto LABEL_19;
    }
    BOOL v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_executable hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v4 = 2654435761u * self->_executableObjectHash;
  }
  else {
    unint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_executableClassString hash];
  NSUInteger v6 = [(NSString *)self->_executableDescription hash];
  NSUInteger v7 = [(NSString *)self->_executableIdentifier hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_executableType;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v3 = a2;
  if (a1)
  {
    unint64_t v4 = (void *)v3[2];
    uint64_t v8 = v3;
    if (v4)
    {
      objc_storeStrong((id *)(a1 + 16), v4);
      uint64_t v3 = v8;
    }
    if (*((unsigned char *)v3 + 52))
    {
      *(void *)(a1 + 8) = v3[1];
      *(unsigned char *)(a1 + 52) |= 1u;
    }
    NSUInteger v5 = (void *)v3[3];
    if (v5)
    {
      objc_storeStrong((id *)(a1 + 24), v5);
      uint64_t v3 = v8;
    }
    NSUInteger v6 = (void *)v3[4];
    if (v6)
    {
      objc_storeStrong((id *)(a1 + 32), v6);
      uint64_t v3 = v8;
    }
    NSUInteger v7 = (void *)v3[5];
    if (v7)
    {
      objc_storeStrong((id *)(a1 + 40), v7);
      uint64_t v3 = v8;
    }
    if ((*((unsigned char *)v3 + 52) & 2) != 0)
    {
      *(_DWORD *)(a1 + 48) = *((_DWORD *)v3 + 12);
      *(unsigned char *)(a1 + 52) |= 2u;
    }
  }
}

@end