@interface PKSeat
+ (id)createFromDictionary:(id)a3;
- (BOOL)containsAttributes:(unint64_t)a3;
- (BOOL)intersectsAttributes:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSeat:(id)a3;
- (NSString)aisle;
- (NSString)designation;
- (NSString)identifier;
- (NSString)level;
- (NSString)row;
- (NSString)seatDescription;
- (NSString)section;
- (NSString)type;
- (PKColor)sectionColor;
- (PKSeat)init;
- (id)_initFromDictionary:(id)a3;
- (unint64_t)diffFromSeat:(id)a3;
@end

@implementation PKSeat

+ (id)createFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [[PKSeat alloc] _initFromDictionary:v3];

  return v4;
}

- (PKSeat)init
{
  return 0;
}

- (id)_initFromDictionary:(id)a3
{
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)PKSeat;
  v5 = [(PKSeat *)&v48 init];
  if (!v5) {
    goto LABEL_30;
  }
  v6 = [v4 PKStringForKey:@"seatNumber"];
  id v7 = v6;
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 length];

    if (v9)
    {
      objc_storeStrong((id *)&v5->_designation, v6);
      v5->_attributes |= 1uLL;
    }
  }
  v46 = v8;
  v10 = [v4 PKStringForKey:@"seatRow"];
  id v11 = v10;
  v12 = v11;
  if (v11)
  {
    uint64_t v13 = [v11 length];

    if (v13)
    {
      objc_storeStrong((id *)&v5->_row, v10);
      v5->_attributes |= 2uLL;
    }
  }
  v14 = objc_msgSend(v4, "PKStringForKey:", @"seatSection", v12);
  id v15 = v14;
  v16 = v15;
  if (v15)
  {
    uint64_t v17 = [v15 length];

    if (v17)
    {
      objc_storeStrong((id *)&v5->_section, v14);
      v5->_attributes |= 4uLL;
    }
  }
  v18 = [v4 PKStringForKey:@"seatAisle"];
  id v19 = v18;
  v20 = v19;
  if (v19)
  {
    uint64_t v21 = [v19 length];

    if (v21)
    {
      objc_storeStrong((id *)&v5->_aisle, v18);
      v5->_attributes |= 8uLL;
    }
  }
  v22 = [v4 PKStringForKey:@"seatLevel"];
  id v23 = v22;
  v24 = v23;
  if (v23)
  {
    uint64_t v25 = [v23 length];

    if (v25)
    {
      objc_storeStrong((id *)&v5->_level, v22);
      v5->_attributes |= 0x10uLL;
    }
  }
  v26 = [v4 PKStringForKey:@"seatType"];
  id v27 = v26;
  v28 = v27;
  if (v27)
  {
    uint64_t v29 = [v27 length];

    if (v29)
    {
      objc_storeStrong((id *)&v5->_type, v26);
      v5->_attributes |= 0x20uLL;
    }
  }
  v30 = [v4 PKStringForKey:@"seatDescription"];
  id v31 = v30;
  v32 = v31;
  if (v31)
  {
    uint64_t v33 = [v31 length];

    if (v33)
    {
      objc_storeStrong((id *)&v5->_seatDescription, v30);
      v5->_attributes |= 0x80uLL;
    }
  }
  v34 = [v4 PKStringForKey:@"seatIdentifier"];
  id v35 = v34;
  v36 = v35;
  if (v35)
  {
    uint64_t v37 = [v35 length];

    if (v37)
    {
      objc_storeStrong((id *)&v5->_identifier, v34);
      v5->_attributes |= 0x100uLL;
    }
  }
  v38 = [v4 PKStringForKey:@"seatSectionColor"];
  if (!v38)
  {
    unint64_t attributes = v5->_attributes;

    if (attributes) {
      goto LABEL_30;
    }
LABEL_34:
    v42 = 0;
    goto LABEL_35;
  }
  uint64_t v39 = +[PKColor colorFromString:v38];
  if (!v39)
  {
    v43 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v43, OS_LOG_TYPE_DEFAULT, "[PKSeatingInformation] Unable to parse sectionColor, ignoring", buf, 2u);
    }

    goto LABEL_34;
  }
  sectionColor = v5->_sectionColor;
  v5->_sectionColor = (PKColor *)v39;

  v5->_attributes |= 0x40uLL;
