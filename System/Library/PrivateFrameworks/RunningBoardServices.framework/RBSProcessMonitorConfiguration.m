@interface RBSProcessMonitorConfiguration
+ (BOOL)supportsRBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesProcess:(id)a3;
- (NSArray)predicates;
- (NSString)debugDescription;
- (NSString)description;
- (RBSProcessMonitorConfiguration)init;
- (RBSProcessMonitorConfiguration)initWithRBSXPCCoder:(id)a3;
- (RBSProcessStateDescriptor)stateDescriptor;
- _initWithIdentifier:(int)a3 andPid:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)updateHandler;
- (os_unfair_lock_s)preventLaunchUpdateHandler;
- (unint64_t)events;
- (unint64_t)hash;
- (unint64_t)identifier;
- (unsigned)serviceClass;
- (void)_validate;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)setEvents:(unint64_t)a3;
- (void)setPredicates:(id)a3;
- (void)setPreventLaunchUpdateHandle:(id)a3;
- (void)setPreventLaunchUpdateHandler:(void *)a1;
- (void)setServiceClass:(unsigned int)a3;
- (void)setStateDescriptor:(id)a3;
- (void)setUpdateHandler:(id)a3;
@end

@implementation RBSProcessMonitorConfiguration

- (RBSProcessStateDescriptor)stateDescriptor
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_stateDescriptor;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)matchesProcess:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  p_lastMatch = &self->_lastMatch;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastMatch);
  char v8 = [WeakRetained isEqual:v4];

  if (v8)
  {
    BOOL v9 = 1;
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v10 = self->_predicates;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          if (objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "matchesProcess:", v4, (void)v16))
          {
            objc_storeWeak((id *)p_lastMatch, v4);
            BOOL v9 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    BOOL v9 = 0;
LABEL_13:
  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSProcessMonitorConfiguration)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  if (([v4 containsValueForKey:@"_identifier"] & 1) == 0)
  {
    uint64_t v13 = rbs_monitor_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[RBSProcessMonitorConfiguration initWithRBSXPCCoder:](v13);
    }
    goto LABEL_10;
  }
  if (([v4 containsValueForKey:@"_clientPid"] & 1) == 0)
  {
    uint64_t v13 = rbs_monitor_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[RBSProcessMonitorConfiguration initWithRBSXPCCoder:](v13);
    }
LABEL_10:

    uint64_t v12 = 0;
    goto LABEL_11;
  }
  v5 = -[RBSProcessMonitorConfiguration _initWithIdentifier:andPid:](self, [v4 decodeInt64ForKey:@"_identifier"], objc_msgSend(v4, "decodeInt64ForKey:", @"_clientPid"));
  uint64_t v6 = (uint64_t)v5;
  if (v5)
  {
    v5[4] = 0;
    *((void *)v5 + 8) = [v4 decodeInt64ForKey:@"_events"];
    *(_DWORD *)(v6 + 36) = [v4 decodeInt64ForKey:@"_serviceClass"];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = [v4 decodeCollectionOfClass:v7 containingClass:objc_opt_class() forKey:@"_predicates"];
    BOOL v9 = *(void **)(v6 + 48);
    *(void *)(v6 + 48) = v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_stateDescriptor"];
    uint64_t v11 = *(void **)(v6 + 56);
    *(void *)(v6 + 56) = v10;

    -[RBSProcessMonitorConfiguration _validate](v6);
  }
  self = (RBSProcessMonitorConfiguration *)(id)v6;
  uint64_t v12 = self;
LABEL_11:

  return v12;
}

