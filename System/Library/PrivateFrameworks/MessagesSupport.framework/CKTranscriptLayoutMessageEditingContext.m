@interface CKTranscriptLayoutMessageEditingContext
- (BOOL)isEqualToContext:(id)a3;
- (CKTranscriptLayoutMessageEditingContext)initWithEditedMessageGuid:(id)a3 editedMessageHeight:(double)a4;
- (NSString)editedMessageGuid;
- (double)editedMessageHeight;
- (void)setEditedMessageGuid:(id)a3;
- (void)setEditedMessageHeight:(double)a3;
@end

@implementation CKTranscriptLayoutMessageEditingContext

- (CKTranscriptLayoutMessageEditingContext)initWithEditedMessageGuid:(id)a3 editedMessageHeight:(double)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKTranscriptLayoutMessageEditingContext;
  v7 = [(CKTranscriptLayoutMessageEditingContext *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    editedMessageGuid = v7->_editedMessageGuid;
    v7->_editedMessageGuid = (NSString *)v8;

    v7->_editedMessageHeight = a4;
  }

  return v7;
}

- (BOOL)isEqualToContext:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4
    && (editedMessageGuid = self->_editedMessageGuid,
        [v4 editedMessageGuid],
        v7 = objc_claimAutoreleasedReturnValue(),
        LODWORD(editedMessageGuid) = [(NSString *)editedMessageGuid isEqualToString:v7],
        v7,
        editedMessageGuid))
  {
    double editedMessageHeight = self->_editedMessageHeight;
    [v5 editedMessageHeight];
    BOOL v10 = vabdd_f64(editedMessageHeight, v9) <= 0.001;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (NSString)editedMessageGuid
{
  return self->_editedMessageGuid;
}

- (void)setEditedMessageGuid:(id)a3
{
}

- (double)editedMessageHeight
{
  return self->_editedMessageHeight;
}

- (void)setEditedMessageHeight:(double)a3
{
  self->_double editedMessageHeight = a3;
}

- (void).cxx_destruct
{
}

@end