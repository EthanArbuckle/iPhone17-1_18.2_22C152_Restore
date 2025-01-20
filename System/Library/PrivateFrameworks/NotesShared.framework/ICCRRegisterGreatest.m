@interface ICCRRegisterGreatest
- (ICCRRegisterGreatest)initWithICCRCoder:(id)a3;
- (int64_t)compare:(id)a3 with:(id)a4;
- (void)encodeWithICCRCoder:(id)a3;
- (void)mergeWith:(id)a3;
- (void)mergeWithRegisterGreatest:(id)a3;
- (void)setContents:(id)a3;
@end

@implementation ICCRRegisterGreatest

- (void)encodeWithICCRCoder:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [v6 currentDocumentObjectForEncoding];
  uint64_t v5 = v4;
  if (*(_DWORD *)(v4 + 48) != 2)
  {
    CRDT::Document_DocObject::clear_contents(v4);
    *(_DWORD *)(v5 + 48) = 2;
    operator new();
  }
  [(ICCRRegisterLatest *)self encodeIntoProtobufRegisterLatest:*(void *)(v4 + 40) coder:v6];
}

- (ICCRRegisterGreatest)initWithICCRCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 currentDocumentObjectForDecoding];
  if (*(_DWORD *)(v5 + 48) == 2)
  {
    id v6 = [(ICCRRegisterLatest *)self initWithProtobufRegisterLatest:*(void *)(v5 + 40) decoder:v4];
  }
  else
  {
    v7 = [v4 document];
    id v6 = [(ICCRRegisterLatest *)self initWithContents:0 document:v7];
  }
  return v6;
}

- (int64_t)compare:(id)a3 with:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5 == v6)
  {
    int64_t v8 = 0;
  }
  else if (v5)
  {
    if (v6) {
      int64_t v8 = [v5 compare:v6];
    }
    else {
      int64_t v8 = 1;
    }
  }
  else
  {
    int64_t v8 = -1;
  }

  return v8;
}

- (void)setContents:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCRRegisterLatest *)self contents];
  int64_t v6 = [(ICCRRegisterGreatest *)self compare:v5 with:v4];

  if (v6 == -1)
  {
    v7.receiver = self;
    v7.super_class = (Class)ICCRRegisterGreatest;
    [(ICCRRegisterLatest *)&v7 setContents:v4];
  }
}

- (void)mergeWith:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], @"Invalid merge, classes must be equal for merge.", 0 reason userInfo];
    objc_exception_throw(v4);
  }
  [(ICCRRegisterGreatest *)self mergeWithRegisterGreatest:v5];
}

- (void)mergeWithRegisterGreatest:(id)a3
{
  id v9 = a3;
  id v4 = [(ICCRRegisterLatest *)self contents];
  id v5 = [v9 contents];
  int64_t v6 = [(ICCRRegisterGreatest *)self compare:v4 with:v5];

  if (v6 == -1)
  {
    objc_super v7 = [v9 contents];
    [(ICCRRegisterLatest *)self _setContents:v7];

    int64_t v8 = [v9 timestamp];
    [(ICCRRegisterLatest *)self setTimestamp:v8];
  }
}

@end