@interface CRLCommandSelectionBehavior
- (BOOL)usePersistableCommitSelectionPath;
- (CRLCommandSelectionBehavior)initWithCommitSelectionPath:(id)a3 forwardSelectionPath:(id)a4 reverseSelectionPath:(id)a5;
- (CRLCommandSelectionBehavior)initWithCommitSelectionPath:(id)a3 forwardSelectionPath:(id)a4 reverseSelectionPath:(id)a5 usePersistableCommitSelectionPath:(BOOL)a6;
- (CRLCommandSelectionBehavior)initWithForwardSelectionPath:(id)a3 reverseSelectionPath:(id)a4;
- (CRLCommandSelectionBehavior)initWithForwardSelectionPath:(id)a3 reverseSelectionPath:(id)a4 selectionFlags:(unint64_t)a5;
- (CRLCommandSelectionBehavior)initWithForwardSelectionPath:(id)a3 reverseSelectionPath:(id)a4 selectionFlags:(unint64_t)a5 commitSelectionFlags:(unint64_t)a6;
- (CRLCommandSelectionBehavior)initWithForwardSelectionPath:(id)a3 reverseSelectionPath:(id)a4 selectionFlags:(unint64_t)a5 commitSelectionFlags:(unint64_t)a6 forwardSelectionFlags:(unint64_t)a7 reverseSelectionFlags:(unint64_t)a8;
- (CRLCommandSelectionBehavior)initWithPersistableForwardSelectionPath:(id)a3 persistableReverseSelectionPath:(id)a4 commitSelectionPath:(id)a5 selectionFlags:(unint64_t)a6 commitSelectionFlags:(unint64_t)a7 forwardSelectionFlags:(unint64_t)a8 reverseSelectionFlags:(unint64_t)a9;
- (CRLSelectionPath)commitSelectionPath;
- (_TtC8Freeform27CRLPersistableSelectionPath)persistableCommitSelectionPath;
- (_TtC8Freeform27CRLPersistableSelectionPath)persistableForwardSelectionPath;
- (_TtC8Freeform27CRLPersistableSelectionPath)persistableReverseSelectionPath;
- (id)commandSelectionBehaviorByCoalescingWithCommandSelectionBehavior:(id)a3;
- (unint64_t)additionalCommitSelectionFlags;
- (unint64_t)additionalForwardSelectionFlags;
- (unint64_t)additionalReverseSelectionFlags;
- (unint64_t)selectionFlags;
- (void)setCommitSelectionPath:(id)a3;
- (void)setForwardSelectionPath:(id)a3;
- (void)setPersistableCommitSelectionPath:(id)a3;
- (void)setPersistableForwardSelectionPath:(id)a3;
- (void)setPersistableReverseSelectionPath:(id)a3;
- (void)setReverseSelectionPath:(id)a3;
- (void)setSelectionFlags:(unint64_t)a3;
- (void)setUsePersistableCommitSelectionPath:(BOOL)a3;
@end

@implementation CRLCommandSelectionBehavior

- (CRLCommandSelectionBehavior)initWithPersistableForwardSelectionPath:(id)a3 persistableReverseSelectionPath:(id)a4 commitSelectionPath:(id)a5 selectionFlags:(unint64_t)a6 commitSelectionFlags:(unint64_t)a7 forwardSelectionFlags:(unint64_t)a8 reverseSelectionFlags:(unint64_t)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CRLCommandSelectionBehavior;
  v19 = [(CRLCommandSelectionBehavior *)&v22 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_persistableForwardSelectionPath, a3);
    objc_storeStrong((id *)&v20->_persistableReverseSelectionPath, a4);
    objc_storeStrong((id *)&v20->_commitSelectionPath, a5);
    v20->_selectionFlags = a6;
    v20->_additionalForwardSelectionFlags = a8;
    v20->_additionalReverseSelectionFlags = a9;
    v20->_additionalCommitSelectionFlags = a7;
    v20->_usePersistableCommitSelectionPath = 0;
  }

  return v20;
}

