@interface WTSession
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSUUID)uuid;
- (WTSession)initWithGeneralCoder:(id)a3;
- (WTSession)initWithType:(int64_t)a3 textViewDelegate:(id)a4;
- (WTTextViewDelegate_Proposed_v1)textViewDelegate;
- (int64_t)compositionSessionType;
- (int64_t)requestedTool;
- (int64_t)type;
- (void)encodeWithGeneralCoder:(id)a3;
- (void)setCompositionSessionType:(int64_t)a3;
- (void)setTextViewDelegate:(id)a3;
@end

@implementation WTSession

- (WTSession)initWithType:(int64_t)a3 textViewDelegate:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WTSession;
  v7 = [(WTSession *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263F08C38] UUID];
    uuid = v7->_uuid;
    v7->_uuid = (NSUUID *)v8;

    v7->_type = a3;
    objc_storeWeak((id *)&v7->_textViewDelegate, v6);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WTSession *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = [(WTSession *)self uuid];
    v7 = [(WTSession *)v5 uuid];
    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (int64_t)requestedTool
{
  int64_t result = [(WTSession *)self type];
  if (result != 1)
  {
    int64_t v4 = [(WTSession *)self compositionSessionType];
    if ((unint64_t)(v4 - 1) > 0xB) {
      return 0;
    }
    else {
      return qword_261BE08E8[v4 - 1];
    }
  }
  return result;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithGeneralCoder:(id)a3
{
  id v5 = a3;
  int64_t v4 = [(WTSession *)self uuid];
  [v5 encodeObject:v4 forKey:@"WTSessionCodingKeyUUID"];

  objc_msgSend(v5, "encodeInt64:forKey:", -[WTSession type](self, "type"), @"WTSessionCodingKeyType");
  objc_msgSend(v5, "encodeInt64:forKey:", -[WTSession compositionSessionType](self, "compositionSessionType"), @"WTSessionCodingKeyCompositionType");
}

- (WTSession)initWithGeneralCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WTSession;
  id v5 = [(WTSession *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WTSessionCodingKeyUUID"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    v5->_type = [v4 decodeInt64ForKey:@"WTSessionCodingKeyType"];
    v5->_compositionSessionType = [v4 decodeInt64ForKey:@"WTSessionCodingKeyCompositionType"];
  }

  return v5;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (int64_t)type
{
  return self->_type;
}

- (WTTextViewDelegate_Proposed_v1)textViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textViewDelegate);

  return (WTTextViewDelegate_Proposed_v1 *)WeakRetained;
}

- (void)setTextViewDelegate:(id)a3
{
}

- (int64_t)compositionSessionType
{
  return self->_compositionSessionType;
}

- (void)setCompositionSessionType:(int64_t)a3
{
  self->_compositionSessionType = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textViewDelegate);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end