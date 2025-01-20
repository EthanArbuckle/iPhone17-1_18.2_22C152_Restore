@interface NWNetworkOfInterest
+ (BOOL)supportsSecureCoding;
- (BOOL)_isEqualToNOI:(id)a3;
- (BOOL)atHomeScopedNOI;
- (BOOL)atWorkScopedNOI;
- (BOOL)discretionaryTrafficInvited;
- (BOOL)isAny;
- (BOOL)isBuiltin;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTrafficEligible;
- (BOOL)willGetDiscretionaryTrafficInvites;
- (NSArray)predictions;
- (NSDate)predictionsGeneratedAt;
- (NSPredicate)customSignature;
- (NWNetworkAdviceUpdate)considerAlternateUpdate;
- (NWNetworkOfInterest)initWithCoder:(id)a3;
- (NWNetworkOfInterest)initWithSpec:(unsigned __int8)a3 isAny:(BOOL)a4 isBuiltin:(BOOL)a5 scopedToLOI:(int64_t)a6 flags:(int64_t)a7 hasCustomSignature:(id)a8;
- (id)_descriptionFull:(BOOL)a3;
- (id)_thinCopy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)typePrettyPrint;
- (int64_t)considerAlternate;
- (int64_t)flags;
- (int64_t)interface;
- (int64_t)interfaceClass;
- (int64_t)interfaceSubtype;
- (int64_t)linkQuality;
- (int64_t)powerCostDL;
- (int64_t)powerCostUL;
- (int64_t)scopedToLOI;
- (int64_t)version;
- (unint64_t)hash;
- (unsigned)functionalInterfaceType;
- (void)addObserverForAllKeyPaths:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeObserverForAllKeyPaths:(id)a3;
- (void)setConsiderAlternate:(int64_t)a3;
- (void)setConsiderAlternateUpdate:(id)a3;
- (void)setDiscretionaryTrafficInvited:(BOOL)a3;
- (void)setInterfaceClass:(int64_t)a3;
- (void)setIsTrafficEligible:(BOOL)a3;
- (void)setLinkQuality:(int64_t)a3;
- (void)setPowerCostDL:(int64_t)a3;
- (void)setPowerCostUL:(int64_t)a3;
- (void)setPredictions:(id)a3;
- (void)setPredictionsGeneratedAt:(id)a3;
- (void)setWillGetDiscretionaryTrafficInvites:(BOOL)a3;
@end

@implementation NWNetworkOfInterest

- (void)removeObserverForAllKeyPaths:(id)a3
{
  id v4 = a3;
  [(NWNetworkOfInterest *)self removeObserver:v4 forKeyPath:@"isTrafficEligible"];
  [(NWNetworkOfInterest *)self removeObserver:v4 forKeyPath:@"willGetDiscretionaryTrafficInvites"];
  [(NWNetworkOfInterest *)self removeObserver:v4 forKeyPath:@"discretionaryTrafficInvited"];
  [(NWNetworkOfInterest *)self removeObserver:v4 forKeyPath:@"interfaceClass"];
  [(NWNetworkOfInterest *)self removeObserver:v4 forKeyPath:@"considerAlternate"];
  [(NWNetworkOfInterest *)self removeObserver:v4 forKeyPath:@"considerAlternateUpdate"];
  [(NWNetworkOfInterest *)self removeObserver:v4 forKeyPath:@"linkQuality"];
  [(NWNetworkOfInterest *)self removeObserver:v4 forKeyPath:@"powerCostDL"];
  [(NWNetworkOfInterest *)self removeObserver:v4 forKeyPath:@"powerCostUL"];
  [(NWNetworkOfInterest *)self removeObserver:v4 forKeyPath:@"predictionsGeneratedAt"];
}