- (NSString)debugDescription
{
  v3 = [(RBSProcessMonitorConfiguration *)self description];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v5 = [NSString alloc];
  uint64_t v6 = [(id)objc_opt_class() description];
  uint64_t serviceClass = self->_serviceClass;
  uint64_t v8 = [(NSArray *)self->_predicates componentsJoinedByString:@", "];
  BOOL v9 = [(RBSProcessStateDescriptor *)self->_stateDescriptor debugDescription];
  uint64_t v10 = (void *)[v5 initWithFormat:@"<%@| id:%@ qos:%u predicates:[%@] descriptor:%@ events:0x%x>", v6, v3, serviceClass, v8, v9, self->_events];

  os_unfair_lock_unlock(p_lock);
  return (NSString *)v10;
}

- (NSString)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  desc = self->_desc;
  if (!desc)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"M%d-%llu", self->_clientPid, self->_identifier);
    id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = self->_desc;
    self->_desc = v5;

    desc = self->_desc;
  }
  uint64_t v7 = desc;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  -[RBSProcessMonitorConfiguration _validate]((uint64_t)self);
  if (self) {
    uint64_t clientPid = self->_clientPid;
  }
  else {
    uint64_t clientPid = 0;
  }
  [v4 encodeInt64:clientPid forKey:@"_clientPid"];
  objc_msgSend(v4, "encodeInt64:forKey:", -[RBSProcessMonitorConfiguration identifier](self, "identifier"), @"_identifier");
  objc_msgSend(v4, "encodeInt64:forKey:", -[RBSProcessMonitorConfiguration events](self, "events"), @"_events");
  objc_msgSend(v4, "encodeInt64:forKey:", -[RBSProcessMonitorConfiguration serviceClass](self, "serviceClass"), @"_serviceClass");
  uint64_t v6 = [(RBSProcessMonitorConfiguration *)self predicates];
  [v4 encodeObject:v6 forKey:@"_predicates"];

  id v7 = [(RBSProcessMonitorConfiguration *)self stateDescriptor];
  [v4 encodeObject:v7 forKey:@"_stateDescriptor"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[RBSProcessMonitorConfiguration allocWithZone:a3];
  uint64_t v5 = [(RBSProcessMonitorConfiguration *)self identifier];
  if (self) {
    int clientPid = self->_clientPid;
  }
  else {
    int clientPid = 0;
  }
  id v7 = -[RBSProcessMonitorConfiguration _initWithIdentifier:andPid:](v4, v5, clientPid);
  objc_msgSend(v7, "setServiceClass:", -[RBSProcessMonitorConfiguration serviceClass](self, "serviceClass"));
  uint64_t v8 = [(RBSProcessMonitorConfiguration *)self predicates];
  [v7 setPredicates:v8];

  BOOL v9 = [(RBSProcessMonitorConfiguration *)self stateDescriptor];
  [v7 setStateDescriptor:v9];

  objc_msgSend(v7, "setEvents:", -[RBSProcessMonitorConfiguration events](self, "events"));
  uint64_t v10 = [(RBSProcessMonitorConfiguration *)self updateHandler];
  [v7 setUpdateHandler:v10];

  -[RBSProcessMonitorConfiguration _validate]((uint64_t)v7);
  return v7;
}

- (id)updateHandler
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)MEMORY[0x192FEC490](self->_updateHandler);
  os_unfair_lock_unlock(p_lock);
  uint64_t v5 = (void *)MEMORY[0x192FEC490](v4);

  return v5;
}

- (NSArray)predicates
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_predicates;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (unint64_t)events
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t events = self->_events;
  os_unfair_lock_unlock(p_lock);
  return events;
}

- (void)_validate
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v3 = *(id *)(a1 + 48);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v17 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          BOOL v9 = +[RBSProcessBKSLegacyPredicate legacyPredicate];

          if (v8 == v9)
          {
            unsigned int v10 = *(_DWORD *)(a1 + 36);
            if (v10 >= 0x11) {
              unsigned int v10 = 17;
            }
            *(_DWORD *)(a1 + 36) = v10;
            goto LABEL_14;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    HIDWORD(v12) = *(_DWORD *)(a1 + 36) - 9;
    LODWORD(v12) = HIDWORD(v12);
    unsigned int v11 = v12 >> 2;
    BOOL v13 = v11 > 6;
    int v14 = (1 << v11) & 0x5D;
    if (v13 || v14 == 0) {
      *(_DWORD *)(a1 + 36) = 17;
    }
    os_unfair_lock_unlock(v2);
  }
}

