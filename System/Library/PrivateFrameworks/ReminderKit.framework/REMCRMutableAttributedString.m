@interface REMCRMutableAttributedString
+ (BOOL)supportsSecureCoding;
+ (NSArray)nonEditableAttributes;
+ (NSSet)allowedAttributesForModel;
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (NSMutableAttributedString)backingStore;
- (REMCRMutableAttributedString)initWithBackingStore:(id)a3;
- (REMCRMutableAttributedString)initWithCoder:(id)a3;
- (REMCRMutableAttributedStringEditObserver)editObserver;
- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)string;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4;
- (void)reportDidEdit:(int64_t)a3 range:(_NSRange)a4 changeInLength:(int64_t)a5;
- (void)setAttributes:(id)a3 range:(_NSRange)a4;
- (void)setBackingStore:(id)a3;
- (void)setEditObserver:(id)a3;
@end

@implementation REMCRMutableAttributedString

- (REMCRMutableAttributedString)initWithBackingStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMCRMutableAttributedString;
  v6 = [(REMCRMutableAttributedString *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_backingStore, a3);
  }

  return v7;
}

- (id)string
{
  v2 = [(REMCRMutableAttributedString *)self backingStore];
  v3 = [v2 string];

  return v3;
}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  v6 = [(REMCRMutableAttributedString *)self backingStore];
  v7 = [v6 attributesAtIndex:a3 effectiveRange:a4];

  return v7;
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v64 = [MEMORY[0x1E4F1CA80] set];
  v68.NSUInteger location = location;
  v68.NSUInteger length = length;
  if (length)
  {
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    obuint64_t j = [(id)objc_opt_class() nonEditableAttributes];
    uint64_t v67 = [obj countByEnumeratingWithState:&v85 objects:v97 count:16];
    if (!v67)
    {
LABEL_21:

      goto LABEL_22;
    }
    id v63 = v7;
    uint64_t v66 = *(void *)v86;
    do
    {
      for (uint64_t i = 0; i != v67; ++i)
      {
        if (*(void *)v86 != v66) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v85 + 1) + 8 * i);
        v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v63);
        v11 = [(REMCRMutableAttributedString *)self backingStore];
        v83[0] = MEMORY[0x1E4F143A8];
        v83[1] = 3221225472;
        v83[2] = __68__REMCRMutableAttributedString_replaceCharactersInRange_withString___block_invoke;
        v83[3] = &unk_1E61DD900;
        v83[4] = self;
        v83[5] = v9;
        id v12 = v10;
        id v84 = v12;
        objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v9, location, v68.length, 0, v83);

        long long v81 = 0u;
        long long v82 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        v69 = v12;
        v13 = [v12 reverseObjectEnumerator];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v79 objects:v96 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v80;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v80 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = [*(id *)(*((void *)&v79 + 1) + 8 * j) rangeValue];
              uint64_t v20 = v19;
              v21 = [(REMCRMutableAttributedString *)self backingStore];
              objc_msgSend(v21, "removeAttribute:range:", v9, v18, v20);

              -[REMCRMutableAttributedString reportDidEdit:range:changeInLength:](self, "reportDidEdit:range:changeInLength:", 1, v18, v20, 0);
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v79 objects:v96 count:16];
          }
          while (v15);
        }

        NSUInteger location = v68.location;
        if ([v69 count])
        {
          v22 = +[REMLog crdt];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            v23 = NSStringFromRange(v68);
            *(_DWORD *)buf = 134218754;
            *(void *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v9;
            __int16 v92 = 2112;
            v93 = v23;
            __int16 v94 = 2112;
            v95 = v69;
            _os_log_impl(&dword_1B9AA2000, v22, OS_LOG_TYPE_INFO, "REMCRMutableAttributedString: Deleting portion of text within a non-editable attribute range. Removing the attribute {self: %p, key: %@, replacementRange: %@, ranges: %@}", buf, 0x2Au);
          }
        }
      }
      uint64_t v67 = [obj countByEnumeratingWithState:&v85 objects:v97 count:16];
    }
    while (v67);
