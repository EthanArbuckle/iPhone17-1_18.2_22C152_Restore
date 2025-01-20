@interface STIDSTransportPrimitiveDestinationReachabilityMap
+ (BOOL)supportsSecureCoding;
+ (id)mapFromUnionOfMaps:(id)a3;
- (BOOL)contains:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMap:(id)a3;
- (NSSet)allDestinations;
- (NSSet)reachableDestinations;
- (NSSet)unknownReachabilityDestinations;
- (NSSet)unreachableDestinations;
- (STIDSTransportPrimitiveDestinationReachabilityMap)initWithCoder:(id)a3;
- (STIDSTransportPrimitiveDestinationReachabilityMap)initWithReachableDestinations:(id)a3 unreachableDestinations:(id)a4 unknownReachabilityDestinations:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)intersectWithDestinations:(id)a3;
- (id)merge:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STIDSTransportPrimitiveDestinationReachabilityMap

- (STIDSTransportPrimitiveDestinationReachabilityMap)initWithReachableDestinations:(id)a3 unreachableDestinations:(id)a4 unknownReachabilityDestinations:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)STIDSTransportPrimitiveDestinationReachabilityMap;
  v11 = [(STIDSTransportPrimitiveDestinationReachabilityMap *)&v19 init];
  if (v8) {
    v12 = (NSSet *)[v8 copy];
  }
  else {
    v12 = (NSSet *)objc_opt_new();
  }
  reachableDestinations = v11->_reachableDestinations;
  v11->_reachableDestinations = v12;

  if (v9) {
    v14 = (NSSet *)[v9 copy];
  }
  else {
    v14 = (NSSet *)objc_opt_new();
  }
  unreachableDestinations = v11->_unreachableDestinations;
  v11->_unreachableDestinations = v14;

  if (v10) {
    v16 = (NSSet *)[v10 copy];
  }
  else {
    v16 = (NSSet *)objc_opt_new();
  }
  unknownReachabilityDestinations = v11->_unknownReachabilityDestinations;
  v11->_unknownReachabilityDestinations = v16;

  return v11;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(STIDSTransportPrimitiveDestinationReachabilityMap *)self reachableDestinations];
  v6 = [(STIDSTransportPrimitiveDestinationReachabilityMap *)self unreachableDestinations];
  v7 = [(STIDSTransportPrimitiveDestinationReachabilityMap *)self unknownReachabilityDestinations];
  id v8 = +[NSString stringWithFormat:@"<%@:%p { Reachable: %@, Unreachable: %@, Unknown: %@ }>", v4, self, v5, v6, v7];

  return v8;
}

- (NSSet)allDestinations
{
  v3 = [(STIDSTransportPrimitiveDestinationReachabilityMap *)self reachableDestinations];
  id v4 = [v3 mutableCopy];

  v5 = [(STIDSTransportPrimitiveDestinationReachabilityMap *)self unreachableDestinations];
  [v4 unionSet:v5];

  v6 = [(STIDSTransportPrimitiveDestinationReachabilityMap *)self unknownReachabilityDestinations];
  [v4 unionSet:v6];

  return (NSSet *)v4;
}

- (BOOL)contains:(id)a3
{
  id v4 = a3;
  v5 = [(STIDSTransportPrimitiveDestinationReachabilityMap *)self reachableDestinations];
  unsigned __int8 v6 = [v5 containsObject:v4];

  if ((v6 & 1) != 0
    || ([(STIDSTransportPrimitiveDestinationReachabilityMap *)self unreachableDestinations],
        v7 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v8 = [v7 containsObject:v4],
        v7,
        (v8 & 1) != 0))
  {
    unsigned __int8 v9 = 1;
  }
  else
  {
    id v10 = [(STIDSTransportPrimitiveDestinationReachabilityMap *)self unknownReachabilityDestinations];
    unsigned __int8 v9 = [v10 containsObject:v4];
  }
  return v9;
}

