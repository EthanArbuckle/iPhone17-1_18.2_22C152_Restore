@interface MOPerson
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMePerson;
- (BOOL)isPHPersonTypeImportant;
- (BOOL)mePersonIdentified;
- (MOPerson)initWithCoder:(id)a3;
- (MOPerson)initWithLocalIdentifier:(id)a3 name:(id)a4 contactIdentifier:(id)a5 family:(id)a6;
- (MOPerson)initWithLocalIdentifier:(id)a3 name:(id)a4 contactIdentifier:(id)a5 family:(id)a6 isPHPersonTypeImportant:(BOOL)a7 isMePerson:(BOOL)a8 mePersonIdentified:(BOOL)a9 personRelationships:(id)a10 priorityScore:(double)a11 significanceScore:(double)a12;
- (MOPerson)initWithLocalIdentifier:(id)a3 name:(id)a4 contactIdentifier:(id)a5 family:(id)a6 priorityScore:(double)a7;
- (MOPerson)initWithLocalIdentifier:(id)a3 name:(id)a4 contactIdentifier:(id)a5 family:(id)a6 priorityScore:(double)a7 significanceScore:(double)a8;
- (MOPerson)initWithPersonDictionary:(id)a3;
- (NSArray)personRelationships;
- (NSString)contactIdentifier;
- (NSString)family;
- (NSString)localIdentifier;
- (NSString)name;
- (NSUUID)sourceEventIdentifier;
- (double)priorityScore;
- (double)significanceScore;
- (id)description;
- (int64_t)comparePersons:(id)a3;
- (int64_t)sourceEventAccessType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setFamily:(id)a3;
- (void)setIsMePerson:(BOOL)a3;
- (void)setIsPHPersonTypeImportant:(BOOL)a3;
- (void)setLocalIdentifier:(id)a3;
- (void)setMePersonIdentified:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPersonRelationships:(id)a3;
- (void)setSourceEventAccessType:(int64_t)a3;
- (void)setSourceEventIdentifier:(id)a3;
@end

@implementation MOPerson

- (MOPerson)initWithLocalIdentifier:(id)a3 name:(id)a4 contactIdentifier:(id)a5 family:(id)a6
{
  return [(MOPerson *)self initWithLocalIdentifier:a3 name:a4 contactIdentifier:a5 family:a6 priorityScore:0.0 significanceScore:-1.0];
}

- (MOPerson)initWithLocalIdentifier:(id)a3 name:(id)a4 contactIdentifier:(id)a5 family:(id)a6 priorityScore:(double)a7
{
  return [(MOPerson *)self initWithLocalIdentifier:a3 name:a4 contactIdentifier:a5 family:a6 priorityScore:a7 significanceScore:-1.0];
}

- (MOPerson)initWithLocalIdentifier:(id)a3 name:(id)a4 contactIdentifier:(id)a5 family:(id)a6 priorityScore:(double)a7 significanceScore:(double)a8
{
  LOBYTE(v9) = 0;
  return [(MOPerson *)self initWithLocalIdentifier:a3 name:a4 contactIdentifier:a5 family:a6 isPHPersonTypeImportant:0 isMePerson:0 mePersonIdentified:a7 personRelationships:a8 priorityScore:v9 significanceScore:0];
}

- (MOPerson)initWithLocalIdentifier:(id)a3 name:(id)a4 contactIdentifier:(id)a5 family:(id)a6 isPHPersonTypeImportant:(BOOL)a7 isMePerson:(BOOL)a8 mePersonIdentified:(BOOL)a9 personRelationships:(id)a10 priorityScore:(double)a11 significanceScore:(double)a12
{
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  id v23 = a6;
  id v24 = a10;
  v37.receiver = self;
  v37.super_class = (Class)MOPerson;
  v25 = [(MOPerson *)&v37 init];
  if (v25)
  {
    v26 = (NSString *)[v20 copy];
    localIdentifier = v25->_localIdentifier;
    v25->_localIdentifier = v26;

    v28 = (NSString *)[v21 copy];
    name = v25->_name;
    v25->_name = v28;

    v30 = (NSString *)[v22 copy];
    contactIdentifier = v25->_contactIdentifier;
    v25->_contactIdentifier = v30;

    v32 = (NSString *)[v23 copy];
    family = v25->_family;
    v25->_family = v32;

    v25->_isPHPersonTypeImportant = a7;
    v25->_isMePerson = a8;
    v25->_mePersonIdentified = a9;
    v34 = (NSArray *)[v24 copy];
    personRelationships = v25->_personRelationships;
    v25->_personRelationships = v34;

    v25->_priorityScore = a11;
    v25->_significanceScore = a12;
  }

  return v25;
}

