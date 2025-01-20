@interface PKPassTileView_State
+ (uint64_t)visuallyCompareTile:(void *)a3 toTile:;
- (PKPassTileView_State)init;
@end

@implementation PKPassTileView_State

+ (uint64_t)visuallyCompareTile:(void *)a3 toTile:
{
  id v4 = a2;
  id v5 = a3;
  self;
  if (v4 == v5)
  {
    uint64_t v6 = 2;
  }
  else if ((v4 != 0) != (v5 != 0))
  {
    uint64_t v6 = 0;
  }
  else
  {
    v7 = [v4 metadata];
    uint64_t v8 = [v5 metadata];
    v9 = (void *)v8;
    if (v7 == (void *)v8) {
      goto LABEL_12;
    }
    if ((v7 != 0) != (v8 != 0)) {
      goto LABEL_7;
    }
    if (!v7) {
      goto LABEL_12;
    }
    if (!v8) {
      goto LABEL_12;
    }
    int v10 = [v7 isSelectable];
    if (v10 != [v9 isSelectable]
      || ([v7 identifier],
          v11 = objc_claimAutoreleasedReturnValue(),
          [v9 identifier],
          v12 = objc_claimAutoreleasedReturnValue(),
          int v13 = PKEqualObjects(),
          v12,
          v11,
          !v13))
    {
LABEL_7:
      uint64_t v6 = 0;
    }
    else
    {
LABEL_12:
      v14 = [v4 stateIdentifier];
      v15 = [v5 stateIdentifier];
      if (PKEqualObjects()) {
        uint64_t v6 = 2;
      }
      else {
        uint64_t v6 = 1;
      }
    }
  }

  return v6;
}

- (PKPassTileView_State)init
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedView, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_bodyImageImage, 0);
  objc_storeStrong((id *)&self->_bodyImage, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_secondaryImage, 0);
  objc_storeStrong((id *)&self->_secondaryAccessory, 0);
  objc_storeStrong((id *)&self->_accessoryImage, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_icon, 0);

  objc_storeStrong((id *)&self->_source, 0);
}

@end