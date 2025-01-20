@interface _EditScriptIndexedAtom
+ (_EditScriptIndexedAtom)atomWithEditOperation:(int64_t)a3 indexToEdit:(unint64_t)a4 newText:(id)a5 indexInArrayB:(unint64_t)a6;
- (NSString)replacementText;
- (_EditScriptIndexedAtom)initWithEditOperation:(int64_t)a3 indexToEdit:(unint64_t)a4 newText:(id)a5 indexInArrayB:(unint64_t)a6;
- (id)description;
- (int64_t)editOperation;
- (unint64_t)indexInArrayB;
- (unint64_t)indexToEdit;
- (void)setEditOperation:(int64_t)a3;
- (void)setIndexInArrayB:(unint64_t)a3;
- (void)setIndexToEdit:(unint64_t)a3;
- (void)setReplacementText:(id)a3;
@end

@implementation _EditScriptIndexedAtom

- (_EditScriptIndexedAtom)initWithEditOperation:(int64_t)a3 indexToEdit:(unint64_t)a4 newText:(id)a5 indexInArrayB:(unint64_t)a6
{
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_EditScriptIndexedAtom;
  v11 = [(_EditScriptIndexedAtom *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(_EditScriptIndexedAtom *)v11 setEditOperation:a3];
    [(_EditScriptIndexedAtom *)v12 setIndexToEdit:a4];
    [(_EditScriptIndexedAtom *)v12 setIndexInArrayB:a6];
    [(_EditScriptIndexedAtom *)v12 setReplacementText:v10];
  }

  return v12;
}

- (id)description
{
  p_isa = self->_replacementText;
  if ([(NSString *)self->_replacementText length])
  {
    if (![(NSString *)self->_replacementText isEqualToString:@" "]) {
      goto LABEL_6;
    }
    v4 = @"[space]";
  }
  else
  {
    v4 = @"[blank]";
  }

  p_isa = &v4->isa;
LABEL_6:
  unint64_t v5 = self->_editOperation - 1;
  if (v5 > 2) {
    v6 = @"NO-OP";
  }
  else {
    v6 = off_1E52FB870[v5];
  }
  objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_indexToEdit);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (self->_indexInArrayB == 0x7FFFFFFFFFFFFFFFLL)
  {

    v8 = @"N/A";
  }
  v9 = [NSString stringWithFormat:@"editOpertaion:%@, editIndex:%lu newText:%@ indexInArrayB:%@\n", v6, self->_indexToEdit, p_isa, v8];

  return v9;
}

+ (_EditScriptIndexedAtom)atomWithEditOperation:(int64_t)a3 indexToEdit:(unint64_t)a4 newText:(id)a5 indexInArrayB:(unint64_t)a6
{
  id v9 = a5;
  id v10 = [[_EditScriptIndexedAtom alloc] initWithEditOperation:a3 indexToEdit:a4 newText:v9 indexInArrayB:a6];

  return v10;
}

- (int64_t)editOperation
{
  return self->_editOperation;
}

- (void)setEditOperation:(int64_t)a3
{
  self->_editOperation = a3;
}

- (unint64_t)indexToEdit
{
  return self->_indexToEdit;
}

- (void)setIndexToEdit:(unint64_t)a3
{
  self->_indexToEdit = a3;
}

- (unint64_t)indexInArrayB
{
  return self->_indexInArrayB;
}

- (void)setIndexInArrayB:(unint64_t)a3
{
  self->_indexInArrayB = a3;
}

- (NSString)replacementText
{
  return self->_replacementText;
}

- (void)setReplacementText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end