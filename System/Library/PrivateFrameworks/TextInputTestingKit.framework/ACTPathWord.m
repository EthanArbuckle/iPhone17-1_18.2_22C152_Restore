@interface ACTPathWord
- (ACTPathWord)initWithPath:(id)a3 intendedString:(id)a4 keyplane:(id)a5 fromUserData:(BOOL)a6;
- (BOOL)fromUserData;
- (NSString)intendedString;
- (TIContinuousPath)path;
- (TTKKeyboardPlane)keyplane;
- (id)callback;
- (id)description;
- (void)applyWithTyper:(id)a3 log:(id)a4;
- (void)setCallback:(id)a3;
@end

@implementation ACTPathWord

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_keyplane, 0);
  objc_storeStrong((id *)&self->_intendedString, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)setCallback:(id)a3
{
}

- (id)callback
{
  return self->_callback;
}

- (BOOL)fromUserData
{
  return self->_fromUserData;
}

- (TTKKeyboardPlane)keyplane
{
  return self->_keyplane;
}

- (NSString)intendedString
{
  return self->_intendedString;
}

- (TIContinuousPath)path
{
  return self->_path;
}

- (void)applyWithTyper:(id)a3 log:(id)a4
{
  v24[4] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  if ([v6 isDebugEnabled])
  {
    v8 = [v6 getDebugObject:@"PATH_ARRAY"];
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [MEMORY[0x263EFF980] array];
    }
    v22 = v10;

    v23[0] = @"word";
    v21 = [(ACTPathWord *)self intendedString];
    v24[0] = v21;
    v23[1] = @"path";
    v20 = [(ACTPathWord *)self path];
    v19 = [v20 toJsonDictionary];
    v11 = [v19 objectForKeyedSubscript:@"samples"];
    v24[1] = v11;
    v23[2] = @"layout";
    v12 = [(ACTPathWord *)self keyplane];
    v13 = [(ACTPathWord *)self intendedString];
    v14 = [v12 jsonFrameArrayForWord:v13];
    v24[2] = v14;
    v23[3] = @"userdata";
    v15 = objc_msgSend(NSNumber, "numberWithBool:", -[ACTPathWord fromUserData](self, "fromUserData"));
    v24[3] = v15;
    v16 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
    [v22 addObject:v16];

    [v6 addDebugObject:v22 forKey:@"PATH_ARRAY"];
  }
  v17 = [(ACTPathWord *)self path];
  v18 = [(ACTPathWord *)self callback];
  [v7 performStrokeForPath:v17 typingLog:v6 callback:v18];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(ACTPathWord *)self path];
  id v7 = [(ACTPathWord *)self intendedString];
  v8 = [(ACTPathWord *)self keyplane];
  BOOL v9 = [(ACTPathWord *)self fromUserData];
  id v10 = @"NO";
  if (v9) {
    id v10 = @"YES";
  }
  v11 = [v3 stringWithFormat:@"<%@: path=%@, intended=%@, keyplane=%@, fromUserData=%@>", v5, v6, v7, v8, v10];

  return v11;
}

- (ACTPathWord)initWithPath:(id)a3 intendedString:(id)a4 keyplane:(id)a5 fromUserData:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ACTPathWord;
  v14 = [(ACTPathWord *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_path, a3);
    uint64_t v16 = [v12 copy];
    intendedString = v15->_intendedString;
    v15->_intendedString = (NSString *)v16;

    objc_storeStrong((id *)&v15->_keyplane, a5);
    v15->_fromUserData = a6;
  }

  return v15;
}

@end