- (CRLCommandSelectionBehavior)initWithForwardSelectionPath:(id)a3 reverseSelectionPath:(id)a4 selectionFlags:(unint64_t)a5 commitSelectionFlags:(unint64_t)a6 forwardSelectionFlags:(unint64_t)a7 reverseSelectionFlags:(unint64_t)a8
{
  id v14 = a4;
  id v15 = a3;
  id v16 = [[_TtC8Freeform27CRLPersistableSelectionPath alloc] initWithSelectionPath:v15];
  id v17 = [[_TtC8Freeform27CRLPersistableSelectionPath alloc] initWithSelectionPath:v14];

  id v18 = [(CRLCommandSelectionBehavior *)self initWithPersistableForwardSelectionPath:v16 persistableReverseSelectionPath:v17 commitSelectionPath:v15 selectionFlags:a5 commitSelectionFlags:a6 forwardSelectionFlags:a7 reverseSelectionFlags:a8];
  return v18;
}

- (CRLCommandSelectionBehavior)initWithForwardSelectionPath:(id)a3 reverseSelectionPath:(id)a4 selectionFlags:(unint64_t)a5 commitSelectionFlags:(unint64_t)a6
{
  return [(CRLCommandSelectionBehavior *)self initWithForwardSelectionPath:a3 reverseSelectionPath:a4 selectionFlags:a5 commitSelectionFlags:a6 forwardSelectionFlags:0 reverseSelectionFlags:0];
}

- (CRLCommandSelectionBehavior)initWithForwardSelectionPath:(id)a3 reverseSelectionPath:(id)a4 selectionFlags:(unint64_t)a5
{
  return [(CRLCommandSelectionBehavior *)self initWithForwardSelectionPath:a3 reverseSelectionPath:a4 selectionFlags:a5 commitSelectionFlags:0];
}

- (CRLCommandSelectionBehavior)initWithForwardSelectionPath:(id)a3 reverseSelectionPath:(id)a4
{
  return [(CRLCommandSelectionBehavior *)self initWithForwardSelectionPath:a3 reverseSelectionPath:a4 selectionFlags:0];
}

- (CRLCommandSelectionBehavior)initWithCommitSelectionPath:(id)a3 forwardSelectionPath:(id)a4 reverseSelectionPath:(id)a5
{
  return [(CRLCommandSelectionBehavior *)self initWithCommitSelectionPath:a3 forwardSelectionPath:a4 reverseSelectionPath:a5 usePersistableCommitSelectionPath:0];
}

- (CRLCommandSelectionBehavior)initWithCommitSelectionPath:(id)a3 forwardSelectionPath:(id)a4 reverseSelectionPath:(id)a5 usePersistableCommitSelectionPath:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  v11 = [(CRLCommandSelectionBehavior *)self initWithForwardSelectionPath:a4 reverseSelectionPath:a5];
  v12 = v11;
  if (v11)
  {
    [(CRLCommandSelectionBehavior *)v11 setUsePersistableCommitSelectionPath:v6];
    [(CRLCommandSelectionBehavior *)v12 setCommitSelectionPath:v10];
  }

  return v12;
}

- (void)setCommitSelectionPath:(id)a3
{
  v7 = (CRLSelectionPath *)a3;
  if (self->_commitSelectionPath != v7) {
    objc_storeStrong((id *)&self->_commitSelectionPath, a3);
  }
  if ([(CRLCommandSelectionBehavior *)self usePersistableCommitSelectionPath])
  {
    v5 = [[_TtC8Freeform27CRLPersistableSelectionPath alloc] initWithSelectionPath:v7];
    persistableCommitSelectionPath = self->_persistableCommitSelectionPath;
    self->_persistableCommitSelectionPath = v5;
  }
}