- (MOPerson)initWithPersonDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"localIdentifier"];
  v6 = [v4 objectForKey:@"name"];
  v7 = [v4 objectForKey:@"contactIdentifier"];
  v8 = [v4 objectForKey:@"family"];
  uint64_t v9 = [v4 objectForKey:@"priorityScore"];
  [v9 doubleValue];
  double v11 = v10;

  v12 = [v4 objectForKey:@"significanceScore"];
  [v12 doubleValue];
  double v14 = v13;

  v15 = [v4 objectForKey:@"isPHPersonTypeImportant"];
  id v16 = [v15 BOOLValue];

  v17 = [v4 objectForKey:@"isMePerson"];
  id v18 = [v17 BOOLValue];

  v19 = [v4 objectForKey:@"mePersonIdentified"];

  LOBYTE(v4) = [v19 BOOLValue];
  LOBYTE(v22) = (_BYTE)v4;
  id v20 = [(MOPerson *)self initWithLocalIdentifier:v5 name:v6 contactIdentifier:v7 family:v8 isPHPersonTypeImportant:v16 isMePerson:v18 mePersonIdentified:v11 personRelationships:v14 priorityScore:v22 significanceScore:0];

  return v20;
}

- (id)description
{
  v3 = [(MOPerson *)self localIdentifier];
  id v4 = [(MOPerson *)self name];
  v5 = [v4 mask];
  v6 = [(MOPerson *)self contactIdentifier];
  unsigned int v7 = [(MOPerson *)self isPHPersonTypeImportant];
  unsigned int v8 = [(MOPerson *)self isMePerson];
  unsigned int v9 = [(MOPerson *)self mePersonIdentified];
  double v10 = [(MOPerson *)self personRelationships];
  double v11 = [(MOPerson *)self family];
  [(MOPerson *)self significanceScore];
  uint64_t v13 = v12;
  [(MOPerson *)self priorityScore];
  v15 = +[NSString stringWithFormat:@"<MOPerson localIdentifier, %@, name, %@, contactIdentifier, %@, isPHPersonTypeImportant, %d, isMePerson, %d, mePersonIdentified, %d, peopleClassification, %@, family, %@, significanceScore, %.1f, priorityScore, %.1f>", v3, v5, v6, v7, v8, v9, v10, v11, v13, v14];

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  localIdentifier = self->_localIdentifier;
  id v5 = a3;
  [v5 encodeObject:localIdentifier forKey:@"localIdentifier"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeObject:self->_contactIdentifier forKey:@"contactIdentifier"];
  [v5 encodeObject:self->_family forKey:@"family"];
  [v5 encodeBool:self->_isPHPersonTypeImportant forKey:@"isPHPersonTypeImportant"];
  [v5 encodeBool:self->_isMePerson forKey:@"isMePerson"];
  [v5 encodeBool:self->_mePersonIdentified forKey:@"mePersonIdentified"];
  [v5 encodeObject:self->_personRelationships forKey:@"personRelationships"];
  [v5 encodeDouble:@"priorityScore" forKey:self->_priorityScore];
  [v5 encodeDouble:@"significanceScore" forKey:self->_significanceScore];
  [v5 encodeInt64:self->_sourceEventAccessType forKey:@"sourceEventAccessType"];
  [v5 encodeObject:self->_sourceEventIdentifier forKey:@"sourceEventIdentifier"];
}

