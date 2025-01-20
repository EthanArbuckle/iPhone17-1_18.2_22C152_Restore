@interface NTKFaceEditColorPickerConfiguration
- (BOOL)canAddColors;
- (BOOL)hasSeparator;
- (BOOL)isEqual:(id)a3;
- (NTKFaceEditColorPickerConfiguration)init;
- (NTKPigmentEditOptionArray)editableColors;
- (NTKPigmentEditOptionArray)nonEditableColors;
- (id)colorAtIndex:(unint64_t)a3;
- (id)legacyColorAtIndex:(unint64_t)a3;
- (id)legacyColors;
- (unint64_t)indexOfColor:(id)a3;
- (unint64_t)indexOfLegacyColor:(id)a3;
- (unint64_t)numberOfColors;
- (void)addEditableColor:(id)a3;
- (void)addLegacyColor:(id)a3;
- (void)addNonEditableColor:(id)a3;
- (void)insertEditableColor:(id)a3 atIndex:(unint64_t)a4;
- (void)insertLegacyColor:(id)a3 atIndex:(unint64_t)a4;
- (void)insertNonEditableColor:(id)a3 atIndex:(unint64_t)a4;
- (void)removeEditableColor:(id)a3;
- (void)removeEditableColorAtIndex:(unint64_t)a3;
- (void)removeLegacyColor:(id)a3;
- (void)removeLegacyColorAtIndex:(unint64_t)a3;
- (void)removeNonEditableColor:(id)a3;
- (void)removeNonEditableColorAtIndex:(unint64_t)a3;
- (void)setCanAddColors:(BOOL)a3;
@end

@implementation NTKFaceEditColorPickerConfiguration

- (NTKFaceEditColorPickerConfiguration)init
{
  v10.receiver = self;
  v10.super_class = (Class)NTKFaceEditColorPickerConfiguration;
  v2 = [(NTKFaceEditColorPickerConfiguration *)&v10 init];
  if (v2)
  {
    uint64_t v3 = +[NTKPigmentEditOptionArray array];
    editableColors = v2->_editableColors;
    v2->_editableColors = (NTKPigmentEditOptionArray *)v3;

    uint64_t v5 = +[NTKPigmentEditOptionArray array];
    nonEditableColors = v2->_nonEditableColors;
    v2->_nonEditableColors = (NTKPigmentEditOptionArray *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    legacyColors = v2->_legacyColors;
    v2->_legacyColors = (NSMutableArray *)v7;
  }
  return v2;
}

- (void)addEditableColor:(id)a3
{
}

- (void)insertEditableColor:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)removeEditableColor:(id)a3
{
}

- (void)removeEditableColorAtIndex:(unint64_t)a3
{
}

- (void)addNonEditableColor:(id)a3
{
}

- (void)insertNonEditableColor:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)removeNonEditableColor:(id)a3
{
}

- (void)removeNonEditableColorAtIndex:(unint64_t)a3
{
}

- (unint64_t)numberOfColors
{
  unint64_t v3 = [(NTKPigmentEditOptionArray *)self->_editableColors count];
  return [(NTKPigmentEditOptionArray *)self->_nonEditableColors count] + v3;
}

- (unint64_t)indexOfColor:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NTKPigmentEditOptionArray *)self->_editableColors indexOfPigment:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v6 = [(NTKPigmentEditOptionArray *)self->_nonEditableColors indexOfPigment:v4];
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v5 = [(NTKPigmentEditOptionArray *)self->_editableColors count] + v6;
    }
  }

  return v5;
}

- (id)colorAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NTKPigmentEditOptionArray *)self->_editableColors count];
  uint64_t v6 = 16;
  if (v5 <= a3)
  {
    unint64_t v7 = v5;
  }
  else
  {
    uint64_t v6 = 8;
    unint64_t v7 = 0;
  }
  v8 = [*(id *)((char *)&self->super.isa + v6) pigmentAtIndex:a3 - v7];
  return v8;
}

- (BOOL)hasSeparator
{
  unint64_t v3 = [(NTKPigmentEditOptionArray *)self->_editableColors count];
  if (v3)
  {
    if ([(NTKPigmentEditOptionArray *)self->_nonEditableColors count]) {
      LOBYTE(v3) = 1;
    }
    else {
      LOBYTE(v3) = self->_canAddColors;
    }
  }
  return v3;
}

- (id)legacyColors
{
  return self->_legacyColors;
}

- (void)addLegacyColor:(id)a3
{
}

- (void)insertLegacyColor:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)removeLegacyColor:(id)a3
{
}

- (void)removeLegacyColorAtIndex:(unint64_t)a3
{
}

- (unint64_t)indexOfLegacyColor:(id)a3
{
  return [(NSMutableArray *)self->_legacyColors indexOfObject:a3];
}

- (id)legacyColorAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_legacyColors objectAtIndex:a3];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (int v5 = [(NTKFaceEditColorPickerConfiguration *)self canAddColors],
        v5 == [v4 canAddColors]))
  {
    unint64_t v7 = [(NTKFaceEditColorPickerConfiguration *)self editableColors];
    v8 = [v4 editableColors];
    if ([v7 isEqual:v8])
    {
      v9 = [(NTKFaceEditColorPickerConfiguration *)self nonEditableColors];
      objc_super v10 = [v4 nonEditableColors];
      if ([v9 isEqual:v10])
      {
        v11 = [(NTKFaceEditColorPickerConfiguration *)self legacyColors];
        v12 = [v4 legacyColors];
        char v6 = [v11 isEqual:v12];
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (NTKPigmentEditOptionArray)editableColors
{
  return self->_editableColors;
}

- (NTKPigmentEditOptionArray)nonEditableColors
{
  return self->_nonEditableColors;
}

- (BOOL)canAddColors
{
  return self->_canAddColors;
}

- (void)setCanAddColors:(BOOL)a3
{
  self->_canAddColors = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyColors, 0);
  objc_storeStrong((id *)&self->_nonEditableColors, 0);
  objc_storeStrong((id *)&self->_editableColors, 0);
}

@end