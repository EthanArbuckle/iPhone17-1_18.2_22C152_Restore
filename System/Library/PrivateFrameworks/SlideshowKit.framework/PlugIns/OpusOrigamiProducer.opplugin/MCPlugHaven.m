@interface MCPlugHaven
- (MCAction)actionOnCompletion;
- (MCContainerNavigator)supercontainer;
- (MCPlugHaven)initWithImprint:(id)a3 andMontage:(id)a4;
- (NSString)idInSupercontainer;
- (id)imprint;
- (void)_copySelfToSnapshot:(id)a3;
- (void)demolish;
- (void)setActionOnCompletion:(id)a3;
- (void)setIDInSupercontainer:(id)a3;
- (void)setSupercontainer:(id)a3;
@end

@implementation MCPlugHaven

- (MCPlugHaven)initWithImprint:(id)a3 andMontage:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MCPlugHaven;
  v5 = [(MCPlug *)&v7 initWithImprint:a3 andMontage:a4];
  if (v5) {
    v5->mIDInSupercontainer = (NSString *)[a3 objectForKey:@"idInSupercontainer"];
  }
  return v5;
}

- (void)demolish
{
  self->mIDInSupercontainer = 0;
  self->mSupercontainer = 0;
  v3.receiver = self;
  v3.super_class = (Class)MCPlugHaven;
  [(MCPlug *)&v3 demolish];
}

- (id)imprint
{
  v5.receiver = self;
  v5.super_class = (Class)MCPlugHaven;
  id v3 = [(MCPlug *)&v5 imprint];
  [v3 setObject:self->mIDInSupercontainer forKey:@"idInSupercontainer"];
  return v3;
}

- (MCAction)actionOnCompletion
{
  return (MCAction *)[(MCPlug *)self actionForKey:@"onCompletion"];
}

- (void)setActionOnCompletion:(id)a3
{
}

- (void)_copySelfToSnapshot:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MCPlugHaven;
  -[MCPlug _copySelfToSnapshot:](&v6, "_copySelfToSnapshot:");
  mIDInSupercontainer = self->mIDInSupercontainer;
  if (mIDInSupercontainer) {
    *((void *)a3 + 11) = [(NSString *)mIDInSupercontainer copy];
  }
}

- (NSString)idInSupercontainer
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setIDInSupercontainer:(id)a3
{
}

- (MCContainerNavigator)supercontainer
{
  return self->mSupercontainer;
}

- (void)setSupercontainer:(id)a3
{
  self->mSupercontainer = (MCContainerNavigator *)a3;
}

@end