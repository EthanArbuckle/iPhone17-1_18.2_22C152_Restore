@interface _VOSProfileGesture
+ (BOOL)supportsSecureCoding;
+ (id)profileGestureWithGesture:(id)a3;
+ (id)profileGestureWithStringValue:(id)a3;
- (BOOL)isEqual:(id)a3;
- (VOSGesture)gesture;
- (_VOSProfileCommand)command;
- (_VOSProfileGesture)initWithCoder:(id)a3;
- (id)_initWithGesture:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCommand:(id)a3;
- (void)setGesture:(id)a3;
@end

@implementation _VOSProfileGesture

+ (id)profileGestureWithGesture:(id)a3
{
  id v3 = a3;
  id v4 = [[_VOSProfileGesture alloc] _initWithGesture:v3];

  return v4;
}

+ (id)profileGestureWithStringValue:(id)a3
{
  id v4 = +[VOSGesture gestureWithStringValue:a3];
  if (v4)
  {
    v5 = [a1 profileGestureWithGesture:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_initWithGesture:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_VOSProfileGesture;
  v6 = [(_VOSProfileGesture *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_gesture, a3);
  }

  return v7;
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(_VOSProfileGesture *)self gesture];
  v7 = [v6 rawValue];
  v8 = [v3 stringWithFormat:@"%@<%p>: rawValue '%@'", v5, self, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  return [(VOSGesture *)self->_gesture hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 gesture];
    v6 = [(_VOSProfileGesture *)self gesture];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (_VOSProfileGesture)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gesture"];

  v6 = +[VOSGesture gestureWithStringValue:v5];
  if (!v6)
  {
    v6 = +[VOSGesture Invalid];
  }
  char v7 = [(_VOSProfileGesture *)self _initWithGesture:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  gesture = self->_gesture;
  id v4 = a3;
  id v5 = [(VOSGesture *)gesture rawValue];
  [v4 encodeObject:v5 forKey:@"gesture"];
}

- (VOSGesture)gesture
{
  return self->_gesture;
}

- (void)setGesture:(id)a3
{
}

- (_VOSProfileCommand)command
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_command);

  return (_VOSProfileCommand *)WeakRetained;
}

- (void)setCommand:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_command);

  objc_storeStrong((id *)&self->_gesture, 0);
}

@end