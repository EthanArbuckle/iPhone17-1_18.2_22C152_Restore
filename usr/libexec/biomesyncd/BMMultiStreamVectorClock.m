@interface BMMultiStreamVectorClock
+ (BOOL)supportsSecureCoding;
+ (id)deserialize:(id)a3 error:(id *)a4;
- (BMMultiStreamVectorClock)init;
- (BMMultiStreamVectorClock)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)allKeys;
- (id)description;
- (id)serialize:(id *)a3;
- (id)vectorClockForStreamIdentifier:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setVectorClockTo:(id)a3 forStreamIdentifier:(id)a4;
@end

@implementation BMMultiStreamVectorClock

- (BMMultiStreamVectorClock)init
{
  v6.receiver = self;
  v6.super_class = (Class)BMMultiStreamVectorClock;
  v2 = [(BMMultiStreamVectorClock *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    vectorClock = v2->_vectorClock;
    v2->_vectorClock = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)setVectorClockTo:(id)a3 forStreamIdentifier:(id)a4
{
  if (a3)
  {
    if (a4) {
      -[NSMutableDictionary setValue:forKey:](self->_vectorClock, "setValue:forKey:");
    }
  }
}

- (id)vectorClockForStreamIdentifier:(id)a3
{
  if (a3)
  {
    v4 = -[NSMutableDictionary objectForKey:](self->_vectorClock, "objectForKey:");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)allKeys
{
  return [(NSMutableDictionary *)self->_vectorClock allKeys];
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  v4 = [(NSMutableDictionary *)self->_vectorClock description];
  id v5 = [v3 initWithFormat:@"%@", v4];

  return v5;
}

- (unint64_t)hash
{
  id v3 = objc_alloc((Class)NSOrderedSet);
  v4 = [(BMMultiStreamVectorClock *)self allKeys];
  id v5 = [v3 initWithArray:v4];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    unint64_t v10 = 1;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v13 = -[NSMutableDictionary valueForKey:](self->_vectorClock, "valueForKey:", v12, (void)v16);
        unint64_t v14 = (unint64_t)[v12 hash];
        v10 ^= v14 ^ (unint64_t)[v13 hash];
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    unint64_t v10 = 1;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = objc_alloc((Class)NSSet);
    id v6 = [(BMMultiStreamVectorClock *)self allKeys];
    id v7 = [v5 initWithArray:v6];

    id v8 = objc_alloc((Class)NSSet);
    uint64_t v9 = [v4 allKeys];
    id v10 = [v8 initWithArray:v9];

    if ([v7 isEqual:v10])
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v11 = v7;
      id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v12)
      {
        id v13 = v12;
        id v22 = v10;
        uint64_t v14 = *(void *)v24;
        while (2)
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 8 * i);
            long long v17 = [(BMMultiStreamVectorClock *)self vectorClockForStreamIdentifier:v16];
            long long v18 = [v4 vectorClockForStreamIdentifier:v16];
            id v19 = [v17 compareToTimestampVector:v18];

            if (v19)
            {
              BOOL v20 = 0;
              goto LABEL_15;
            }
          }
          id v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v13) {
            continue;
          }
          break;
        }
        BOOL v20 = 1;
LABEL_15:
        id v10 = v22;
      }
      else
      {
        BOOL v20 = 1;
      }
    }
    else
    {
      BOOL v20 = 0;
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BMMultiStreamVectorClock)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BMMultiStreamVectorClock;
  id v5 = [(BMMultiStreamVectorClock *)&v12 init];
  if (v5)
  {
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    id v6 = +[NSArray arrayWithObjects:v13 count:3];
    id v7 = +[NSSet setWithArray:v6];
    id v8 = [v4 decodeObjectOfClasses:v7 forKey:@"vectorClock"];
    uint64_t v9 = (NSMutableDictionary *)[v8 mutableCopy];
    vectorClock = v5->_vectorClock;
    v5->_vectorClock = v9;
  }
  return v5;
}

- (id)serialize:(id *)a3
{
  return +[NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

+ (id)deserialize:(id)a3 error:(id *)a4
{
  if (a3)
  {
    id v5 = a3;
    id v6 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:a4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end