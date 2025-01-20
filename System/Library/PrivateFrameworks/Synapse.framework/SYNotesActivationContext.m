@interface SYNotesActivationContext
+ (BOOL)supportsSecureCoding;
- (BSProcessHandle)processHandle;
- (NSData)userActivityData;
- (SYNotesActivationContext)init;
- (SYNotesActivationContext)initWithCoder:(id)a3;
- (SYNotesActivationContext)initWithUserActivityData:(id)a3 contextID:(unsigned int)a4 renderID:(unint64_t)a5;
- (unint64_t)renderID;
- (unsigned)contextID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SYNotesActivationContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SYNotesActivationContext)init
{
  return 0;
}

- (SYNotesActivationContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SYNotesActivationContext;
  v5 = [(SYNotesActivationContext *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userActivityData"];
    userActivityData = v5->_userActivityData;
    v5->_userActivityData = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"processHandle"];
    processHandle = v5->_processHandle;
    v5->_processHandle = (BSProcessHandle *)v8;

    v5->_contextID = [v4 decodeInt32ForKey:@"contextID"];
    v5->_renderID = [v4 decodeInt64ForKey:@"renderID"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(SYNotesActivationContext *)self userActivityData];
  [v6 encodeObject:v4 forKey:@"userActivityData"];

  v5 = [(SYNotesActivationContext *)self processHandle];
  [v6 encodeObject:v5 forKey:@"processHandle"];

  objc_msgSend(v6, "encodeInt32:forKey:", -[SYNotesActivationContext contextID](self, "contextID"), @"contextID");
  objc_msgSend(v6, "encodeInt64:forKey:", -[SYNotesActivationContext renderID](self, "renderID"), @"renderID");
}

- (SYNotesActivationContext)initWithUserActivityData:(id)a3 contextID:(unsigned int)a4 renderID:(unint64_t)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SYNotesActivationContext;
  v9 = [(SYNotesActivationContext *)&v15 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    userActivityData = v9->_userActivityData;
    v9->_userActivityData = (NSData *)v10;

    uint64_t v12 = [MEMORY[0x1E4F623D8] processHandle];
    processHandle = v9->_processHandle;
    v9->_processHandle = (BSProcessHandle *)v12;

    v9->_contextID = a4;
    v9->_renderID = a5;
  }

  return v9;
}

- (NSData)userActivityData
{
  return self->_userActivityData;
}

- (BSProcessHandle)processHandle
{
  return self->_processHandle;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (unint64_t)renderID
{
  return self->_renderID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong((id *)&self->_userActivityData, 0);
}

@end