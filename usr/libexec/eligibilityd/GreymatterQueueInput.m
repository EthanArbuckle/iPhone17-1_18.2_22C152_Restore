@interface GreymatterQueueInput
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)onGreymatterQueue;
- (GreymatterQueueInput)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initOnQueue:(id)a3 status:(unint64_t)a4 process:(id)a5;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setOnGreymatterQueue:(BOOL)a3;
@end

@implementation GreymatterQueueInput

- (void)setOnGreymatterQueue:(BOOL)a3
{
  self->_onGreymatterQueue = a3;
}

- (BOOL)onGreymatterQueue
{
  return self->_onGreymatterQueue;
}

- (id)description
{
  if ([(GreymatterQueueInput *)self onGreymatterQueue]) {
    CFStringRef v3 = @"Y";
  }
  else {
    CFStringRef v3 = @"N";
  }
  v7.receiver = self;
  v7.super_class = (Class)GreymatterQueueInput;
  v4 = [(EligibilityInput *)&v7 description];
  v5 = +[NSString stringWithFormat:@"[GreymatterQueueInput onQueue: %@ %@]", v3, v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (GreymatterQueueInput *)a3;
  v11.receiver = self;
  v11.super_class = (Class)GreymatterQueueInput;
  if (![(EligibilityInput *)&v11 isEqual:v4]) {
    goto LABEL_9;
  }
  if (v4 == self)
  {
    char v9 = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    unsigned int v6 = [(GreymatterQueueInput *)self onGreymatterQueue];
    unsigned int v7 = v6 ^ [(GreymatterQueueInput *)v5 onGreymatterQueue];
    if (v7 == 1)
    {
      v8 = sub_10000D0EC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[GreymatterQueueInput isEqual:]";
        __int16 v14 = 2080;
        v15 = "onGreymatterQueue";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
      }
    }
    char v9 = v7 ^ 1;
  }
  else
  {
LABEL_9:
    char v9 = 0;
  }
LABEL_11:

  return v9;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)GreymatterQueueInput;
  unint64_t v3 = [(EligibilityInput *)&v5 hash];
  return v3 ^ [(GreymatterQueueInput *)self onGreymatterQueue];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GreymatterQueueInput;
  id v4 = [(EligibilityInput *)&v6 copyWithZone:a3];
  [v4 setOnGreymatterQueue:-[GreymatterQueueInput onGreymatterQueue](self, "onGreymatterQueue")];
  return v4;
}

- (GreymatterQueueInput)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GreymatterQueueInput;
  objc_super v5 = [(EligibilityInput *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_onGreymatterQueue = [v4 decodeBoolForKey:@"onGreymatterQueue"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GreymatterQueueInput;
  id v4 = a3;
  [(EligibilityInput *)&v5 encodeWithCoder:v4];
  [v4 encodeBool:-[GreymatterQueueInput onGreymatterQueue](self, "onGreymatterQueue", v5.receiver, v5.super_class) forKey:@"onGreymatterQueue"];
}

- (id)initOnQueue:(id)a3 status:(unint64_t)a4 process:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    xpc_type_t type = xpc_get_type(v8);
    if (type != (xpc_type_t)&_xpc_type_BOOL)
    {
      objc_super v11 = type;
      v12 = sub_10000D0EC();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[GreymatterQueueInput initOnQueue:status:process:]";
        __int16 v20 = 2080;
        name = xpc_type_get_name(v11);
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s: Greymatter Queue state input is wrong data type: %s", buf, 0x16u);
      }

      v13 = 0;
      goto LABEL_11;
    }
    BOOL value = xpc_BOOL_get_value(v8);
  }
  else
  {
    BOOL value = 0;
  }
  v17.receiver = self;
  v17.super_class = (Class)GreymatterQueueInput;
  v15 = [(EligibilityInput *)&v17 initWithInputType:9 status:a4 process:v9];
  if (v15) {
    v15->_onGreymatterQueue = value;
  }
  self = v15;
  v13 = self;
LABEL_11:

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end