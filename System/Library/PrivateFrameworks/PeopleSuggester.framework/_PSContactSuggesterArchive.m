@interface _PSContactSuggesterArchive
+ (BOOL)supportsSecureCoding;
- (NSDate)archiveDate;
- (NSDictionary)contactPriorDictionary;
- (_PSContactSuggesterArchive)initWithArchiveDate:(id)a3 contactPriorDictionary:(id)a4;
- (_PSContactSuggesterArchive)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _PSContactSuggesterArchive

- (_PSContactSuggesterArchive)initWithArchiveDate:(id)a3 contactPriorDictionary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PSContactSuggesterArchive;
  v9 = [(_PSContactSuggesterArchive *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_archiveDate, a3);
    objc_storeStrong((id *)&v10->_contactPriorDictionary, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(_PSContactSuggesterArchive *)self archiveDate];
  v6 = [(_PSContactSuggesterArchive *)self contactPriorDictionary];
  id v7 = (void *)[v4 initWithArchiveDate:v5 contactPriorDictionary:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_PSContactSuggesterArchive *)self contactPriorDictionary];
  v6 = NSStringFromSelector(sel_contactPriorDictionary);
  [v4 encodeObject:v5 forKey:v6];

  id v8 = [(_PSContactSuggesterArchive *)self archiveDate];
  id v7 = NSStringFromSelector(sel_archiveDate);
  [v4 encodeObject:v8 forKey:v7];
}

- (_PSContactSuggesterArchive)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v4, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
  v11 = NSStringFromSelector(sel_contactPriorDictionary);
  objc_super v12 = [v5 decodeObjectOfClasses:v10 forKey:v11];

  v13 = NSStringFromSelector(sel_archiveDate);
  v14 = [v5 decodeObjectOfClasses:v10 forKey:v13];

  v15 = [(_PSContactSuggesterArchive *)self initWithArchiveDate:v14 contactPriorDictionary:v12];
  return v15;
}

- (NSDate)archiveDate
{
  return self->_archiveDate;
}

- (NSDictionary)contactPriorDictionary
{
  return self->_contactPriorDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactPriorDictionary, 0);

  objc_storeStrong((id *)&self->_archiveDate, 0);
}

@end