LABEL_20:
    id v7 = v63;
    goto LABEL_21;
  }
  if ([v7 length])
  {
    if (location)
    {
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      obuint64_t j = [(id)objc_opt_class() nonEditableAttributes];
      uint64_t v40 = [obj countByEnumeratingWithState:&v75 objects:v90 count:16];
      if (!v40) {
        goto LABEL_21;
      }
      uint64_t v41 = v40;
      id v63 = v7;
      uint64_t v42 = *(void *)v76;
      NSUInteger v43 = location - 1;
      v44 = v64;
      do
      {
        for (uint64_t k = 0; k != v41; ++k)
        {
          if (*(void *)v76 != v42) {
            objc_enumerationMutation(obj);
          }
          uint64_t v46 = *(void *)(*((void *)&v75 + 1) + 8 * k);
          v74.NSUInteger location = 0;
          v74.NSUInteger length = 0;
          v47 = [(REMCRMutableAttributedString *)self backingStore];
          v48 = [v47 attribute:v46 atIndex:v43 effectiveRange:&v74];

          if (v48)
          {
            if (location == v74.length + v74.location)
            {
              [v44 addObject:v46];
            }
            else
            {
              v49 = [(REMCRMutableAttributedString *)self backingStore];
              objc_msgSend(v49, "removeAttribute:range:", v46, v74.location, v74.length);

              -[REMCRMutableAttributedString reportDidEdit:range:changeInLength:](self, "reportDidEdit:range:changeInLength:", 1, v74.location, v74.length, 0);
              v50 = +[REMLog crdt];
              if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
              {
                v100.NSUInteger location = location;
                v100.NSUInteger length = 0;
                v51 = NSStringFromRange(v100);
                v52 = NSStringFromRange(v74);
                *(_DWORD *)buf = 134218754;
                *(void *)&buf[4] = self;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v46;
                __int16 v92 = 2112;
                v93 = v51;
                __int16 v94 = 2112;
                v95 = v52;
                _os_log_impl(&dword_1B9AA2000, v50, OS_LOG_TYPE_INFO, "REMCRMutableAttributedString: Inserting text within a non-editable attribute range. Removing the attribute {self: %p, key: %@, replacementRange: %@, attrRange: %@}", buf, 0x2Au);

                NSUInteger location = v68.location;
                v44 = v64;
              }
            }
          }
        }
        uint64_t v41 = [obj countByEnumeratingWithState:&v75 objects:v90 count:16];
      }
      while (v41);
      goto LABEL_20;
    }
    v53 = [(REMCRMutableAttributedString *)self backingStore];
    uint64_t v54 = [v53 length];

    if (v54)
    {
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      obuint64_t j = [(id)objc_opt_class() nonEditableAttributes];
      uint64_t v55 = [obj countByEnumeratingWithState:&v70 objects:v89 count:16];
      if (v55)
      {
        uint64_t v56 = v55;
        id v57 = v7;
        uint64_t v58 = *(void *)v71;
        do
        {
          for (uint64_t m = 0; m != v56; ++m)
          {
            if (*(void *)v71 != v58) {
              objc_enumerationMutation(obj);
            }
            uint64_t v60 = *(void *)(*((void *)&v70 + 1) + 8 * m);
            *(void *)&buf[8] = 0;
            *(void *)buf = 0;
            v61 = [(REMCRMutableAttributedString *)self backingStore];
            v62 = [v61 attribute:v60 atIndex:0 effectiveRange:buf];

            if (v62) {
              [v64 addObject:v60];
            }
          }
          uint64_t v56 = [obj countByEnumeratingWithState:&v70 objects:v89 count:16];
        }
        while (v56);
        id v7 = v57;
        NSUInteger location = v68.location;
      }
      goto LABEL_21;
    }
  }
LABEL_22:
  v24 = [(REMCRMutableAttributedString *)self backingStore];
  uint64_t v25 = [v24 length];

  v26 = [(REMCRMutableAttributedString *)self backingStore];
  objc_msgSend(v26, "replaceCharactersInRange:withString:", location, v68.length, v7);

  v27 = [(REMCRMutableAttributedString *)self backingStore];
  -[REMCRMutableAttributedString reportDidEdit:range:changeInLength:](self, "reportDidEdit:range:changeInLength:", 2, location, v68.length, [v27 length] - v25);

  NSUInteger v28 = location;
  v29 = v64;
  if ([v64 count])
  {
    v30 = [(REMCRMutableAttributedString *)self backingStore];
    v31 = [v30 attributesAtIndex:v28 effectiveRange:0];

    v32 = (void *)[v31 mutableCopy];
    v33 = [v64 allObjects];
    [v32 removeObjectsForKeys:v33];

    id v34 = v7;
    NSUInteger v35 = [v7 length];
    v36 = [(REMCRMutableAttributedString *)self backingStore];
    v37 = (void *)[v32 copy];
    objc_msgSend(v36, "setAttributes:range:", v37, v28, v35);

    -[REMCRMutableAttributedString reportDidEdit:range:changeInLength:](self, "reportDidEdit:range:changeInLength:", 1, v28, v35, 0);
    v38 = +[REMLog crdt];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      v99.NSUInteger location = v28;
      v99.NSUInteger length = v35;
      v39 = NSStringFromRange(v99);
      *(_DWORD *)buf = 134218498;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v64;
      __int16 v92 = 2112;
      v93 = v39;
      _os_log_impl(&dword_1B9AA2000, v38, OS_LOG_TYPE_INFO, "REMCRMutableAttributedString: Non-editable attributes were extended around the insertion point, now unapply the extension to the attributes {self: %p, keys: %@, range: %@}", buf, 0x20u);
    }
    id v7 = v34;
    v29 = v64;
  }
}

