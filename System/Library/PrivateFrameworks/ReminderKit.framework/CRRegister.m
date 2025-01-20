@interface CRRegister
+ (id)registerWithType:(unint64_t)a3 contents:(id)a4;
+ (id)registerWithType:(unint64_t)a3 contents:(id)a4 document:(id)a5;
- (BOOL)isEqualContents:(id)a3;
- (CRDocument)document;
- (CRRegister)initWithCRCoder:(id)a3;
- (CRRegister)initWithDocument:(id)a3;
- (id)deltaSince:(id)a3 in:(id)a4;
- (id)tombstone;
- (void)encodeWithCRCoder:(id)a3;
- (void)mergeWith:(id)a3;
- (void)setDocument:(id)a3;
- (void)walkGraph:(id)a3;
@end

@implementation CRRegister

+ (id)registerWithType:(unint64_t)a3 contents:(id)a4
{
  return +[CRRegister registerWithType:a3 contents:a4 document:0];
}

+ (id)registerWithType:(unint64_t)a3 contents:(id)a4 document:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (a3 > 4) {
    v9 = 0;
  }
  else {
    v9 = (void *)[objc_alloc(*off_1E61DE598[a3]) initWithContents:v7 document:v8];
  }

  return v9;
}

- (CRRegister)initWithDocument:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRRegister;
  v5 = [(CRRegister *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_document, v4);
  }

  return v6;
}

- (BOOL)isEqualContents:(id)a3
{
  return 0;
}

- (void)mergeWith:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Subclass must implement." userInfo:0];
  objc_exception_throw(v4);
}

- (id)deltaSince:(id)a3 in:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Subclass must implement." userInfo:0];
  objc_exception_throw(v7);
}

- (void)walkGraph:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Subclass must implement." userInfo:0];
  objc_exception_throw(v4);
}

- (id)tombstone
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Cannot tombstone a non-value / non-identified object." userInfo:0];
  objc_exception_throw(v2);
}

- (void)encodeWithCRCoder:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Subclass must implement." userInfo:0];
  objc_exception_throw(v4);
}

- (CRRegister)initWithCRCoder:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Subclass must implement." userInfo:0];
  objc_exception_throw(v4);
}

- (CRDocument)document
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_document);

  return (CRDocument *)WeakRetained;
}

- (void)setDocument:(id)a3
{
}

- (void).cxx_destruct
{
}

@end