LABEL_30:
  v42 = v5;
LABEL_35:

  return v42;
}

- (BOOL)containsAttributes:(unint64_t)a3
{
  return (a3 & ~self->_attributes) == 0;
}

- (BOOL)intersectsAttributes:(unint64_t)a3
{
  return (self->_attributes & a3) != 0 || a3 == 0;
}

- (unint64_t)diffFromSeat:(id)a3
{
  if (!a3) {
    return 511;
  }
  designation = self->_designation;
  v5 = (NSString *)*((void *)a3 + 2);
  v6 = a3;
  if (designation) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    int v9 = designation == v5;
  }
  else {
    int v9 = [(NSString *)designation isEqual:v5];
  }
  unint64_t v10 = v9 ^ 1u;
  row = self->_row;
  v12 = (NSString *)v6[3];
  if (row && v12) {
    int v13 = -[NSString isEqual:](row, "isEqual:");
  }
  else {
    int v13 = row == v12;
  }
  if (!v13) {
    v10 |= 2uLL;
  }
  section = self->_section;
  id v15 = (NSString *)v6[4];
  if (section && v15) {
    int v16 = -[NSString isEqual:](section, "isEqual:");
  }
  else {
    int v16 = section == v15;
  }
  if (!v16) {
    v10 |= 4uLL;
  }
  aisle = self->_aisle;
  v18 = (NSString *)v6[5];
  if (aisle && v18) {
    int v19 = -[NSString isEqual:](aisle, "isEqual:");
  }
  else {
    int v19 = aisle == v18;
  }
  if (!v19) {
    v10 |= 8uLL;
  }
  level = self->_level;
  uint64_t v21 = (NSString *)v6[6];
  if (level && v21) {
    int v22 = -[NSString isEqual:](level, "isEqual:");
  }
  else {
    int v22 = level == v21;
  }
  if (!v22) {
    v10 |= 0x10uLL;
  }
  type = self->_type;
  v24 = (NSString *)v6[7];
  if (type && v24) {
    int v25 = -[NSString isEqual:](type, "isEqual:");
  }
  else {
    int v25 = type == v24;
  }
  if (!v25) {
    v10 |= 0x20uLL;
  }
  sectionColor = self->_sectionColor;
  id v27 = (PKColor *)v6[8];
  if (sectionColor && v27) {
    BOOL v28 = -[PKColor isEqual:](sectionColor, "isEqual:");
  }
  else {
    BOOL v28 = sectionColor == v27;
  }
  if (!v28) {
    v10 |= 0x40uLL;
  }
  seatDescription = self->_seatDescription;
  v30 = (NSString *)v6[9];
  if (seatDescription && v30) {
    int v31 = -[NSString isEqual:](seatDescription, "isEqual:");
  }
  else {
    int v31 = seatDescription == v30;
  }
  if (v31) {
    unint64_t v32 = v10;
  }
  else {
    unint64_t v32 = v10 | 0x80;
  }
  identifier = self->_identifier;
  v34 = (NSString *)v6[10];

  if (identifier && v34) {
    int v35 = [(NSString *)identifier isEqual:v34];
  }
  else {
    int v35 = identifier == v34;
  }
  if (v35) {
    return v32;
  }
  else {
    return v32 | 0x100;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKSeat *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(PKSeat *)self isEqualToSeat:v4];
  }

  return v5;
}

