@interface OADTableStyle
- (id)background;
- (id)band1HorzStyle;
- (id)band1VertStyle;
- (id)band2HorzStyle;
- (id)band2VertStyle;
- (id)description;
- (id)firstColumnStyle;
- (id)firstRowStyle;
- (id)id;
- (id)lastColumnStyle;
- (id)lastRowStyle;
- (id)name;
- (id)northEastStyle;
- (id)northWestStyle;
- (id)partStyle:(int)a3;
- (id)southEastStyle;
- (id)southWestStyle;
- (id)wholeTableStyle;
- (void)setBackground:(id)a3;
- (void)setBand1HorzStyle:(id)a3;
- (void)setBand1VertStyle:(id)a3;
- (void)setBand2HorzStyle:(id)a3;
- (void)setBand2VertStyle:(id)a3;
- (void)setFirstColumnStyle:(id)a3;
- (void)setFirstRowStyle:(id)a3;
- (void)setId:(id)a3;
- (void)setLastColumnStyle:(id)a3;
- (void)setLastRowStyle:(id)a3;
- (void)setName:(id)a3;
- (void)setNorthEastStyle:(id)a3;
- (void)setNorthWestStyle:(id)a3;
- (void)setSouthEastStyle:(id)a3;
- (void)setSouthWestStyle:(id)a3;
- (void)setStyle:(id)a3 forPart:(int)a4;
- (void)setWholeTableStyle:(id)a3;
@end

@implementation OADTableStyle

- (void)setId:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (void)setWholeTableStyle:(id)a3
{
}

- (void)setBand1HorzStyle:(id)a3
{
}

- (void)setBand2HorzStyle:(id)a3
{
}

- (void)setBand1VertStyle:(id)a3
{
}

- (void)setBand2VertStyle:(id)a3
{
}

- (void)setLastColumnStyle:(id)a3
{
}

- (void)setFirstColumnStyle:(id)a3
{
}

- (void)setLastRowStyle:(id)a3
{
}

- (void)setFirstRowStyle:(id)a3
{
}

- (id)id
{
  return self->mId;
}

- (id)background
{
  return self->mBackground;
}

- (id)firstRowStyle
{
  return self->mFirstRowStyle;
}

- (id)wholeTableStyle
{
  return self->mWholeTableStyle;
}

- (id)band1HorzStyle
{
  return self->mBand1HorzStyle;
}

- (void)setSouthEastStyle:(id)a3
{
}

- (void)setSouthWestStyle:(id)a3
{
}

- (void)setNorthEastStyle:(id)a3
{
}

- (void)setNorthWestStyle:(id)a3
{
}

- (void)setBackground:(id)a3
{
}

- (id)name
{
  return self->mName;
}

- (id)partStyle:(int)a3
{
  switch(a3)
  {
    case 1:
      v5 = [(OADTableStyle *)self wholeTableStyle];
      goto LABEL_18;
    case 2:
      v5 = [(OADTableStyle *)self band1HorzStyle];
      goto LABEL_18;
    case 3:
      v5 = [(OADTableStyle *)self band2HorzStyle];
      goto LABEL_18;
    case 4:
      v5 = [(OADTableStyle *)self band1VertStyle];
      goto LABEL_18;
    case 5:
      v5 = [(OADTableStyle *)self band2VertStyle];
      goto LABEL_18;
    case 6:
      v5 = [(OADTableStyle *)self firstRowStyle];
      goto LABEL_18;
    case 7:
      v5 = [(OADTableStyle *)self lastRowStyle];
      goto LABEL_18;
    case 8:
      v5 = [(OADTableStyle *)self firstColumnStyle];
      goto LABEL_18;
    case 9:
      v5 = [(OADTableStyle *)self lastColumnStyle];
      goto LABEL_18;
    case 10:
      v5 = [(OADTableStyle *)self northWestStyle];
      goto LABEL_18;
    case 11:
      v5 = [(OADTableStyle *)self northEastStyle];
      goto LABEL_18;
    case 12:
      v5 = [(OADTableStyle *)self southWestStyle];
      goto LABEL_18;
    case 13:
      v5 = [(OADTableStyle *)self southEastStyle];
LABEL_18:
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (void)setStyle:(id)a3 forPart:(int)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 1:
      [(OADTableStyle *)self setWholeTableStyle:v6];
      break;
    case 2:
      [(OADTableStyle *)self setBand1HorzStyle:v6];
      break;
    case 3:
      [(OADTableStyle *)self setBand2HorzStyle:v6];
      break;
    case 4:
      [(OADTableStyle *)self setBand1VertStyle:v6];
      break;
    case 5:
      [(OADTableStyle *)self setBand2VertStyle:v6];
      break;
    case 6:
      [(OADTableStyle *)self setFirstRowStyle:v6];
      break;
    case 7:
      [(OADTableStyle *)self setLastRowStyle:v6];
      break;
    case 8:
      [(OADTableStyle *)self setFirstColumnStyle:v6];
      break;
    case 9:
      [(OADTableStyle *)self setLastColumnStyle:v6];
      break;
    case 10:
      [(OADTableStyle *)self setNorthWestStyle:v6];
      break;
    case 11:
      [(OADTableStyle *)self setNorthEastStyle:v6];
      break;
    case 12:
      [(OADTableStyle *)self setSouthWestStyle:v6];
      break;
    case 13:
      [(OADTableStyle *)self setSouthEastStyle:v6];
      break;
    default:
      break;
  }
}

- (id)band2HorzStyle
{
  return self->mBand2HorzStyle;
}

- (id)band1VertStyle
{
  return self->mBand1VertStyle;
}

- (id)band2VertStyle
{
  return self->mBand2VertStyle;
}

- (id)firstColumnStyle
{
  return self->mFirstColumnStyle;
}

- (id)lastRowStyle
{
  return self->mLastRowStyle;
}

- (id)lastColumnStyle
{
  return self->mLastColumnStyle;
}

- (id)northEastStyle
{
  return self->mNorthEastStyle;
}

- (id)northWestStyle
{
  return self->mNorthWestStyle;
}

- (id)southEastStyle
{
  return self->mSouthEastStyle;
}

- (id)southWestStyle
{
  return self->mSouthWestStyle;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADTableStyle;
  v2 = [(OADTableStyle *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mSouthWestStyle, 0);
  objc_storeStrong((id *)&self->mSouthEastStyle, 0);
  objc_storeStrong((id *)&self->mNorthWestStyle, 0);
  objc_storeStrong((id *)&self->mNorthEastStyle, 0);
  objc_storeStrong((id *)&self->mLastColumnStyle, 0);
  objc_storeStrong((id *)&self->mLastRowStyle, 0);
  objc_storeStrong((id *)&self->mFirstColumnStyle, 0);
  objc_storeStrong((id *)&self->mFirstRowStyle, 0);
  objc_storeStrong((id *)&self->mBand2VertStyle, 0);
  objc_storeStrong((id *)&self->mBand1VertStyle, 0);
  objc_storeStrong((id *)&self->mBand2HorzStyle, 0);
  objc_storeStrong((id *)&self->mBand1HorzStyle, 0);
  objc_storeStrong((id *)&self->mWholeTableStyle, 0);
  objc_storeStrong((id *)&self->mBackground, 0);
  objc_storeStrong((id *)&self->mId, 0);
  objc_storeStrong((id *)&self->mName, 0);
}

@end