@interface NSPPrivacyProxyPolicy
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)conditionsAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsConditions:(id)a3;
- (int)conditions;
- (int)conditionsAtIndex:(unint64_t)a3;
- (unint64_t)conditionsCount;
- (unint64_t)hash;
- (void)addConditions:(int)a3;
- (void)clearConditions;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setConditions:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation NSPPrivacyProxyPolicy

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)NSPPrivacyProxyPolicy;
  [(NSPPrivacyProxyPolicy *)&v3 dealloc];
}

- (unint64_t)conditionsCount
{
  return self->_conditions.count;
}

- (int)conditions
{
  return self->_conditions.list;
}

- (void)clearConditions
{
}

- (void)addConditions:(int)a3
{
}

- (int)conditionsAtIndex:(unint64_t)a3
{
  p_conditions = &self->_conditions;
  unint64_t count = self->_conditions.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_conditions->list[a3];
}

- (void)setConditions:(int *)a3 count:(unint64_t)a4
{
}

- (id)conditionsAsString:(int)a3
{
  if (a3 >= 0x1B)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    objc_super v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v3 = off_1E5A3C438[a3];
  }
  return v3;
}

- (int)StringAsConditions:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SAFARI_UNENCRYPTED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SAFARI_DNS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SAFARI_TRACKER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MAIL_TRACKER"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SAFARI_ALL"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SAFARI_HTTP"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ANY_UNENCRYPTED"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"ANY_DNS"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"ANY_KNOWN_TRACKER"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ANY_APP_TRACKER"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"NEWS_URL_RESOLUTION"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"EXPOSURE_NOTIFICATIONS"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"APPLE_CERTIFICATES"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"NETWORK_TOOLS"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"METRICS_UPLOAD"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"BRANDED_CALLING"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"NEWS_EMBEDDED_CONTENT"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"APP_METRICS"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"SAFARI_PRIVATE_UNENCRYPTED"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"SAFARI_PRIVATE_DNS"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"SAFARI_PRIVATE_ALL"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"SAFARI_METRICS"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"PROMOTED_CONTENT"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"POSTBACK_FETCH"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"PM_PR_ICON_FETCHING"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"LAUNCH_WARNING_DETAILS"])
  {
    int v4 = 26;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSPPrivacyProxyPolicy;
  int v4 = [(NSPPrivacyProxyPolicy *)&v8 description];
  v5 = [(NSPPrivacyProxyPolicy *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  p_conditions = &self->_conditions;
  if (self->_conditions.count)
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    if (p_conditions->count)
    {
      unint64_t v6 = 0;
      do
      {
        uint64_t v7 = p_conditions->list[v6];
        if (v7 >= 0x1B)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", p_conditions->list[v6]);
          objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_super v8 = off_1E5A3C438[v7];
        }
        [v5 addObject:v8];

        ++v6;
      }
      while (v6 < p_conditions->count);
    }
    [v3 setObject:v5 forKey:@"conditions"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyPolicyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  p_conditions = &self->_conditions;
  if (p_conditions->count)
  {
    PBDataWriterPlaceMark();
    if (p_conditions->count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v6;
      }
      while (v6 < p_conditions->count);
    }
    PBDataWriterRecallMark();
  }
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  if ([(NSPPrivacyProxyPolicy *)self conditionsCount])
  {
    [v7 clearConditions];
    unint64_t v4 = [(NSPPrivacyProxyPolicy *)self conditionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v7, "addConditions:", -[NSPPrivacyProxyPolicy conditionsAtIndex:](self, "conditionsAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedInt32Copy();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  if ([v3 isMemberOfClass:objc_opt_class()]) {
    char IsEqual = PBRepeatedInt32IsEqual();
  }
  else {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  return MEMORY[0x1F4147378](&self->_conditions, a2);
}

- (void)mergeFrom:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 conditionsCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[NSPPrivacyProxyPolicy addConditions:](self, "addConditions:", [v7 conditionsAtIndex:i]);
  }
}

@end