- (id)intersectWithDestinations:(id)a3
{
  id v4 = a3;
  v5 = [(STIDSTransportPrimitiveDestinationReachabilityMap *)self reachableDestinations];
  id v6 = [v5 mutableCopy];

  v7 = [(STIDSTransportPrimitiveDestinationReachabilityMap *)self unreachableDestinations];
  id v8 = [v7 mutableCopy];

  unsigned __int8 v9 = [(STIDSTransportPrimitiveDestinationReachabilityMap *)self unknownReachabilityDestinations];
  id v10 = [v9 mutableCopy];

  [v6 intersectSet:v4];
  [v8 intersectSet:v4];
  [v10 intersectSet:v4];
  id v11 = [v4 mutableCopy];

  [v11 minusSet:v6];
  [v11 minusSet:v8];
  [v11 minusSet:v10];
  [v10 unionSet:v11];
  id v12 = [objc_alloc((Class)objc_opt_class()) initWithReachableDestinations:v6 unreachableDestinations:v8 unknownReachabilityDestinations:v10];

  return v12;
}

+ (id)mapFromUnionOfMaps:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = objc_opt_new();
  v7 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "reachableDestinations", (void)v19);
        [v5 unionSet:v14];

        v15 = [v13 unreachableDestinations];
        [v6 unionSet:v15];

        v16 = [v13 unknownReachabilityDestinations];
        [v7 unionSet:v16];
      }
      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  id v17 = [objc_alloc((Class)a1) initWithReachableDestinations:v5 unreachableDestinations:v6 unknownReachabilityDestinations:v7];
  return v17;
}

