@interface _PSClustersArchive
+ (BOOL)supportsSecureCoding;
- (NSDate)archiveDate;
- (NSDictionary)clustersDictionary;
- (_PSClustersArchive)initWithClustersDictionary:(id)a3 archiveDate:(id)a4;
- (_PSClustersArchive)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _PSClustersArchive

- (_PSClustersArchive)initWithClustersDictionary:(id)a3 archiveDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PSClustersArchive;
  v9 = [(_PSClustersArchive *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clustersDictionary, a3);
    objc_storeStrong((id *)&v10->_archiveDate, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(_PSClustersArchive *)self clustersDictionary];
  v6 = [(_PSClustersArchive *)self archiveDate];
  id v7 = (void *)[v4 initWithClustersDictionary:v5 archiveDate:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_PSClustersArchive *)self clustersDictionary];
  v6 = NSStringFromSelector(sel_clustersDictionary);
  [v4 encodeObject:v5 forKey:v6];

  id v8 = [(_PSClustersArchive *)self archiveDate];
  id v7 = NSStringFromSelector(sel_archiveDate);
  [v4 encodeObject:v8 forKey:v7];
}

- (_PSClustersArchive)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  objc_super v12 = objc_msgSend(v4, "setWithObjects:", v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v13 = NSStringFromSelector(sel_clustersDictionary);
  v14 = [v5 decodeObjectOfClasses:v12 forKey:v13];

  v15 = NSStringFromSelector(sel_archiveDate);
  v16 = [v5 decodeObjectOfClasses:v12 forKey:v15];

  v17 = [(_PSClustersArchive *)self initWithClustersDictionary:v14 archiveDate:v16];
  return v17;
}

- (NSDate)archiveDate
{
  return self->_archiveDate;
}

- (NSDictionary)clustersDictionary
{
  return self->_clustersDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clustersDictionary, 0);

  objc_storeStrong((id *)&self->_archiveDate, 0);
}

@end