- (void)addObserverForAllKeyPaths:(id)a3
{
  id v4 = a3;
  [(NWNetworkOfInterest *)self addObserver:v4 forKeyPath:@"isTrafficEligible" options:1 context:1];
  [(NWNetworkOfInterest *)self addObserver:v4 forKeyPath:@"willGetDiscretionaryTrafficInvites" options:1 context:2];
  [(NWNetworkOfInterest *)self addObserver:v4 forKeyPath:@"discretionaryTrafficInvited" options:1 context:3];
  [(NWNetworkOfInterest *)self addObserver:v4 forKeyPath:@"interfaceClass" options:1 context:4];
  [(NWNetworkOfInterest *)self addObserver:v4 forKeyPath:@"considerAlternate" options:1 context:5];
  [(NWNetworkOfInterest *)self addObserver:v4 forKeyPath:@"considerAlternateUpdate" options:1 context:6];
  [(NWNetworkOfInterest *)self addObserver:v4 forKeyPath:@"linkQuality" options:1 context:7];
  [(NWNetworkOfInterest *)self addObserver:v4 forKeyPath:@"powerCostDL" options:1 context:8];
  [(NWNetworkOfInterest *)self addObserver:v4 forKeyPath:@"powerCostUL" options:1 context:9];
  [(NWNetworkOfInterest *)self addObserver:v4 forKeyPath:@"predictionsGeneratedAt" options:1 context:0];
}

- (id)_thinCopy
{
  v3 = objc_alloc_init(NWNetworkOfInterest);
  v3->_version = self->_version;
  v3->_functionalInterfaceType = self->_functionalInterfaceType;
  v3->_isAny = self->_isAny;
  v3->_isBuiltin = self->_isBuiltin;
  v3->_scopedToLOI = self->_scopedToLOI;
  v3->_flags = self->_flags;
  objc_storeStrong((id *)&v3->_customSignature, self->_customSignature);
  v3->_isThinnedOut = 1;
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(NWNetworkOfInterest);
  v4->_version = self->_version;
  v4->_functionalInterfaceType = self->_functionalInterfaceType;
  v4->_isAny = self->_isAny;
  v4->_isBuiltin = self->_isBuiltin;
  v4->_scopedToLOI = self->_scopedToLOI;
  v4->_flags = self->_flags;
  objc_storeStrong((id *)&v4->_customSignature, self->_customSignature);
  v4->_isTrafficEligible = self->_isTrafficEligible;
  v4->_willGetDiscretionaryTrafficInvites = self->_willGetDiscretionaryTrafficInvites;
  v4->_discretionaryTrafficInvited = self->_discretionaryTrafficInvited;
  v4->_interfaceClass = self->_interfaceClass;
  v4->_considerAlternate = self->_considerAlternate;
  v4->_linkQuality = self->_linkQuality;
  v4->_powerCostDL = self->_powerCostDL;
  v4->_powerCostUL = self->_powerCostUL;
  uint64_t v5 = [(NWNetworkAdviceUpdate *)self->_considerAlternateUpdate copy];
  considerAlternateUpdate = v4->_considerAlternateUpdate;
  v4->_considerAlternateUpdate = (NWNetworkAdviceUpdate *)v5;

  uint64_t v7 = [(NSDate *)self->_predictionsGeneratedAt copy];
  predictionsGeneratedAt = v4->_predictionsGeneratedAt;
  v4->_predictionsGeneratedAt = (NSDate *)v7;

  uint64_t v9 = [(NSArray *)self->_predictions copy];
  predictions = v4->_predictions;
  v4->_predictions = (NSArray *)v9;

  return v4;
}

- (unint64_t)hash
{
  v2 = [(NWNetworkOfInterest *)self description];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  return [(NWNetworkOfInterest *)self _descriptionFull:1];
}

- (NWNetworkOfInterest)initWithSpec:(unsigned __int8)a3 isAny:(BOOL)a4 isBuiltin:(BOOL)a5 scopedToLOI:(int64_t)a6 flags:(int64_t)a7 hasCustomSignature:(id)a8
{
  uint64_t v13 = a3;
  id v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)NWNetworkOfInterest;
  v16 = [(NWNetworkOfInterest *)&v19 init];
  v17 = v16;
  if (v16)
  {
    v16->_version = 0;
    v16->_functionalInterfaceType = v13;
    v16->_interface = +[FunctionalInterfaceUtils nwInterfaceTypeForNWFunctionalInterfaceType:v13];
    v17->_interfaceSubtype = +[FunctionalInterfaceUtils nwInterfaceSubtypeForNWFunctionalInterfaceType:v17->_functionalInterfaceType];
    v17->_isAny = a4;
    v17->_isBuiltin = a5;
    v17->_scopedToLOI = a6;
    v17->_flags = a7;
    objc_storeStrong((id *)&v17->_customSignature, a8);
  }

  return v17;
}