- (id)merge:(id)a3
{
  id v4 = a3;
  v5 = [(STIDSTransportPrimitiveDestinationReachabilityMap *)self reachableDestinations];
  id v6 = [v5 mutableCopy];

  v7 = [(STIDSTransportPrimitiveDestinationReachabilityMap *)self unreachableDestinations];
  id v8 = [v7 mutableCopy];

  id v9 = [(STIDSTransportPrimitiveDestinationReachabilityMap *)self unknownReachabilityDestinations];
  id v10 = [v9 mutableCopy];

  uint64_t v11 = [v4 reachableDestinations];
  id v12 = [v11 mutableCopy];

  v13 = [v4 unreachableDestinations];
  id v14 = [v13 mutableCopy];

  v15 = [v4 unknownReachabilityDestinations];

  id v16 = [v15 mutableCopy];
  [v6 minusSet:v14];
  [v6 minusSet:v16];
  [v8 minusSet:v12];
  [v8 minusSet:v16];
  [v10 minusSet:v12];
  [v10 minusSet:v14];
  [v12 unionSet:v6];
  [v14 unionSet:v8];
  [v16 unionSet:v10];
  id v17 = [objc_alloc((Class)objc_opt_class()) initWithReachableDestinations:v12 unreachableDestinations:v14 unknownReachabilityDestinations:v16];

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STIDSTransportPrimitiveDestinationReachabilityMap)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(), 0);
  v7 = [v4 decodeObjectOfClasses:v6 forKey:@"reachableDestinations"];
  id v8 = +[NSSet setWithArray:v7];

  uint64_t v9 = objc_opt_class();
  id v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, objc_opt_class(), 0);
  uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"unreachableDestinations"];
  id v12 = +[NSSet setWithArray:v11];

  uint64_t v13 = objc_opt_class();
  id v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, objc_opt_class(), 0);
  v15 = [v4 decodeObjectOfClasses:v14 forKey:@"unknownReachabilityDestinations"];

  id v16 = +[NSSet setWithArray:v15];

  id v17 = [(STIDSTransportPrimitiveDestinationReachabilityMap *)self initWithReachableDestinations:v8 unreachableDestinations:v12 unknownReachabilityDestinations:v16];
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  unknownReachabilityDestinations = self->_unknownReachabilityDestinations;
  id v5 = a3;
  id v6 = [(NSSet *)unknownReachabilityDestinations allObjects];
  [v5 encodeObject:v6 forKey:@"unknownReachabilityDestinations"];

  v7 = [(NSSet *)self->_reachableDestinations allObjects];
  [v5 encodeObject:v7 forKey:@"reachableDestinations"];

  id v8 = [(NSSet *)self->_unreachableDestinations allObjects];
  [v5 encodeObject:v8 forKey:@"unreachableDestinations"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  reachableDestinations = self->_reachableDestinations;
  unreachableDestinations = self->_unreachableDestinations;
  unknownReachabilityDestinations = self->_unknownReachabilityDestinations;
  return [v4 initWithReachableDestinations:reachableDestinations unreachableDestinations:unreachableDestinations unknownReachabilityDestinations:unknownReachabilityDestinations];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STIDSTransportPrimitiveDestinationReachabilityMap *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(STIDSTransportPrimitiveDestinationReachabilityMap *)self isEqualToMap:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToMap:(id)a3
{
  id v4 = (STIDSTransportPrimitiveDestinationReachabilityMap *)a3;
  if (self == v4)
  {
    unsigned __int8 v11 = 1;
  }
  else
  {
    BOOL v5 = [(STIDSTransportPrimitiveDestinationReachabilityMap *)self reachableDestinations];
    id v6 = [(STIDSTransportPrimitiveDestinationReachabilityMap *)v4 reachableDestinations];
    if ([v5 isEqualToSet:v6])
    {
      v7 = [(STIDSTransportPrimitiveDestinationReachabilityMap *)self unreachableDestinations];
      id v8 = [(STIDSTransportPrimitiveDestinationReachabilityMap *)v4 unreachableDestinations];
      if ([v7 isEqualToSet:v8])
      {
        uint64_t v9 = [(STIDSTransportPrimitiveDestinationReachabilityMap *)self unknownReachabilityDestinations];
        id v10 = [(STIDSTransportPrimitiveDestinationReachabilityMap *)v4 unknownReachabilityDestinations];
        unsigned __int8 v11 = [v9 isEqualToSet:v10];
      }
      else
      {
        unsigned __int8 v11 = 0;
      }
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  return v11;
}

- (unint64_t)hash
{
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v3 = [(STIDSTransportPrimitiveDestinationReachabilityMap *)self reachableDestinations];
  id v4 = [v3 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v29;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 ^= (unint64_t)[*(id *)(*((void *)&v28 + 1) + 8 * i) hash];
      }
      id v5 = [v3 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v9 = [(STIDSTransportPrimitiveDestinationReachabilityMap *)self unreachableDestinations];
  uint64_t v10 = (uint64_t)[v9 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        v11 ^= (unint64_t)[*(id *)(*((void *)&v24 + 1) + 8 * j) hash];
      }
      uint64_t v10 = (uint64_t)[v9 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v10);
    uint64_t v10 = 2 * v11;
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v14 = [(STIDSTransportPrimitiveDestinationReachabilityMap *)self unknownReachabilityDestinations];
  uint64_t v15 = (uint64_t)[v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v15)
  {
    uint64_t v16 = 0;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (uint64_t k = 0; k != v15; ++k)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        v16 ^= (unint64_t)[*(id *)(*((void *)&v20 + 1) + 8 * k) hash];
      }
      uint64_t v15 = (uint64_t)[v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v15);
    uint64_t v15 = 4 * v16;
  }

  return v10 ^ v6 ^ v15;
}

- (NSSet)reachableDestinations
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (NSSet)unreachableDestinations
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)unknownReachabilityDestinations
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownReachabilityDestinations, 0);
  objc_storeStrong((id *)&self->_unreachableDestinations, 0);
  objc_storeStrong((id *)&self->_reachableDestinations, 0);
}

@end