- (void)setForwardSelectionPath:(id)a3
{
  id v6 = a3;
  v4 = [[_TtC8Freeform27CRLPersistableSelectionPath alloc] initWithSelectionPath:v6];
  if (v4 != self->_persistableForwardSelectionPath)
  {
    v5 = [[_TtC8Freeform27CRLPersistableSelectionPath alloc] initWithSelectionPath:self->_commitSelectionPath];
    if (v5 == self->_persistableForwardSelectionPath) {
      [(CRLCommandSelectionBehavior *)self setCommitSelectionPath:v6];
    }

    objc_storeStrong((id *)&self->_persistableForwardSelectionPath, v4);
  }
}

- (void)setReverseSelectionPath:(id)a3
{
  id v4 = a3;
  v5 = [[_TtC8Freeform27CRLPersistableSelectionPath alloc] initWithSelectionPath:v4];

  persistableReverseSelectionPath = self->_persistableReverseSelectionPath;
  self->_persistableReverseSelectionPath = v5;
}

- (void)setSelectionFlags:(unint64_t)a3
{
  self->_selectionFlags = a3;
}

- (id)commandSelectionBehaviorByCoalescingWithCommandSelectionBehavior:(id)a3
{
  id v4 = a3;
  v5 = [CRLCommandSelectionBehavior alloc];
  id v6 = [v4 persistableForwardSelectionPath];
  v7 = [(CRLCommandSelectionBehavior *)self persistableReverseSelectionPath];
  v8 = [(CRLCommandSelectionBehavior *)self commitSelectionPath];
  unint64_t v9 = [(CRLCommandSelectionBehavior *)self selectionFlags];
  id v10 = [v4 additionalForwardSelectionFlags];

  v11 = [(CRLCommandSelectionBehavior *)v5 initWithPersistableForwardSelectionPath:v6 persistableReverseSelectionPath:v7 commitSelectionPath:v8 selectionFlags:v9 commitSelectionFlags:0 forwardSelectionFlags:v10 reverseSelectionFlags:[(CRLCommandSelectionBehavior *)self additionalReverseSelectionFlags]];

  return v11;
}

- (CRLSelectionPath)commitSelectionPath
{
  return self->_commitSelectionPath;
}

- (_TtC8Freeform27CRLPersistableSelectionPath)persistableForwardSelectionPath
{
  return self->_persistableForwardSelectionPath;
}

- (void)setPersistableForwardSelectionPath:(id)a3
{
}

- (_TtC8Freeform27CRLPersistableSelectionPath)persistableReverseSelectionPath
{
  return self->_persistableReverseSelectionPath;
}

- (void)setPersistableReverseSelectionPath:(id)a3
{
}

- (_TtC8Freeform27CRLPersistableSelectionPath)persistableCommitSelectionPath
{
  return self->_persistableCommitSelectionPath;
}

- (void)setPersistableCommitSelectionPath:(id)a3
{
}

- (unint64_t)selectionFlags
{
  return self->_selectionFlags;
}

- (unint64_t)additionalCommitSelectionFlags
{
  return self->_additionalCommitSelectionFlags;
}

- (unint64_t)additionalForwardSelectionFlags
{
  return self->_additionalForwardSelectionFlags;
}

- (unint64_t)additionalReverseSelectionFlags
{
  return self->_additionalReverseSelectionFlags;
}

- (BOOL)usePersistableCommitSelectionPath
{
  return self->_usePersistableCommitSelectionPath;
}

- (void)setUsePersistableCommitSelectionPath:(BOOL)a3
{
  self->_usePersistableCommitSelectionPath = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commitSelectionPath, 0);
  objc_storeStrong((id *)&self->_persistableCommitSelectionPath, 0);
  objc_storeStrong((id *)&self->_persistableForwardSelectionPath, 0);

  objc_storeStrong((id *)&self->_persistableReverseSelectionPath, 0);
}

@end