void __68__REMCRMutableAttributedString_replaceCharactersInRange_withString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    id v5 = [*(id *)(a1 + 32) backingStore];
    id v6 = (id)[v5 attribute:*(void *)(a1 + 40) atIndex:a3 effectiveRange:&v9];

    id v7 = *(void **)(a1 + 48);
    v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v9, v10);
    [v7 addObject:v8];
  }
}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  v8 = [(REMCRMutableAttributedString *)self backingStore];
  objc_msgSend(v8, "setAttributes:range:", v7, location, length);

  -[REMCRMutableAttributedString reportDidEdit:range:changeInLength:](self, "reportDidEdit:range:changeInLength:", 1, location, length, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [(REMCRMutableAttributedString *)self backingStore];
  id v5 = (void *)[v4 mutableCopyWithZone:a3];

  id v6 = [+[REMCRMutableAttributedString allocWithZone:a3] initWithBackingStore:v5];
  return v6;
}

- (Class)classForCoder
{
  return (Class)self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMCRMutableAttributedString *)self backingStore];
  [v4 encodeObject:v5 forKey:@"backingStore"];
}

- (REMCRMutableAttributedString)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backingStore"];

  id v6 = [(REMCRMutableAttributedString *)self initWithBackingStore:v5];
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  v2 = [(REMCRMutableAttributedString *)self backingStore];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REMCRMutableAttributedString *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(REMCRMutableAttributedString *)self backingStore];
      uint64_t v8 = [(REMCRMutableAttributedString *)v6 backingStore];
      if (v7 == (void *)v8)
      {
        char v12 = 1;
        uint64_t v9 = v7;
      }
      else
      {
        uint64_t v9 = (void *)v8;
        uint64_t v10 = [(REMCRMutableAttributedString *)self backingStore];
        v11 = [(REMCRMutableAttributedString *)v6 backingStore];
        char v12 = [v10 isEqual:v11];
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(REMCRMutableAttributedString *)self backingStore];
  id v6 = [v3 stringWithFormat:@"<%@: %p backingStore: %@>", v4, self, v5];

  return v6;
}

+ (NSArray)nonEditableAttributes
{
  if (nonEditableAttributes_onceToken != -1) {
    dispatch_once(&nonEditableAttributes_onceToken, &__block_literal_global_22);
  }
  v2 = (void *)nonEditableAttributes_nonEditableList;

  return (NSArray *)v2;
}

void __53__REMCRMutableAttributedString_nonEditableAttributes__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v0 = +[REMTTHashtag attributeName];
  v3[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  v2 = (void *)nonEditableAttributes_nonEditableList;
  nonEditableAttributes_nonEditableList = v1;
}

+ (NSSet)allowedAttributesForModel
{
  return (NSSet *)+[TTMergeableAttributedString allowlistedAttributesForModel];
}

- (void)reportDidEdit:(int64_t)a3 range:(_NSRange)a4 changeInLength:(int64_t)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v10 = [(REMCRMutableAttributedString *)self editObserver];
  objc_msgSend(v10, "mutableAttributedString:didEdit:range:changeInLength:", self, a3, location, length, a5);
}

- (REMCRMutableAttributedStringEditObserver)editObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editObserver);

  return (REMCRMutableAttributedStringEditObserver *)WeakRetained;
}

- (void)setEditObserver:(id)a3
{
}

- (NSMutableAttributedString)backingStore
{
  return self->_backingStore;
}

- (void)setBackingStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingStore, 0);

  objc_destroyWeak((id *)&self->_editObserver);
}

@end