- (MOPerson)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"localIdentifier"];
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"contactIdentifier"];
  unsigned int v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"family"];
  id v8 = [v3 decodeBoolForKey:@"isPHPersonTypeImportant"];
  id v9 = [v3 decodeBoolForKey:@"isMePerson"];
  unsigned __int8 v10 = [v3 decodeBoolForKey:@"mePersonIdentified"];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, objc_opt_class(), 0);
  uint64_t v13 = [v3 decodeObjectOfClasses:v12 forKey:@"personRelationships"];

  [v3 decodeDoubleForKey:@"priorityScore"];
  double v15 = v14;
  [v3 decodeDoubleForKey:@"significanceScore"];
  LOBYTE(v20) = v10;
  v17 = [(MOPerson *)self initWithLocalIdentifier:v4 name:v5 contactIdentifier:v6 family:v7 isPHPersonTypeImportant:v8 isMePerson:v9 mePersonIdentified:v15 personRelationships:v16 priorityScore:v20 significanceScore:v13];
  if (v17)
  {
    id v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"sourceEventIdentifier"];
    [(MOPerson *)v17 setSourceEventIdentifier:v18];

    -[MOPerson setSourceEventAccessType:](v17, "setSourceEventAccessType:", [v3 decodeInt64ForKey:@"sourceEventAccessType"]);
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MOPerson *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    v6 = v4;
    unsigned int v7 = [(MOPerson *)self localIdentifier];
    if (v7)
    {
      id v8 = [(MOPerson *)v6 localIdentifier];
      LODWORD(v9) = v8 != 0;
    }
    else
    {
      LODWORD(v9) = 0;
    }

    uint64_t v11 = [(MOPerson *)self contactIdentifier];
    if (v11)
    {
      uint64_t v12 = [(MOPerson *)v6 contactIdentifier];
      BOOL v13 = v12 != 0;
    }
    else
    {
      BOOL v13 = 0;
    }

    if (v9)
    {
      double v14 = [(MOPerson *)self localIdentifier];
      double v15 = [(MOPerson *)v6 localIdentifier];
      unsigned int v16 = [v14 isEqualToString:v15];
    }
    else
    {
      unsigned int v16 = 0;
    }
    v17 = [(MOPerson *)self name];
    if (v17)
    {
      id v18 = [(MOPerson *)v6 name];
      if (v18)
      {
        [(MOPerson *)self name];
        uint64_t v9 = v27 = v9;
        [(MOPerson *)v6 name];
        unsigned int v19 = v16;
        v21 = BOOL v20 = v13;
        unsigned __int8 v22 = [(id)v9 isEqualToString:v21];

        BOOL v13 = v20;
        unsigned int v16 = v19;

        LOBYTE(v9) = v27;
      }
      else
      {
        unsigned __int8 v22 = 0;
      }
    }
    else
    {
      unsigned __int8 v22 = 0;
    }

    if (v13)
    {
      id v23 = [(MOPerson *)self contactIdentifier];
      id v24 = [(MOPerson *)v6 contactIdentifier];
      unsigned int v25 = [v23 isEqualToString:v24];
    }
    else
    {
      unsigned int v25 = 0;
    }
    if ((v16 | v25)) {
      char v10 = 1;
    }
    else {
      char v10 = v22 & ~(v9 | v13);
    }
  }
  return v10;
}

- (unint64_t)hash
{
  id v3 = [(MOPerson *)self localIdentifier];
  if (v3)
  {
    id v4 = [(MOPerson *)self localIdentifier];
    unint64_t v5 = (unint64_t)[v4 hash];
  }
  else
  {
    unint64_t v5 = 0;
  }

  v6 = [(MOPerson *)self name];
  if (v6)
  {
    unsigned int v7 = [(MOPerson *)self name];
    unint64_t v8 = (unint64_t)[v7 hash];
  }
  else
  {
    unint64_t v8 = 0;
  }

  uint64_t v9 = [(MOPerson *)self contactIdentifier];
  if (v9)
  {
    char v10 = [(MOPerson *)self contactIdentifier];
    unint64_t v11 = (unint64_t)[v10 hash];
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v8 ^ v5 ^ v11;
}

- (int64_t)comparePersons:(id)a3
{
  id v4 = a3;
  if ([(MOPerson *)self isMePerson])
  {
LABEL_5:
    int64_t v5 = -1;
    goto LABEL_6;
  }
  if (([v4 isMePerson] & 1) == 0)
  {
    if (![(MOPerson *)self isPHPersonTypeImportant])
    {
      int64_t v5 = [v4 isPHPersonTypeImportant];
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  int64_t v5 = 1;
LABEL_6:

  return v5;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (void)setLocalIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
}

- (NSString)family
{
  return self->_family;
}

- (void)setFamily:(id)a3
{
}

- (BOOL)isPHPersonTypeImportant
{
  return self->_isPHPersonTypeImportant;
}

- (void)setIsPHPersonTypeImportant:(BOOL)a3
{
  self->_isPHPersonTypeImportant = a3;
}

- (BOOL)isMePerson
{
  return self->_isMePerson;
}

- (void)setIsMePerson:(BOOL)a3
{
  self->_isMePerson = a3;
}

- (BOOL)mePersonIdentified
{
  return self->_mePersonIdentified;
}

- (void)setMePersonIdentified:(BOOL)a3
{
  self->_mePersonIdentified = a3;
}

- (NSArray)personRelationships
{
  return self->_personRelationships;
}

- (void)setPersonRelationships:(id)a3
{
}

- (double)priorityScore
{
  return self->_priorityScore;
}

- (double)significanceScore
{
  return self->_significanceScore;
}

- (int64_t)sourceEventAccessType
{
  return self->_sourceEventAccessType;
}

- (void)setSourceEventAccessType:(int64_t)a3
{
  self->_sourceEventAccessType = a3;
}

- (NSUUID)sourceEventIdentifier
{
  return self->_sourceEventIdentifier;
}

- (void)setSourceEventIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceEventIdentifier, 0);
  objc_storeStrong((id *)&self->_personRelationships, 0);
  objc_storeStrong((id *)&self->_family, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
}

@end