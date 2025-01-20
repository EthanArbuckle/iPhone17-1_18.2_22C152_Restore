@interface _TUIFeedCaptureInstanceKey
- (BOOL)isEqual:(id)a3;
- (NSObject)instance;
- (NSObject)options;
- (_TUIFeedCaptureInstanceKey)initWithInstance:(id)a3 options:(id)a4;
- (unint64_t)hash;
@end

@implementation _TUIFeedCaptureInstanceKey

- (_TUIFeedCaptureInstanceKey)initWithInstance:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_TUIFeedCaptureInstanceKey;
  v9 = [(_TUIFeedCaptureInstanceKey *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_instance, a3);
    objc_storeStrong((id *)&v10->_options, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[self->_instance hash];
  return (unint64_t)[self->_options hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()
    && ((instance = self->_instance, instance == v4[1])
     || -[NSObject isEqual:](instance, "isEqual:")))
  {
    options = self->_options;
    if (options == v4[2]) {
      unsigned __int8 v6 = 1;
    }
    else {
      unsigned __int8 v6 = -[NSObject isEqual:](options, "isEqual:");
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (NSObject)instance
{
  return self->_instance;
}

- (NSObject)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_instance, 0);
}

@end