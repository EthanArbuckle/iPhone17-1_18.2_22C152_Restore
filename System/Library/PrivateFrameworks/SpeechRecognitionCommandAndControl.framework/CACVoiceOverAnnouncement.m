@interface CACVoiceOverAnnouncement
- (CACVoiceOverAnnouncement)initWithMessage:(id)a3 type:(int64_t)a4 completion:(id)a5;
- (NSString)message;
- (id)completion;
- (int64_t)type;
@end

@implementation CACVoiceOverAnnouncement

- (CACVoiceOverAnnouncement)initWithMessage:(id)a3 type:(int64_t)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CACVoiceOverAnnouncement;
  v11 = [(CACVoiceOverAnnouncement *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_message, a3);
    v12->_type = a4;
    uint64_t v13 = MEMORY[0x23EC8F1E0](v10);
    id completion = v12->_completion;
    v12->_id completion = (id)v13;
  }
  return v12;
}

- (NSString)message
{
  return self->_message;
}

- (int64_t)type
{
  return self->_type;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end