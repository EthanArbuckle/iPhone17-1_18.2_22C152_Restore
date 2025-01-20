@interface _UICommandItemInsertion
+ (BOOL)supportsSecureCoding;
+ (id)insertionWithAnchor:(id)a3 fallbacks:(id)a4 insertsBefore:(id)a5 insertsAfter:(id)a6;
- (BOOL)acceptBoolItemInsertionVisit:(id)a3 itemDeletionVisit:(id)a4 menuInsertionVisit:(id)a5 menuDeletionVisit:(id)a6;
- (NSArray)fallbacks;
- (NSArray)insertsAfter;
- (NSArray)insertsBefore;
- (_UICommandItemInsertion)initWithAnchor:(id)a3 fallbacks:(id)a4 insertsBefore:(id)a5 insertsAfter:(id)a6;
- (_UICommandItemInsertion)initWithCoder:(id)a3;
- (void)acceptItemInsertionVisit:(id)a3 itemDeletionVisit:(id)a4 menuInsertionVisit:(id)a5 menuDeletionVisit:(id)a6;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UICommandItemInsertion

+ (id)insertionWithAnchor:(id)a3 fallbacks:(id)a4 insertsBefore:(id)a5 insertsAfter:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[_UICommandItemInsertion alloc] initWithAnchor:v12 fallbacks:v11 insertsBefore:v10 insertsAfter:v9];

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UICommandItemInsertion)initWithAnchor:(id)a3 fallbacks:(id)a4 insertsBefore:(id)a5 insertsAfter:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)_UICommandItemInsertion;
  v13 = [(_UICommandChange *)&v21 initWithAnchor:a3];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    fallbacks = v13->_fallbacks;
    v13->_fallbacks = (NSArray *)v14;

    uint64_t v16 = [v11 copy];
    insertsBefore = v13->_insertsBefore;
    v13->_insertsBefore = (NSArray *)v16;

    uint64_t v18 = [v12 copy];
    insertsAfter = v13->_insertsAfter;
    v13->_insertsAfter = (NSArray *)v18;
  }
  return v13;
}

- (_UICommandItemInsertion)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_UICommandItemInsertion;
  v5 = [(_UICommandChange *)&v24 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"fallbacks"];
    fallbacks = v5->_fallbacks;
    v5->_fallbacks = (NSArray *)v9;

    id v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"insertsBefore"];
    insertsBefore = v5->_insertsBefore;
    v5->_insertsBefore = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v17, "setWithObjects:", v18, v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"insertsAfter"];
    insertsAfter = v5->_insertsAfter;
    v5->_insertsAfter = (NSArray *)v21;
  }
  return v5;
}

- (void)acceptItemInsertionVisit:(id)a3 itemDeletionVisit:(id)a4 menuInsertionVisit:(id)a5 menuDeletionVisit:(id)a6
{
  if (a3) {
    (*((void (**)(id, _UICommandItemInsertion *))a3 + 2))(a3, self);
  }
}

- (BOOL)acceptBoolItemInsertionVisit:(id)a3 itemDeletionVisit:(id)a4 menuInsertionVisit:(id)a5 menuDeletionVisit:(id)a6
{
  if (a3) {
    return (*((uint64_t (**)(id, _UICommandItemInsertion *))a3 + 2))(a3, self);
  }
  else {
    return 0;
  }
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UICommandItemInsertion;
  id v4 = a3;
  [(_UICommandChange *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_fallbacks, @"fallbacks", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_insertsBefore forKey:@"insertsBefore"];
  [v4 encodeObject:self->_insertsAfter forKey:@"insertsAfter"];
}

- (NSArray)fallbacks
{
  return self->_fallbacks;
}

- (NSArray)insertsBefore
{
  return self->_insertsBefore;
}

- (NSArray)insertsAfter
{
  return self->_insertsAfter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertsAfter, 0);
  objc_storeStrong((id *)&self->_insertsBefore, 0);
  objc_storeStrong((id *)&self->_fallbacks, 0);
}

@end