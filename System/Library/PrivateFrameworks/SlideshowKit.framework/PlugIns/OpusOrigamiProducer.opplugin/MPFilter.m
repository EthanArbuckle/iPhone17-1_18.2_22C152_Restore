@interface MPFilter
+ (id)filterWithFilterID:(id)a3;
- (MPFilter)init;
- (MPFilter)initWithFilterID:(id)a3;
- (NSString)filterID;
- (NSString)presetID;
- (id)animationPathForKey:(id)a3;
- (id)animationPaths;
- (id)convertMCAttributeToMPAttribute:(id)a3 withKey:(id)a4;
- (id)convertMPAttributeToMCAttribute:(id)a3 withKey:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)filter;
- (id)filterAttributeForKey:(id)a3;
- (id)filterAttributes;
- (id)fullDebugLog;
- (id)parent;
- (id)parentDocument;
- (int64_t)index;
- (void)copyAnimationPaths:(id)a3;
- (void)copyStruct:(id)a3;
- (void)dealloc;
- (void)dump;
- (void)removeAnimationPathForKey:(id)a3;
- (void)setAnimationPath:(id)a3 forKey:(id)a4;
- (void)setDefaults;
- (void)setFilter:(id)a3;
- (void)setFilterAttribute:(id)a3 forKey:(id)a4;
- (void)setFilterID:(id)a3;
- (void)setParent:(id)a3;
- (void)setPresetID:(id)a3;
@end

@implementation MPFilter

+ (id)filterWithFilterID:(id)a3
{
  id v3 = [objc_alloc((Class)a1) initWithFilterID:a3];
  return v3;
}

- (MPFilter)initWithFilterID:(id)a3
{
  v4 = [(MPFilter *)self init];
  v5 = v4;
  if (v4)
  {
    [(MPFilterInternal *)v4->_internal setFilterID:a3];
    [(MPFilterInternal *)v5->_internal setPresetID:@"Default"];
    [(MPFilter *)v5 setDefaults];
  }
  return v5;
}

- (MPFilter)init
{
  v5.receiver = self;
  v5.super_class = (Class)MPFilter;
  v2 = [(MPFilter *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MPFilterInternal);
    v2->_internal = v3;
    [(MPFilterInternal *)v3 setFilterID:0];
    [(MPFilterInternal *)v2->_internal setPresetID:0];
    v2->_attributes = 0;
    v2->_animationPaths = 0;
    v2->_filter = 0;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 copyStruct:self->_internal];
  [v4 copyAnimationPaths:self->_animationPaths];
  return v4;
}

