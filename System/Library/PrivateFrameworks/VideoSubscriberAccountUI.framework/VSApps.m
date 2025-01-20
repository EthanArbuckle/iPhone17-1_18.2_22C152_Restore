@interface VSApps
- (BOOL)hasChannelApps;
- (BOOL)hasUserChannelList;
- (NSArray)availableApps;
- (NSArray)nonChannelApps;
- (NSArray)subscribedApps;
- (VSApps)init;
- (id)description;
- (void)setAvailableApps:(id)a3;
- (void)setHasChannelApps:(BOOL)a3;
- (void)setHasUserChannelList:(BOOL)a3;
- (void)setNonChannelApps:(id)a3;
- (void)setSubscribedApps:(id)a3;
@end

@implementation VSApps

- (VSApps)init
{
  v10.receiver = self;
  v10.super_class = (Class)VSApps;
  v2 = [(VSApps *)&v10 init];
  if (v2)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    nonChannelApps = v2->_nonChannelApps;
    v2->_nonChannelApps = v3;

    v5 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    availableApps = v2->_availableApps;
    v2->_availableApps = v5;

    v7 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    subscribedApps = v2->_subscribedApps;
    v2->_subscribedApps = v7;
  }
  return v2;
}

- (id)description
{
  v15 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v18 = NSStringFromClass(v3);
  v16 = [(VSApps *)self nonChannelApps];
  v4 = [v16 description];
  v17 = v4;
  if (!v4)
  {
    v17 = [MEMORY[0x263EFF9D0] null];
  }
  v5 = [(VSApps *)self availableApps];
  v6 = [v5 description];
  v7 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x263EFF9D0] null];
  }
  v8 = [(VSApps *)self subscribedApps];
  v9 = [v8 description];
  objc_super v10 = v9;
  if (!v9)
  {
    objc_super v10 = [MEMORY[0x263EFF9D0] null];
  }
  v11 = objc_msgSend(NSString, "vs_yesNoStringValueFromBool:", -[VSApps hasUserChannelList](self, "hasUserChannelList"));
  v12 = objc_msgSend(NSString, "vs_yesNoStringValueFromBool:", -[VSApps hasChannelApps](self, "hasChannelApps"));
  v13 = [v15 stringWithFormat:@"<%@ %p %@=%@, %@=%@, %@=%@, %@=%@, %@=%@>", v18, self, @"nonChannelApps", v17, @"availableApps", v7, @"subscribedApps", v10, @"hasUserChannelList", v11, @"hasChannelApps", v12];

  if (!v9) {
  if (!v6)
  }

  if (!v4) {
  return v13;
  }
}

- (NSArray)nonChannelApps
{
  return self->_nonChannelApps;
}

- (void)setNonChannelApps:(id)a3
{
}

- (NSArray)availableApps
{
  return self->_availableApps;
}

- (void)setAvailableApps:(id)a3
{
}

- (NSArray)subscribedApps
{
  return self->_subscribedApps;
}

- (void)setSubscribedApps:(id)a3
{
}

- (BOOL)hasUserChannelList
{
  return self->_hasUserChannelList;
}

- (void)setHasUserChannelList:(BOOL)a3
{
  self->_hasUserChannelList = a3;
}

- (BOOL)hasChannelApps
{
  return self->_hasChannelApps;
}

- (void)setHasChannelApps:(BOOL)a3
{
  self->_hasChannelApps = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribedApps, 0);
  objc_storeStrong((id *)&self->_availableApps, 0);
  objc_storeStrong((id *)&self->_nonChannelApps, 0);
}

@end