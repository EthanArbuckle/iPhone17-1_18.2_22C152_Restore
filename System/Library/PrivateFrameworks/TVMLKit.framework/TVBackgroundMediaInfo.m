@interface TVBackgroundMediaInfo
- (BOOL)isEqual:(id)a3;
- (IKAppPlayerBridge)playerBridge;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setPlayerBridge:(id)a3;
@end

@implementation TVBackgroundMediaInfo

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v9.receiver = self,
        v9.super_class = (Class)TVBackgroundMediaInfo,
        [(TVMediaInfo *)&v9 isEqual:v4]))
  {
    v5 = [(TVBackgroundMediaInfo *)self playerBridge];
    v6 = [v4 playerBridge];
    BOOL v7 = v5 == v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TVBackgroundMediaInfo;
  id v4 = [(TVMediaInfo *)&v7 copyWithZone:a3];
  v5 = [(TVBackgroundMediaInfo *)self playerBridge];
  [v4 setPlayerBridge:v5];

  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TVBackgroundMediaInfo;
  id v4 = [(TVMediaInfo *)&v8 description];
  v5 = [(TVBackgroundMediaInfo *)self playerBridge];
  v6 = [v3 stringWithFormat:@"%@, bridge = %@", v4, v5];

  return v6;
}

- (IKAppPlayerBridge)playerBridge
{
  return self->_playerBridge;
}

- (void)setPlayerBridge:(id)a3
{
}

- (void).cxx_destruct
{
}

@end