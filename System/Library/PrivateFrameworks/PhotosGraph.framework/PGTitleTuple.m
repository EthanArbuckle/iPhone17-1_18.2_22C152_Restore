@interface PGTitleTuple
- (BOOL)isEqual:(id)a3;
- (NSArray)locationNames;
- (PGTitle)subtitle;
- (PGTitle)title;
- (PGTitleTuple)initWithWithTitle:(id)a3 subtitle:(id)a4;
- (PGTitleTuple)initWithWithTitle:(id)a3 subtitle:(id)a4 locationNames:(id)a5;
- (id)description;
@end

@implementation PGTitleTuple

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationNames, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (NSArray)locationNames
{
  return self->_locationNames;
}

- (PGTitle)subtitle
{
  return self->_subtitle;
}

- (PGTitle)title
{
  return self->_title;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PGTitle *)self->_title description];
  v7 = [(PGTitle *)self->_subtitle description];
  v8 = [v3 stringWithFormat:@"<%@: %p> title: %@, subtitle: %@", v5, self, v6, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PGTitleTuple *)a3;
  if (self == v4)
  {
    char v6 = 1;
    goto LABEL_17;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_3;
  }
  title = self->_title;
  uint64_t v8 = [(PGTitleTuple *)v4 title];
  if (title == (PGTitle *)v8)
  {
  }
  else
  {
    v9 = (void *)v8;
    v10 = self->_title;
    v11 = [(PGTitleTuple *)v4 title];
    LODWORD(v10) = [(PGTitle *)v10 isEqual:v11];

    if (!v10) {
      goto LABEL_3;
    }
  }
  subtitle = self->_subtitle;
  uint64_t v13 = [(PGTitleTuple *)v4 subtitle];
  if (subtitle != (PGTitle *)v13)
  {
    v14 = (void *)v13;
    v15 = self->_subtitle;
    v16 = [(PGTitleTuple *)v4 subtitle];
    LODWORD(v15) = [(PGTitle *)v15 isEqual:v16];

    if (v15) {
      goto LABEL_13;
    }
LABEL_3:
    char v6 = 0;
    goto LABEL_17;
  }

LABEL_13:
  locationNames = self->_locationNames;
  v18 = [(PGTitleTuple *)v4 locationNames];
  if (locationNames == v18)
  {
    char v6 = 1;
  }
  else
  {
    v19 = self->_locationNames;
    v20 = [(PGTitleTuple *)v4 locationNames];
    char v6 = [(NSArray *)v19 isEqual:v20];
  }
LABEL_17:

  return v6;
}

- (PGTitleTuple)initWithWithTitle:(id)a3 subtitle:(id)a4
{
  return [(PGTitleTuple *)self initWithWithTitle:a3 subtitle:a4 locationNames:0];
}

- (PGTitleTuple)initWithWithTitle:(id)a3 subtitle:(id)a4 locationNames:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGTitleTuple;
  v12 = [(PGTitleTuple *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v13->_subtitle, a4);
    objc_storeStrong((id *)&v13->_locationNames, a5);
  }

  return v13;
}

@end