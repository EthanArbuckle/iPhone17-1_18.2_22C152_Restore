@interface _UICommandMenuInsertion
+ (BOOL)supportsSecureCoding;
+ (id)insertionWithAnchor:(id)a3 fallbacks:(id)a4 insertsAtStart:(id)a5 insertsAtEnd:(id)a6 insertsBefore:(id)a7 insertsAfter:(id)a8;
- (BOOL)acceptBoolItemInsertionVisit:(id)a3 itemDeletionVisit:(id)a4 menuInsertionVisit:(id)a5 menuDeletionVisit:(id)a6;
- (NSArray)fallbacks;
- (NSArray)insertsAfter;
- (NSArray)insertsAtEnd;
- (NSArray)insertsAtStart;
- (NSArray)insertsBefore;
- (_UICommandMenuInsertion)initWithAnchor:(id)a3 fallbacks:(id)a4 insertsAtStart:(id)a5 insertsAtEnd:(id)a6 insertsBefore:(id)a7 insertsAfter:(id)a8;
- (_UICommandMenuInsertion)initWithCoder:(id)a3;
- (void)acceptItemInsertionVisit:(id)a3 itemDeletionVisit:(id)a4 menuInsertionVisit:(id)a5 menuDeletionVisit:(id)a6;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UICommandMenuInsertion

+ (id)insertionWithAnchor:(id)a3 fallbacks:(id)a4 insertsAtStart:(id)a5 insertsAtEnd:(id)a6 insertsBefore:(id)a7 insertsAfter:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = [[_UICommandMenuInsertion alloc] initWithAnchor:v18 fallbacks:v17 insertsAtStart:v16 insertsAtEnd:v15 insertsBefore:v14 insertsAfter:v13];

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UICommandMenuInsertion)initWithAnchor:(id)a3 fallbacks:(id)a4 insertsAtStart:(id)a5 insertsAtEnd:(id)a6 insertsBefore:(id)a7 insertsAfter:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v31.receiver = self;
  v31.super_class = (Class)_UICommandMenuInsertion;
  v19 = [(_UICommandChange *)&v31 initWithAnchor:a3];
  if (v19)
  {
    uint64_t v20 = [v14 copy];
    fallbacks = v19->_fallbacks;
    v19->_fallbacks = (NSArray *)v20;

    uint64_t v22 = [v15 copy];
    insertsAtStart = v19->_insertsAtStart;
    v19->_insertsAtStart = (NSArray *)v22;

    uint64_t v24 = [v16 copy];
    insertsAtEnd = v19->_insertsAtEnd;
    v19->_insertsAtEnd = (NSArray *)v24;

    uint64_t v26 = [v17 copy];
    insertsBefore = v19->_insertsBefore;
    v19->_insertsBefore = (NSArray *)v26;

    uint64_t v28 = [v18 copy];
    insertsAfter = v19->_insertsAfter;
    v19->_insertsAfter = (NSArray *)v28;
  }
  return v19;
}

- (_UICommandMenuInsertion)initWithCoder:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)_UICommandMenuInsertion;
  v5 = [(_UICommandChange *)&v36 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"fallbacks"];
    fallbacks = v5->_fallbacks;
    v5->_fallbacks = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    id v14 = objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"insertsAtStart"];
    insertsAtStart = v5->_insertsAtStart;
    v5->_insertsAtStart = (NSArray *)v15;

    id v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_msgSend(v17, "setWithObjects:", v18, v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"insertsAtEnd"];
    insertsAtEnd = v5->_insertsAtEnd;
    v5->_insertsAtEnd = (NSArray *)v21;

    v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_msgSend(v23, "setWithObjects:", v24, v25, objc_opt_class(), 0);
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"insertsBefore"];
    insertsBefore = v5->_insertsBefore;
    v5->_insertsBefore = (NSArray *)v27;

    v29 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v30 = objc_opt_class();
    uint64_t v31 = objc_opt_class();
    v32 = objc_msgSend(v29, "setWithObjects:", v30, v31, objc_opt_class(), 0);
    uint64_t v33 = [v4 decodeObjectOfClasses:v32 forKey:@"insertsAfter"];
    insertsAfter = v5->_insertsAfter;
    v5->_insertsAfter = (NSArray *)v33;
  }
  return v5;
}

- (void)acceptItemInsertionVisit:(id)a3 itemDeletionVisit:(id)a4 menuInsertionVisit:(id)a5 menuDeletionVisit:(id)a6
{
  if (a5) {
    (*((void (**)(id, _UICommandMenuInsertion *))a5 + 2))(a5, self);
  }
}

- (BOOL)acceptBoolItemInsertionVisit:(id)a3 itemDeletionVisit:(id)a4 menuInsertionVisit:(id)a5 menuDeletionVisit:(id)a6
{
  if (a5) {
    return (*((uint64_t (**)(id, _UICommandMenuInsertion *))a5 + 2))(a5, self);
  }
  else {
    return 0;
  }
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UICommandMenuInsertion;
  id v4 = a3;
  [(_UICommandChange *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_fallbacks, @"fallbacks", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_insertsAtStart forKey:@"insertsAtStart"];
  [v4 encodeObject:self->_insertsAtEnd forKey:@"insertsAtEnd"];
  [v4 encodeObject:self->_insertsBefore forKey:@"insertsBefore"];
  [v4 encodeObject:self->_insertsAfter forKey:@"insertsAfter"];
}

- (NSArray)fallbacks
{
  return self->_fallbacks;
}

- (NSArray)insertsAtStart
{
  return self->_insertsAtStart;
}

- (NSArray)insertsAtEnd
{
  return self->_insertsAtEnd;
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
  objc_storeStrong((id *)&self->_insertsAtEnd, 0);
  objc_storeStrong((id *)&self->_insertsAtStart, 0);
  objc_storeStrong((id *)&self->_fallbacks, 0);
}

@end