- _initWithIdentifier:(int)a3 andPid:
{
  if (!a1) {
    return 0;
  }
  v9.receiver = a1;
  v9.super_class = (Class)RBSProcessMonitorConfiguration;
  uint64_t v5 = objc_msgSendSuper2(&v9, sel_init);
  uint64_t v6 = v5;
  if (v5)
  {
    v5[4] = 0;
    *((void *)v5 + 5) = a2;
    v5[8] = a3;
    id v7 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = 0;

    *((void *)v6 + 8) = 0;
    v6[9] = 17;
  }
  return v6;
}

- (void)setPredicates:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = (NSArray *)[v5 copy];

  predicates = self->_predicates;
  self->_predicates = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)setStateDescriptor:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = (RBSProcessStateDescriptor *)[v5 copy];

  stateDescriptor = self->_stateDescriptor;
  self->_stateDescriptor = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)setUpdateHandler:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = (void *)[v5 copy];

  id updateHandler = self->_updateHandler;
  self->_id updateHandler = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)setServiceClass:(unsigned int)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_uint64_t serviceClass = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setEvents:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_unint64_t events = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unsigned)serviceClass
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LODWORD(v2) = v2->_serviceClass;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_preventLaunchUpdateHandler, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_stateDescriptor, 0);
  objc_storeStrong((id *)&self->_predicates, 0);
  objc_storeStrong((id *)&self->_desc, 0);
  objc_destroyWeak((id *)&self->_lastMatch);
}

- (RBSProcessMonitorConfiguration)init
{
  self;
  uint64_t add_explicit = atomic_fetch_add_explicit(&_nextIdentifier___count, 1uLL, memory_order_relaxed);
  pid_t v4 = getpid();
  return (RBSProcessMonitorConfiguration *)-[RBSProcessMonitorConfiguration _initWithIdentifier:andPid:](self, add_explicit, v4);
}

- (os_unfair_lock_s)preventLaunchUpdateHandler
{
  v1 = a1;
  if (a1)
  {
    os_unfair_lock_lock(a1 + 4);
    v2 = (void *)MEMORY[0x192FEC490](*(void *)&v1[20]._os_unfair_lock_opaque);
    os_unfair_lock_unlock(v1 + 4);
    v1 = (os_unfair_lock_s *)MEMORY[0x192FEC490](v2);
  }
  return v1;
}

- (void)setPreventLaunchUpdateHandle:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = (void *)[v5 copy];

  id preventLaunchUpdateHandler = self->_preventLaunchUpdateHandler;
  self->_id preventLaunchUpdateHandler = v6;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)hash
{
  return self->_identifier;
}

- (BOOL)isEqual:(id)a3
{
  pid_t v4 = (RBSProcessMonitorConfiguration *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class()
      && (unint64_t identifier = self->_identifier, identifier == [(RBSProcessMonitorConfiguration *)v4 identifier]))
    {
      if (v4) {
        int clientPid = v4->_clientPid;
      }
      else {
        int clientPid = 0;
      }
      BOOL v8 = self->_clientPid == clientPid;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (void)setPreventLaunchUpdateHandler:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 80);
  }
}

- (void)initWithRBSXPCCoder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_191FE8000, log, OS_LOG_TYPE_ERROR, "cannot decode RBSProcessMonitorConfiguration object with no cientPid", v1, 2u);
}

- (void)initWithRBSXPCCoder:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_191FE8000, log, OS_LOG_TYPE_ERROR, "cannot decode RBSProcessMonitorConfiguration object with no identifier", v1, 2u);
}

@end