@interface UMTask
+ (id)taskWithName:(id)a3 reason:(id)a4;
+ (id)taskWithName:(id)a3 reason:(id)a4 forBundleID:(id)a5;
- (BOOL)isFinished;
- (NSString)bundleID;
- (NSString)name;
- (NSString)reason;
- (UMTask)init;
- (id)description;
- (int)pid;
- (void)begin;
- (void)end;
- (void)setBundleID:(id)a3;
- (void)setIsFinished:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPid:(int)a3;
- (void)setReason:(id)a3;
@end

@implementation UMTask

+ (id)taskWithName:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v8, v9);
  v13 = objc_msgSend_bundleIdentifier(v10, v11, v12);

  if (!v13)
  {
    v16 = objc_msgSend_processInfo(MEMORY[0x1E4F28F80], v14, v15);
    v13 = objc_msgSend_processName(v16, v17, v18);
  }
  v19 = objc_msgSend_taskWithName_reason_forBundleID_(a1, v14, (uint64_t)v6, v7, v13);

  return v19;
}

+ (id)taskWithName:(id)a3 reason:(id)a4 forBundleID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_opt_new();
  uint64_t v12 = v10;
  if (v10)
  {
    objc_msgSend_setName_(v10, v11, (uint64_t)v7);
    objc_msgSend_setReason_(v12, v13, (uint64_t)v8);
    objc_msgSend_setBundleID_(v12, v14, (uint64_t)v9);
  }

  return v12;
}

- (UMTask)init
{
  v6.receiver = self;
  v6.super_class = (Class)UMTask;
  v2 = [(UMTask *)&v6 init];
  if (v2)
  {
    if (qword_1E92A9838 != -1) {
      dispatch_once(&qword_1E92A9838, &unk_1EE091420);
    }
    v2->_pid = dword_1E92A9840;
    uint64_t v3 = objc_opt_new();
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v3;

    v2->_isFinished = 0;
  }
  return v2;
}

- (void)begin
{
  sub_190C4D8F4();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4EF88(v3, self);
}

- (void)end
{
  objc_msgSend_setIsFinished_(self, a2, 1);
  sub_190C4D8F4();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C500B4(v3, self);
}

- (id)description
{
  id v3 = NSString;
  v4 = sub_190C44700((uint64_t)UMMobileKeyBag, self);
  id v7 = objc_msgSend_description(v4, v5, v6);
  id v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%p%@", self, v7);

  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)setIsFinished:(BOOL)a3
{
  self->_isFinished = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end