- (id)description
{
  id v3 = [[+[NSString stringWithFormat:@"==================================== Filter ====================================\n"] stringByAppendingFormat:@"\t                     Filter ID: %@\n" stringByAppendingFormat:"stringByAppendingFormat:", @"\t                     Preset ID: %@\n", [(MPFilter *)self presetID]];
  if (self->_filter) {
    CFStringRef v4 = @"YES";
  }
  else {
    CFStringRef v4 = @"NO";
  }
  return [(NSString *)v3 stringByAppendingFormat:@"\t                    Has Filter: %@\n", v4];
}

- (void)dealloc
{
  filter = self->_filter;
  if (filter)
  {

    self->_filter = 0;
  }

  self->_internal = 0;
  v4.receiver = self;
  v4.super_class = (Class)MPFilter;
  [(MPFilter *)&v4 dealloc];
}

- (NSString)filterID
{
  return [(MPFilterInternal *)self->_internal filterID];
}

- (void)setFilterID:(id)a3
{
  -[MPFilterInternal setFilterID:](self->_internal, "setFilterID:");
  filter = self->_filter;
  if (filter)
  {
    [(MCFilter *)filter setFilterID:a3];
  }
}

- (NSString)presetID
{
  return [(MPFilterInternal *)self->_internal presetID];
}

- (void)setPresetID:(id)a3
{
  -[MPFilterInternal setPresetID:](self->_internal, "setPresetID:");
  filter = self->_filter;
  if (filter)
  {
    [(MCFilter *)filter setAttribute:a3 forKey:@"PresetID"];
  }
}

- (id)filterAttributes
{
  return self->_attributes;
}

- (id)filterAttributeForKey:(id)a3
{
  return [(NSMutableDictionary *)self->_attributes objectForKey:a3];
}

- (void)setFilterAttribute:(id)a3 forKey:(id)a4
{
  attributes = self->_attributes;
  if (!attributes)
  {
    attributes = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    self->_attributes = attributes;
  }
  [(NSMutableDictionary *)attributes setObject:a3 forKey:a4];
  if (self->_filter)
  {
    id v8 = [(MPFilter *)self convertMPAttributeToMCAttribute:a3 withKey:a4];
    id v9 = objc_msgSend(-[MCFilter attributeForKey:](self->_filter, "attributeForKey:", @"specificAttributes"), "mutableCopy");
    [v9 setValue:v8 forKey:a4];
    [(MCFilter *)self->_filter setAttribute:v9 forKey:@"specificAttributes"];
  }
}

- (id)animationPaths
{
  return self->_animationPaths;
}

- (id)animationPathForKey:(id)a3
{
  return [(NSMutableDictionary *)self->_animationPaths objectForKey:a3];
}

- (void)setAnimationPath:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    if (!self->_animationPaths) {
      self->_animationPaths = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    }
    id v7 = [(MPFilter *)self animationPathForKey:a4];
    if (v7)
    {
      id v8 = v7;
      [v7 setParent:0];
      [v8 setAnimationPath:0];
    }
    [a3 setParent:self];
    [(NSMutableDictionary *)self->_animationPaths setObject:a3 forKey:a4];
    filter = self->_filter;
    if (filter)
    {
      [(MCFilter *)filter removeAnimationPathForKey:a4];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      v11 = off_1A4DC0;
      if ((isKindOfClass & 1) == 0) {
        v11 = off_1A4DC8;
      }
      id v12 = [(__objc2_class *)*v11 animationPathWithKey:a4];
      [(MCFilter *)self->_filter addAnimationPath:v12];
      [a3 setAnimationPath:v12];
    }
  }
  else
  {
    [(MPFilter *)self removeAnimationPathForKey:a4];
  }
}

- (void)removeAnimationPathForKey:(id)a3
{
  if (self->_animationPaths)
  {
    id v5 = -[MPFilter animationPathForKey:](self, "animationPathForKey:");
    filter = self->_filter;
    if (filter)
    {
      [(MCFilter *)filter removeAnimationPathForKey:a3];
      [v5 setAnimationPath:0];
    }
    [v5 setParent:0];
    animationPaths = self->_animationPaths;
    [(NSMutableDictionary *)animationPaths removeObjectForKey:a3];
  }
}

- (int64_t)index
{
  parent = self->_parent;
  if (!parent) {
    return -1;
  }
  id v4 = [(MPFilterSupport *)parent filters];
  return (int64_t)[v4 indexOfObject:self];
}

- (id)parent
{
  return self->_parent;
}

- (id)filter
{
  return self->_filter;
}

- (void)dump
{
}

- (id)fullDebugLog
{
  return +[NSString stringWithFormat:@"\n%@\n", [(MPFilter *)self description]];
}

- (void)setDefaults
{
  id v3 = +[MPUtilities defaultAttributesForMPFilter:self];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[MPFilter setFilterAttribute:forKey:](self, "setFilterAttribute:forKey:", [v3 objectForKey:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7)], *(void *)(*((void *)&v8 + 1) + 8 * (void)v7));
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)convertMPAttributeToMCAttribute:(id)a3 withKey:(id)a4
{
  return a3;
}

- (id)convertMCAttributeToMPAttribute:(id)a3 withKey:(id)a4
{
  return a3;
}

