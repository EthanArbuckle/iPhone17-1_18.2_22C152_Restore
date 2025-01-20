@interface NUNISceneUpdateDescription
+ (id)descriptionWithVista:(unint64_t)a3 updateBlock:(id)a4;
- (BOOL)isEarth;
- (BOOL)isLuna;
- (NUNISceneUpdateDescription)initWithVista:(unint64_t)a3 updateBlock:(id)a4;
- (id)updateBlock;
- (unint64_t)vista;
- (void)setUpdateBlock:(id)a3;
- (void)setVista:(unint64_t)a3;
@end

@implementation NUNISceneUpdateDescription

+ (id)descriptionWithVista:(unint64_t)a3 updateBlock:(id)a4
{
  id v5 = a4;
  v6 = [[NUNISceneUpdateDescription alloc] initWithVista:a3 updateBlock:v5];

  return v6;
}

- (NUNISceneUpdateDescription)initWithVista:(unint64_t)a3 updateBlock:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NUNISceneUpdateDescription;
  v7 = [(NUNISceneUpdateDescription *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_vista = a3;
    v9 = _Block_copy(v6);
    id updateBlock = v8->_updateBlock;
    v8->_id updateBlock = v9;
  }
  return v8;
}

- (BOOL)isEarth
{
  return self->_vista == 0;
}

- (BOOL)isLuna
{
  return self->_vista == 1;
}

- (unint64_t)vista
{
  return self->_vista;
}

- (void)setVista:(unint64_t)a3
{
  self->_vista = a3;
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end