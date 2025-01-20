@interface NRPBPropertiesChanged
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NRPBPropertiesChanged

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NRPBPropertiesChanged;
  v3 = [(NRPBPropertiesChanged *)&v7 description];
  v4 = [(NRPBPropertiesChanged *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = +[NSNumber numberWithBool:self->_thisIsAllOfThem];
  [v3 setObject:v4 forKey:@"thisIsAllOfThem"];

  if ([(NSMutableArray *)self->_properties count])
  {
    id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_properties, "count")];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v6 = self->_properties;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) dictionaryRepresentation:v14];
          [v5 addObject:v11];
        }
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"properties"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v12 = +[NSNumber numberWithDouble:self->_bornOn];
    [v3 setObject:v12 forKey:@"bornOn"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100051F58((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteBOOLField();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_properties;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      id v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[[objc_opt_class() allocWithZone:a3] init];
  v5[24] = self->_thisIsAllOfThem;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = self->_properties;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) copyWithZone:a3];
        sub_100051BF4((uint64_t)v5, v11);

        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if (*(unsigned char *)&self->_has)
  {
    *((void *)v5 + 1) = *(void *)&self->_bornOn;
    v5[28] |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  if (self->_thisIsAllOfThem)
  {
    if (!*((unsigned char *)v4 + 24)) {
      goto LABEL_12;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_12:
    BOOL v6 = 0;
    goto LABEL_13;
  }
  properties = self->_properties;
  if ((unint64_t)properties | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](properties, "isEqual:"))
  {
    goto LABEL_12;
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_bornOn != *((double *)v4 + 1)) {
      goto LABEL_12;
    }
    BOOL v6 = 1;
  }
LABEL_13:

  return v6;
}

- (unint64_t)hash
{
  BOOL thisIsAllOfThem = self->_thisIsAllOfThem;
  unint64_t v4 = (unint64_t)[(NSMutableArray *)self->_properties hash];
  if (*(unsigned char *)&self->_has)
  {
    double bornOn = self->_bornOn;
    double v7 = -bornOn;
    if (bornOn >= 0.0) {
      double v7 = self->_bornOn;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v4 ^ v5 ^ (2654435761 * thisIsAllOfThem);
}

- (void).cxx_destruct
{
}

@end