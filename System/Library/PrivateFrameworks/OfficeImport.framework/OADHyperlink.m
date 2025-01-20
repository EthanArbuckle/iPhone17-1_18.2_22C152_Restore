@interface OADHyperlink
- (BOOL)doAddToHistory;
- (BOOL)doEndSound;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVisited;
- (OADHyperlink)init;
- (id)action;
- (id)description;
- (id)invalidUrl;
- (id)targetFrame;
- (id)targetLocation;
- (id)tooltip;
- (int)targetMode;
- (unint64_t)hash;
- (void)setAction:(id)a3;
- (void)setDoAddToHistory:(BOOL)a3;
- (void)setDoEndSound:(BOOL)a3;
- (void)setInvalidUrl:(id)a3;
- (void)setIsVisited:(BOOL)a3;
- (void)setTargetFrame:(id)a3;
- (void)setTargetLocation:(id)a3;
- (void)setTargetMode:(int)a3;
- (void)setTooltip:(id)a3;
@end

@implementation OADHyperlink

- (OADHyperlink)init
{
  v3.receiver = self;
  v3.super_class = (Class)OADHyperlink;
  result = [(OADHyperlink *)&v3 init];
  if (result)
  {
    result->mTargetMode = 0;
    *(_WORD *)&result->mDoEndSound = 0;
    result->mDoAddToHistory = 1;
  }
  return result;
}

- (void)setTargetLocation:(id)a3
{
}

- (void)setTargetMode:(int)a3
{
  self->mTargetMode = a3;
}

- (void)setTargetFrame:(id)a3
{
}

- (void)setAction:(id)a3
{
}

- (void)setTooltip:(id)a3
{
}

- (void)setInvalidUrl:(id)a3
{
}

- (void)setDoEndSound:(BOOL)a3
{
  self->mDoEndSound = a3;
}

- (void)setIsVisited:(BOOL)a3
{
  self->mIsVisited = a3;
}

- (void)setDoAddToHistory:(BOOL)a3
{
  self->mDoAddToHistory = a3;
}

- (id)action
{
  return self->mAction;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    mTargetLocation = self->mTargetLocation;
    v6 = [v4 targetLocation];
    if ([(NSURL *)mTargetLocation isEqual:v6]
      && (int mTargetMode = self->mTargetMode, mTargetMode == [v4 targetMode]))
    {
      mAction = self->mAction;
      v9 = [v4 action];
      if ([(NSString *)mAction isEqualToString:v9])
      {
        mTooltip = self->mTooltip;
        v11 = [v4 tooltip];
        BOOL v12 = [(NSString *)mTooltip isEqualToString:v11];
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)targetLocation
{
  return self->mTargetLocation;
}

- (int)targetMode
{
  return self->mTargetMode;
}

- (id)targetFrame
{
  return self->mTargetFrame;
}

- (id)tooltip
{
  return self->mTooltip;
}

- (id)invalidUrl
{
  return self->mInvalidUrl;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSURL *)self->mTargetLocation hash] ^ self->mTargetMode;
  NSUInteger v4 = [(NSString *)self->mAction hash];
  return v3 ^ v4 ^ [(NSString *)self->mTooltip hash];
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADHyperlink;
  v2 = [(OADHyperlink *)&v4 description];
  return v2;
}

- (BOOL)doEndSound
{
  return self->mDoEndSound;
}

- (BOOL)isVisited
{
  return self->mIsVisited;
}

- (BOOL)doAddToHistory
{
  return self->mDoAddToHistory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mInvalidUrl, 0);
  objc_storeStrong((id *)&self->mTooltip, 0);
  objc_storeStrong((id *)&self->mAction, 0);
  objc_storeStrong((id *)&self->mTargetFrame, 0);
  objc_storeStrong((id *)&self->mTargetLocation, 0);
}

@end