@interface CRLLobbySession_mi
- (BOOL)isEqual:(id)a3;
- (CNContact)cnContact;
- (CRLColor)indicatorDarkColor;
- (CRLLobbySession_mi)initWithDisplayName:(id)a3 indicatorDarkColor:(id)a4 cnContact:(id)a5;
- (NSString)displayName;
- (id)description;
- (unint64_t)hash;
@end

@implementation CRLLobbySession_mi

- (CRLLobbySession_mi)initWithDisplayName:(id)a3 indicatorDarkColor:(id)a4 cnContact:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CRLLobbySession_mi;
  v11 = [(CRLLobbySession_mi *)&v18 init];
  if (v11)
  {
    v12 = [v8 crl_substringWithComposedCharacterSequencesTruncatedToLength:30];
    v13 = (NSString *)[v12 copy];
    displayName = v11->_displayName;
    v11->_displayName = v13;

    v15 = (CRLColor *)[v9 copy];
    indicatorDarkColor = v11->_indicatorDarkColor;
    v11->_indicatorDarkColor = v15;

    objc_storeStrong((id *)&v11->_cnContact, a5);
  }

  return v11;
}

- (id)description
{
  v5.receiver = self;
  v5.super_class = (Class)CRLLobbySession_mi;
  v2 = [(CRLLobbySession_mi *)&v5 description];
  v3 = +[NSString stringWithFormat:@"%@", v2];

  return v3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)isEqual:(id)a3
{
  if (self != a3)
  {
    id v4 = a3;
    uint64_t v5 = objc_opt_class();
    v6 = sub_1002469D0(v5, v4);

    if (v6)
    {
      v7 = (void *)v6[1];
      id v8 = self->_displayName;
      id v9 = v7;
      if (v8 == v9)
      {

        goto LABEL_10;
      }
      id v10 = v9;
      if (v8 && v9)
      {
        unsigned int v11 = [(NSString *)v8 isEqualToString:v9];

        if (!v11) {
          goto LABEL_13;
        }
LABEL_10:
        indicatorDarkColor = self->_indicatorDarkColor;
        if ((unint64_t)indicatorDarkColor | v6[2]) {
          unsigned __int8 v12 = -[CRLColor isEqual:](indicatorDarkColor, "isEqual:");
        }
        else {
          unsigned __int8 v12 = 1;
        }
        goto LABEL_14;
      }
    }
LABEL_13:
    unsigned __int8 v12 = 0;
LABEL_14:

    return v12;
  }
  return 1;
}

- (unint64_t)hash
{
  return [(NSString *)self->_displayName hash];
}

- (CRLColor)indicatorDarkColor
{
  return self->_indicatorDarkColor;
}

- (CNContact)cnContact
{
  return self->_cnContact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cnContact, 0);
  objc_storeStrong((id *)&self->_indicatorDarkColor, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end