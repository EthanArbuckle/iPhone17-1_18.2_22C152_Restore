@interface MCContainer
- (MCAudioPlaylist)audioPlaylist;
- (MCAudioPlaylist)audioPlaylistCreateIfNeeded;
- (MCContainer)init;
- (MCContainer)initWithImprint:(id)a3 andMontage:(id)a4;
- (MCPlug)referencingPlug;
- (NSDictionary)initialState;
- (id)imprint;
- (id)specialRetain;
- (void)dealloc;
- (void)demolish;
- (void)referenceByPlug:(id)a3;
- (void)setInitialState:(id)a3;
- (void)specialRelease;
- (void)unreferenceByPlug:(id)a3;
@end

@implementation MCContainer

- (MCContainer)init
{
  v3.receiver = self;
  v3.super_class = (Class)MCContainer;
  return [(MCContainer *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)MCContainer;
  [(MCObject *)&v2 dealloc];
}

- (MCContainer)initWithImprint:(id)a3 andMontage:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MCContainer;
  v6 = -[MCObject initWithImprint:andMontage:](&v9, "initWithImprint:andMontage:");
  if (v6)
  {
    v7 = +[MCObject objectWithImprint:andMontage:](MCObject, "objectWithImprint:andMontage:", [a3 objectForKey:@"audioPlaylist"], a4);
    v6->mAudioPlaylist = (MCAudioPlaylist *)v7;
    [(MCObject *)v7 setContainer:v6];
    v6->mInitialState = (NSDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", objc_msgSend(a3, "objectForKey:", @"initialState"));
  }
  return v6;
}

- (void)demolish
{
  mAudioPlaylist = self->mAudioPlaylist;
  [(MCContainer *)self willChangeValueForKey:@"audioPlaylist"];
  self->mAudioPlaylist = 0;
  [(MCContainer *)self didChangeValueForKey:@"audioPlaylist"];
  [(MCAudioPlaylist *)mAudioPlaylist demolish];

  self->mReferencingPlug = 0;
  self->mInitialState = 0;
  v4.receiver = self;
  v4.super_class = (Class)MCContainer;
  [(MCObject *)&v4 demolish];
}

- (id)imprint
{
  v7.receiver = self;
  v7.super_class = (Class)MCContainer;
  id v3 = [(MCObject *)&v7 imprint];
  mAudioPlaylist = self->mAudioPlaylist;
  if (mAudioPlaylist) {
    objc_msgSend(v3, "setObject:forKey:", -[MCAudioPlaylist imprint](mAudioPlaylist, "imprint"), @"audioPlaylist");
  }
  mInitialState = self->mInitialState;
  if (mInitialState) {
    [v3 setObject:mInitialState forKey:@"initialState"];
  }
  return v3;
}

- (MCAudioPlaylist)audioPlaylistCreateIfNeeded
{
  result = self->mAudioPlaylist;
  if (!result)
  {
    objc_sync_enter(self);
    if (!self->mAudioPlaylist)
    {
      objc_super v4 = [(MCObject *)[MCAudioPlaylist alloc] initFromScratchWithMontage:self->super.mMontage];
      [(MCAudioPlaylist *)v4 setContainer:self];
      [(MCContainer *)self willChangeValueForKey:@"audioPlaylist"];
      self->mAudioPlaylist = v4;
      [(MCContainer *)self didChangeValueForKey:@"audioPlaylist"];
    }
    objc_sync_exit(self);
    return self->mAudioPlaylist;
  }
  return result;
}

- (void)referenceByPlug:(id)a3
{
  self->mReferencingPlug = (MCPlug *)a3;
}

- (void)unreferenceByPlug:(id)a3
{
  self->mReferencingPlug = 0;
  if (!self->mSpecialRetainCount)
  {
    [(MCMontage *)self->super.mMontage forgetAboutContainer:self];
    [(MCContainer *)self demolish];
  }
}

- (id)specialRetain
{
  objc_sync_enter(self);
  id v3 = self;
  ++self->mSpecialRetainCount;
  objc_sync_exit(self);
  return v3;
}

- (void)specialRelease
{
  --self->mSpecialRetainCount;

  if (!self->mReferencingPlug && !self->mSpecialRetainCount)
  {
    [(MCMontage *)self->super.mMontage forgetAboutContainer:self];
    [(MCContainer *)self demolish];
  }
}

- (MCAudioPlaylist)audioPlaylist
{
  return self->mAudioPlaylist;
}

- (NSDictionary)initialState
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInitialState:(id)a3
{
}

- (MCPlug)referencingPlug
{
  return self->mReferencingPlug;
}

@end