- (NWNetworkOfInterest)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NWNetworkOfInterest;
  uint64_t v5 = [(NWNetworkOfInterest *)&v24 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x2611E0E10]();
    v5->_version = [v4 decodeIntegerForKey:@"version"];
    unsigned __int8 v7 = [v4 decodeIntegerForKey:@"interfaceType"];
    v5->_functionalInterfaceType = v7;
    v5->_interface = +[FunctionalInterfaceUtils nwInterfaceTypeForNWFunctionalInterfaceType:v7];
    v5->_interfaceSubtype = +[FunctionalInterfaceUtils nwInterfaceSubtypeForNWFunctionalInterfaceType:v5->_functionalInterfaceType];
    v5->_isAny = [v4 decodeBoolForKey:@"isAny"];
    v5->_isBuiltin = [v4 decodeBoolForKey:@"isBuiltin"];
    v5->_scopedToLOI = [v4 decodeIntegerForKey:@"scopedToLOI"];
    v5->_flags = [v4 decodeIntegerForKey:@"flags"];
    uint64_t v8 = [v4 decodeObjectForKey:@"customSignature"];
    customSignature = v5->_customSignature;
    v5->_customSignature = (NSPredicate *)v8;

    v5->_isTrafficEligible = [v4 decodeBoolForKey:@"isTrafficEligible"];
    v5->_willGetDiscretionaryTrafficInvites = [v4 decodeBoolForKey:@"willGetDiscretionaryTrafficInvites"];
    v5->_discretionaryTrafficInvited = [v4 decodeBoolForKey:@"discretionaryTrafficInvited"];
    v5->_interfaceClass = [v4 decodeIntegerForKey:@"interfaceClass"];
    v5->_considerAlternate = [v4 decodeIntegerForKey:@"considerAlternate"];
    id v10 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_msgSend(v10, "initWithObjects:", v11, v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"considerAlternateUpdate"];
    considerAlternateUpdate = v5->_considerAlternateUpdate;
    v5->_considerAlternateUpdate = (NWNetworkAdviceUpdate *)v14;

    v5->_linkQuality = [v4 decodeIntegerForKey:@"linkQuality"];
    v5->_powerCostDL = [v4 decodeIntegerForKey:@"powerCostDL"];
    v5->_powerCostUL = [v4 decodeIntegerForKey:@"powerCostUL"];
    uint64_t v16 = [v4 decodeObjectForKey:@"predictionsGeneratedAt"];
    predictionsGeneratedAt = v5->_predictionsGeneratedAt;
    v5->_predictionsGeneratedAt = (NSDate *)v16;

    id v18 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v18, "initWithObjects:", v19, objc_opt_class(), 0);

    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"predictions"];
    predictions = v5->_predictions;
    v5->_predictions = (NSArray *)v21;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NWNetworkOfInterest *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(NWNetworkOfInterest *)self _isEqualToNOI:v4];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  id v4 = (void *)MEMORY[0x2611E0E10]();
  objc_msgSend(v9, "encodeInteger:forKey:", -[NWNetworkOfInterest version](self, "version"), @"version");
  objc_msgSend(v9, "encodeInteger:forKey:", -[NWNetworkOfInterest functionalInterfaceType](self, "functionalInterfaceType"), @"interfaceType");
  objc_msgSend(v9, "encodeBool:forKey:", -[NWNetworkOfInterest isAny](self, "isAny"), @"isAny");
  objc_msgSend(v9, "encodeBool:forKey:", -[NWNetworkOfInterest isBuiltin](self, "isBuiltin"), @"isBuiltin");
  objc_msgSend(v9, "encodeInteger:forKey:", -[NWNetworkOfInterest scopedToLOI](self, "scopedToLOI"), @"scopedToLOI");
  objc_msgSend(v9, "encodeInteger:forKey:", -[NWNetworkOfInterest flags](self, "flags"), @"flags");
  BOOL v5 = [(NWNetworkOfInterest *)self customSignature];
  [v9 encodeObject:v5 forKey:@"customSignature"];

  objc_msgSend(v9, "encodeBool:forKey:", -[NWNetworkOfInterest isTrafficEligible](self, "isTrafficEligible"), @"isTrafficEligible");
  objc_msgSend(v9, "encodeBool:forKey:", -[NWNetworkOfInterest willGetDiscretionaryTrafficInvites](self, "willGetDiscretionaryTrafficInvites"), @"willGetDiscretionaryTrafficInvites");
  objc_msgSend(v9, "encodeBool:forKey:", -[NWNetworkOfInterest discretionaryTrafficInvited](self, "discretionaryTrafficInvited"), @"discretionaryTrafficInvited");
  objc_msgSend(v9, "encodeInteger:forKey:", -[NWNetworkOfInterest interfaceClass](self, "interfaceClass"), @"interfaceClass");
  objc_msgSend(v9, "encodeInteger:forKey:", -[NWNetworkOfInterest considerAlternate](self, "considerAlternate"), @"considerAlternate");
  v6 = [(NWNetworkOfInterest *)self considerAlternateUpdate];
  [v9 encodeObject:v6 forKey:@"considerAlternateUpdate"];

  objc_msgSend(v9, "encodeInteger:forKey:", -[NWNetworkOfInterest linkQuality](self, "linkQuality"), @"linkQuality");
  objc_msgSend(v9, "encodeInteger:forKey:", -[NWNetworkOfInterest powerCostDL](self, "powerCostDL"), @"powerCostDL");
  objc_msgSend(v9, "encodeInteger:forKey:", -[NWNetworkOfInterest powerCostUL](self, "powerCostUL"), @"powerCostUL");
  unsigned __int8 v7 = [(NWNetworkOfInterest *)self predictionsGeneratedAt];
  [v9 encodeObject:v7 forKey:@"predictionsGeneratedAt"];

  uint64_t v8 = [(NWNetworkOfInterest *)self predictions];
  [v9 encodeObject:v8 forKey:@"predictions"];
}