- (BOOL)isEqualToSeat:(id)a3
{
  id v4 = a3;
  designation = self->_designation;
  v6 = (NSString *)v4[2];
  if (designation) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (designation != v6) {
      goto LABEL_32;
    }
  }
  else
  {
    char v8 = -[NSString isEqual:](designation, "isEqual:");
    if ((v8 & 1) == 0) {
      goto LABEL_32;
    }
  }
  row = self->_row;
  unint64_t v10 = (NSString *)v4[3];
  if (row && v10)
  {
    if ((-[NSString isEqual:](row, "isEqual:") & 1) == 0) {
      goto LABEL_32;
    }
  }
  else if (row != v10)
  {
    goto LABEL_32;
  }
  id v11 = (void *)v4[4];
  v12 = self->_section;
  int v13 = v11;
  if (v12 == v13)
  {
  }
  else
  {
    v14 = v13;
    if (!v12 || !v13) {
      goto LABEL_31;
    }
    BOOL v15 = [(NSString *)v12 isEqualToString:v13];

    if (!v15) {
      goto LABEL_32;
    }
  }
  int v16 = (void *)v4[5];
  v12 = self->_aisle;
  uint64_t v17 = v16;
  if (v12 == v17)
  {
  }
  else
  {
    v14 = v17;
    if (!v12 || !v17) {
      goto LABEL_31;
    }
    BOOL v18 = [(NSString *)v12 isEqualToString:v17];

    if (!v18) {
      goto LABEL_32;
    }
  }
  int v19 = (void *)v4[6];
  v12 = self->_level;
  v20 = v19;
  if (v12 == v20)
  {

    goto LABEL_35;
  }
  v14 = v20;
  if (!v12 || !v20)
  {
LABEL_31:

    goto LABEL_32;
  }
  BOOL v21 = [(NSString *)v12 isEqualToString:v20];

  if (!v21) {
    goto LABEL_32;
  }
LABEL_35:
  type = self->_type;
  int v25 = (NSString *)v4[7];
  if (type && v25)
  {
    if ((-[NSString isEqual:](type, "isEqual:") & 1) == 0) {
      goto LABEL_32;
    }
  }
  else if (type != v25)
  {
    goto LABEL_32;
  }
  sectionColor = self->_sectionColor;
  id v27 = (PKColor *)v4[8];
  if (sectionColor && v27)
  {
    if (!-[PKColor isEqual:](sectionColor, "isEqual:")) {
      goto LABEL_32;
    }
  }
  else if (sectionColor != v27)
  {
    goto LABEL_32;
  }
  seatDescription = self->_seatDescription;
  uint64_t v29 = (NSString *)v4[9];
  if (seatDescription && v29)
  {
    if (-[NSString isEqual:](seatDescription, "isEqual:")) {
      goto LABEL_50;
    }
LABEL_32:
    char v22 = 0;
    goto LABEL_33;
  }
  if (seatDescription != v29) {
    goto LABEL_32;
  }
LABEL_50:
  identifier = self->_identifier;
  int v31 = (NSString *)v4[10];
  if (identifier && v31) {
    char v22 = -[NSString isEqual:](identifier, "isEqual:");
  }
  else {
    char v22 = identifier == v31;
  }
LABEL_33:

  return v22;
}

- (NSString)designation
{
  return self->_designation;
}

- (NSString)row
{
  return self->_row;
}

- (NSString)section
{
  return self->_section;
}

- (NSString)aisle
{
  return self->_aisle;
}

- (NSString)level
{
  return self->_level;
}

- (NSString)type
{
  return self->_type;
}

- (PKColor)sectionColor
{
  return self->_sectionColor;
}

- (NSString)seatDescription
{
  return self->_seatDescription;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_seatDescription, 0);
  objc_storeStrong((id *)&self->_sectionColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_level, 0);
  objc_storeStrong((id *)&self->_aisle, 0);
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_row, 0);
  objc_storeStrong((id *)&self->_designation, 0);
}

@end