- (void)copyStruct:(id)a3
{
  -[MPFilterInternal setFilterID:](self->_internal, "setFilterID:", objc_msgSend(objc_msgSend(a3, "filterID"), "copy"));
  id v5 = objc_msgSend(objc_msgSend(a3, "presetID"), "copy");
  internal = self->_internal;
  [(MPFilterInternal *)internal setPresetID:v5];
}

- (void)copyAnimationPaths:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v10 = objc_msgSend(objc_msgSend(a3, "objectForKey:", v9), "copy");
        [(MPFilter *)self setAnimationPath:v10 forKey:v9];
      }
      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)setFilter:(id)a3
{
  filter = self->_filter;
  if (filter)
  {

    self->_filter = 0;
  }
  id v6 = (MCFilter *)a3;
  self->_filter = v6;
  if (v6)
  {
    [(MCFilter *)self->_filter setFilterID:[(MPFilter *)self filterID]];
    [(MCFilter *)self->_filter setAttribute:[(MPFilter *)self presetID] forKey:@"PresetID"];
    id v7 = +[NSMutableDictionary dictionary];
    id v8 = [(MPFilter *)self filterAttributes];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v9 = [v8 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v36;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v36 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(v7, "setObject:forKey:", -[MPFilter convertMPAttributeToMCAttribute:withKey:](self, "convertMPAttributeToMCAttribute:withKey:", objc_msgSend(v8, "objectForKey:", *(void *)(*((void *)&v35 + 1) + 8 * i)), *(void *)(*((void *)&v35 + 1) + 8 * i)), *(void *)(*((void *)&v35 + 1) + 8 * i));
        }
        id v10 = [v8 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v10);
    }
    [(MCFilter *)self->_filter setAttribute:v7 forKey:@"specificAttributes"];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    animationPaths = self->_animationPaths;
    id v14 = [(NSMutableDictionary *)animationPaths countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v32;
      do
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(animationPaths);
          }
          uint64_t v18 = *(void *)(*((void *)&v31 + 1) + 8 * (void)j);
          id v19 = [(NSMutableDictionary *)self->_animationPaths objectForKey:v18];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v20 = off_1A4DC0;
          }
          else {
            v20 = off_1A4DC8;
          }
          id v21 = [(__objc2_class *)*v20 animationPathWithKey:v18];
          [(MCFilter *)self->_filter addAnimationPath:v21];
          [v19 setAnimationPath:v21];
        }
        id v15 = [(NSMutableDictionary *)animationPaths countByEnumeratingWithState:&v31 objects:v40 count:16];
      }
      while (v15);
    }
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v22 = self->_animationPaths;
    id v23 = [(NSMutableDictionary *)v22 countByEnumeratingWithState:&v27 objects:v39 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v28;
      do
      {
        for (k = 0; k != v24; k = (char *)k + 1)
        {
          if (*(void *)v28 != v25) {
            objc_enumerationMutation(v22);
          }
          objc_msgSend(-[NSMutableDictionary objectForKey:](self->_animationPaths, "objectForKey:", *(void *)(*((void *)&v27 + 1) + 8 * (void)k)), "setAnimationPath:", 0);
        }
        id v24 = [(NSMutableDictionary *)v22 countByEnumeratingWithState:&v27 objects:v39 count:16];
      }
      while (v24);
    }
  }
}

- (void)setParent:(id)a3
{
  if (a3 && self->_parent) {
    objc_exception_throw(+[NSException exceptionWithName:@"ManyToOneException" reason:@"A filter may one have one parent.  Please remove it first.  This is unsupported." userInfo:0]);
  }
  self->_parent = (MPFilterSupport *)a3;
}

- (id)parentDocument
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = (MPFilterSupport *)[(MPFilterSupport *)self->_parent parentEffect];
LABEL_6:
    parent = (MPFilterSupport *)objc_msgSend(-[MPFilterSupport parentContainer](v3, "parentContainer"), "parentLayer");
    goto LABEL_7;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  parent = self->_parent;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
    id v3 = self->_parent;
    goto LABEL_6;
  }
LABEL_7:
  return [(MPFilterSupport *)parent parentDocument];
}

@end