- (id)_descriptionFull:(BOOL)a3
{
  BOOL v5 = +[FunctionalInterfaceUtils stringForFunctionalInterfaceType:[(NWNetworkOfInterest *)self functionalInterfaceType]];
  v6 = v5;
  if (a3)
  {
    id v7 = [NSString alloc];
    uint64_t v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    int64_t v10 = [(NWNetworkOfInterest *)self version];
    uint64_t v11 = "yes";
    if ([(NWNetworkOfInterest *)self isAny]) {
      uint64_t v12 = "yes";
    }
    else {
      uint64_t v12 = "no";
    }
    if (![(NWNetworkOfInterest *)self isBuiltin]) {
      uint64_t v11 = "no";
    }
    id v13 = (id)[v7 initWithFormat:@"NOI(%@): v:%ld type:%@, isAny:%s, isBuiltin:%s, loi:%ld, flags:%lu", v9, v10, v6, v12, v11, -[NWNetworkOfInterest scopedToLOI](self, "scopedToLOI"), -[NWNetworkOfInterest flags](self, "flags")];
  }
  else
  {
    id v13 = v5;
  }

  return v13;
}

- (BOOL)_isEqualToNOI:(id)a3
{
  id v5 = a3;
  int64_t v6 = [(NWNetworkOfInterest *)self version];
  if (v6 == [v5 version])
  {
    int v7 = [(NWNetworkOfInterest *)self functionalInterfaceType];
    if (v7 == [v5 functionalInterfaceType])
    {
      int v8 = [(NWNetworkOfInterest *)self isAny];
      if (v8 == [v5 isAny])
      {
        int v9 = [(NWNetworkOfInterest *)self isBuiltin];
        if (v9 == [v5 isBuiltin])
        {
          int64_t v10 = [(NWNetworkOfInterest *)self scopedToLOI];
          if (v10 == [v5 scopedToLOI])
          {
            int64_t v11 = [(NWNetworkOfInterest *)self flags];
            if (v11 == [v5 flags])
            {
              uint64_t v12 = [(NWNetworkOfInterest *)self customSignature];
              if (v12
                || ([v5 customSignature], (unint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                id v13 = [(NWNetworkOfInterest *)self customSignature];
                uint64_t v14 = [v5 customSignature];
                char v15 = [v13 isEqual:v14];

                if (v12)
                {
LABEL_15:

                  goto LABEL_12;
                }
              }
              else
              {
                char v15 = 1;
              }

              goto LABEL_15;
            }
          }
        }
      }
    }
  }
  char v15 = 0;
LABEL_12:

  return v15;
}

- (unsigned)functionalInterfaceType
{
  return self->_functionalInterfaceType;
}

- (int64_t)version
{
  return self->_version;
}

- (BOOL)isAny
{
  return self->_isAny;
}

- (int64_t)scopedToLOI
{
  return self->_scopedToLOI;
}

- (BOOL)isBuiltin
{
  return self->_isBuiltin;
}

- (int64_t)flags
{
  return self->_flags;
}

- (NSPredicate)customSignature
{
  return (NSPredicate *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictions, 0);
  objc_storeStrong((id *)&self->_predictionsGeneratedAt, 0);
  objc_storeStrong((id *)&self->_considerAlternateUpdate, 0);
  objc_storeStrong((id *)&self->_customSignature, 0);
}

- (int64_t)linkQuality
{
  return self->_linkQuality;
}

- (BOOL)willGetDiscretionaryTrafficInvites
{
  return self->_willGetDiscretionaryTrafficInvites;
}

- (NSArray)predictions
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (NSDate)predictionsGeneratedAt
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (int64_t)powerCostUL
{
  return self->_powerCostUL;
}

- (int64_t)powerCostDL
{
  return self->_powerCostDL;
}

- (BOOL)isTrafficEligible
{
  return self->_isTrafficEligible;
}

- (int64_t)interfaceClass
{
  return self->_interfaceClass;
}

- (BOOL)discretionaryTrafficInvited
{
  return self->_discretionaryTrafficInvited;
}

- (int64_t)considerAlternate
{
  return self->_considerAlternate;
}

- (NWNetworkAdviceUpdate)considerAlternateUpdate
{
  return (NWNetworkAdviceUpdate *)objc_getProperty(self, a2, 104, 1);
}

- (int64_t)interface
{
  return self->_interface;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)typePrettyPrint
{
  return [(NWNetworkOfInterest *)self _descriptionFull:0];
}

- (BOOL)atHomeScopedNOI
{
  return [(NWNetworkOfInterest *)self scopedToLOI] == 0;
}

- (BOOL)atWorkScopedNOI
{
  return [(NWNetworkOfInterest *)self scopedToLOI] == 1;
}

- (int64_t)interfaceSubtype
{
  return self->_interfaceSubtype;
}

- (void)setIsTrafficEligible:(BOOL)a3
{
  self->_isTrafficEligible = a3;
}

- (void)setWillGetDiscretionaryTrafficInvites:(BOOL)a3
{
  self->_willGetDiscretionaryTrafficInvites = a3;
}

- (void)setDiscretionaryTrafficInvited:(BOOL)a3
{
  self->_discretionaryTrafficInvited = a3;
}

- (void)setInterfaceClass:(int64_t)a3
{
  self->_interfaceClass = a3;
}

- (void)setConsiderAlternate:(int64_t)a3
{
  self->_considerAlternate = a3;
}

- (void)setConsiderAlternateUpdate:(id)a3
{
}

- (void)setLinkQuality:(int64_t)a3
{
  self->_linkQuality = a3;
}

- (void)setPowerCostDL:(int64_t)a3
{
  self->_powerCostDL = a3;
}

- (void)setPowerCostUL:(int64_t)a3
{
  self->_powerCostUL = a3;
}

- (void)setPredictionsGeneratedAt:(id)a3
{
}

- (void)setPredictions:(id)a3
{
}

@end