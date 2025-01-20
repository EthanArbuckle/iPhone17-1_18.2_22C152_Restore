@interface GQDGroup
+ (const)stateForReading;
- (__CFArray)drawables;
- (id)externalTextWrap;
- (void)dealloc;
@end

@implementation GQDGroup

+ (const)stateForReading
{
  return (const StateSpec *)&unk_9EAE0;
}

- (void)dealloc
{
  mDrawables = self->mDrawables;
  if (mDrawables) {
    CFRelease(mDrawables);
  }

  v4.receiver = self;
  v4.super_class = (Class)GQDGroup;
  [(GQDDrawable *)&v4 dealloc];
}

- (__CFArray)drawables
{
  return self->mDrawables;
}

- (id)externalTextWrap
{
  return self->mExternalTextWrap;
}

@end