@interface OBAnimationState
- (NSString)darkName;
- (NSString)name;
- (OBAnimationState)initWithStateName:(id)a3 darkStateName:(id)a4 transitionDuration:(double)a5 transitionSpeed:(double)a6;
- (OBAnimationState)initWithStateName:(id)a3 transitionDuration:(double)a4 transitionSpeed:(double)a5;
- (double)transitionDuration;
- (double)transitionSpeed;
- (id)stateForLayer:(id)a3;
- (void)setDarkName:(id)a3;
- (void)setName:(id)a3;
- (void)setTransitionDuration:(double)a3;
- (void)setTransitionSpeed:(double)a3;
@end

@implementation OBAnimationState

- (OBAnimationState)initWithStateName:(id)a3 transitionDuration:(double)a4 transitionSpeed:(double)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)OBAnimationState;
  v9 = [(OBAnimationState *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_transitionDuration = a4;
    uint64_t v11 = [v8 copy];
    name = v10->_name;
    v10->_name = (NSString *)v11;

    v10->_transitionSpeed = a5;
  }

  return v10;
}

- (OBAnimationState)initWithStateName:(id)a3 darkStateName:(id)a4 transitionDuration:(double)a5 transitionSpeed:(double)a6
{
  id v11 = a4;
  v12 = [(OBAnimationState *)self initWithStateName:a3 transitionDuration:a5 transitionSpeed:a6];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_darkName, a4);
  }

  return v13;
}

- (NSString)darkName
{
  darkName = self->_darkName;
  if (darkName)
  {
    v3 = darkName;
  }
  else
  {
    v3 = [(OBAnimationState *)self name];
  }
  return v3;
}

- (id)stateForLayer:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FB1E20];
  id v5 = a3;
  v6 = [v4 _currentTraitCollection];
  if ([v6 userInterfaceStyle] == 2) {
    [(OBAnimationState *)self darkName];
  }
  else {
  v7 = [(OBAnimationState *)self name];
  }

  id v8 = [v5 stateWithName:v7];

  if (!v8)
  {
    v9 = _OBLoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[OBAnimationState stateForLayer:](self, v9);
    }
  }
  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void)setDarkName:(id)a3
{
}

- (double)transitionDuration
{
  return self->_transitionDuration;
}

- (void)setTransitionDuration:(double)a3
{
  self->_transitionDuration = a3;
}

- (double)transitionSpeed
{
  return self->_transitionSpeed;
}

- (void)setTransitionSpeed:(double)a3
{
  self->_transitionSpeed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)stateForLayer:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 name];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_19BF0F000, a2, OS_LOG_TYPE_ERROR, "The layer does not contain a state with %@: Invalid state name", (uint8_t *)&v4, 0xCu);
}

@end