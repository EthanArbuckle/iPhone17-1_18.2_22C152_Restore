@interface MCAnimationPathPhysics
- (MCAnimationPathPhysics)initWithImprint:(id)a3;
- (float)kineticFriction;
- (float)skinFriction;
- (float)staticFriction;
- (id)imprint;
- (void)_copySelfToSnapshot:(id)a3;
- (void)setKineticFriction:(float)a3;
- (void)setSkinFriction:(float)a3;
- (void)setStaticFriction:(float)a3;
@end

@implementation MCAnimationPathPhysics

- (MCAnimationPathPhysics)initWithImprint:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MCAnimationPathPhysics;
  v4 = -[MCAnimationPath initWithImprint:](&v9, "initWithImprint:");
  if (v4)
  {
    objc_msgSend(objc_msgSend(a3, "objectForKey:", @"staticFriction"), "floatValue");
    v4->_staticFriction = v5;
    objc_msgSend(objc_msgSend(a3, "objectForKey:", @"kineticFriction"), "floatValue");
    v4->_kineticFriction = v6;
    objc_msgSend(objc_msgSend(a3, "objectForKey:", @"skinFriction"), "floatValue");
    v4->_skinFriction = v7;
  }
  return v4;
}

- (id)imprint
{
  v5.receiver = self;
  v5.super_class = (Class)MCAnimationPathPhysics;
  id v3 = [(MCAnimationPath *)&v5 imprint];
  if (self->_staticFriction != 0.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"), @"staticFriction");
  }
  if (self->_kineticFriction != 0.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"), @"kineticFriction");
  }
  if (self->_skinFriction != 0.0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"), @"skinFriction");
  }
  return v3;
}

- (void)_copySelfToSnapshot:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MCAnimationPathPhysics;
  -[MCAnimationPath _copySelfToSnapshot:](&v5, "_copySelfToSnapshot:");
  *((_DWORD *)a3 + 6) = LODWORD(self->_staticFriction);
  *((_DWORD *)a3 + 7) = LODWORD(self->_kineticFriction);
  *((_DWORD *)a3 + 8) = LODWORD(self->_skinFriction);
}

- (float)staticFriction
{
  return self->_staticFriction;
}

- (void)setStaticFriction:(float)a3
{
  self->_staticFriction = a3;
}

- (float)kineticFriction
{
  return self->_kineticFriction;
}

- (void)setKineticFriction:(float)a3
{
  self->_kineticFriction = a3;
}

- (float)skinFriction
{
  return self->_skinFriction;
}

- (void)setSkinFriction:(float)a3
{
  self->_skinFriction = a3;
}

@end