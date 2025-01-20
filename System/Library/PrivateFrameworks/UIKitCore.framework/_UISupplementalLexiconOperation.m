@interface _UISupplementalLexiconOperation
- (_UISupplementalLexicon)lexicon;
- (id)initAddOperationWithLexicon:(id)a3;
- (id)initRemoveOperationWithLexiconIdentifier:(unint64_t)a3;
- (unint64_t)lexiconIdentifier;
- (unint64_t)type;
@end

@implementation _UISupplementalLexiconOperation

- (id)initAddOperationWithLexicon:(id)a3
{
  v4 = (id *)a3;
  v8.receiver = self;
  v8.super_class = (Class)_UISupplementalLexiconOperation;
  v5 = [(_UISupplementalLexiconOperation *)&v8 init];
  v6 = v5;
  if (v5)
  {
    v5->_type = 0;
    objc_storeWeak((id *)&v5->_lexicon, v4);
    v6->_lexiconIdentifier = [v4[1] identifier];
  }

  return v6;
}

- (id)initRemoveOperationWithLexiconIdentifier:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UISupplementalLexiconOperation;
  id result = [(_UISupplementalLexiconOperation *)&v5 init];
  if (result)
  {
    *((void *)result + 1) = 1;
    *((void *)result + 3) = a3;
  }
  return result;
}

- (unint64_t)type
{
  return self->_type;
}

- (_UISupplementalLexicon)lexicon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lexicon);
  return (_UISupplementalLexicon *)WeakRetained;
}

- (unint64_t)lexiconIdentifier
{
  return self->_lexiconIdentifier;
}

- (void).cxx_destruct
{
}

@end