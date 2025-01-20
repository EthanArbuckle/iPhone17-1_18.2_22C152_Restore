@interface TUIBox
+ (id)blendModeFromString:(id)a3;
+ (id)layerContentsGravityFromString:(id)a3;
+ (id)videoGravityFromString:(id)a3;
+ (int64_t)imageRenderingModeFromString:(id)a3;
+ (int64_t)textAlignmentFromString:(id)a3;
+ (unint64_t)anchorPositionFromString:(id)a3;
+ (unint64_t)axisFromString:(id)a3;
+ (unint64_t)compressedFromString:(id)a3;
+ (unint64_t)defaultRole;
+ (unint64_t)halignFromString:(id)a3;
+ (unint64_t)interfaceLayoutDirectionFromString:(id)a3;
+ (unint64_t)layoutModeFromString:(id)a3;
+ (unint64_t)liveTransformFromString:(id)a3;
+ (unint64_t)renderModelFromString:(id)a3;
+ (unint64_t)roleFromString:(id)a3;
+ (unint64_t)triggerStateFromString:(id)a3;
+ (unint64_t)userInterfaceStyleFromString:(id)a3;
+ (unint64_t)valignFromString:(id)a3;
+ (void)initialize;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)height;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)relativeWidth;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)width;
- (BOOL)axAdjustable;
- (BOOL)axButton;
- (BOOL)axDisabled;
- (BOOL)axHasNonDefaultAttributess;
- (BOOL)axHeading;
- (BOOL)axImage;
- (BOOL)axStaticText;
- (BOOL)axToggle;
- (BOOL)axTouchContainer;
- (BOOL)grouped;
- (BOOL)hasRelativeWidth;
- (BOOL)inheritHeight;
- (BOOL)inheritWidth;
- (BOOL)isAXElement;
- (CGAffineTransform)renderTransform;
- (CGAffineTransform)transform;
- (Class)dynamicArrayLayoutContainerClass;
- (Class)dynamicArrayLayoutIterationClass;
- (Class)layoutClass;
- (NSArray)axCustomActions;
- (NSString)axHint;
- (NSString)axIdentifier;
- (NSString)axLabel;
- (NSString)axValue;
- (NSString)description;
- (NSString)refId;
- (NSString)refInstance;
- (TUIAnimationGroupCollection)animationGroups;
- (TUIBox)init;
- (TUIDynamicArrayWindowing)dynamicArrayWindowingBox;
- (TUIGridCoord)gridCoord;
- (TUIGuides)guides;
- (TUIIdentifier)identifier;
- (TUIImpressionData)impressionData;
- (TUIModelContaining)parentModel;
- (UIEdgeInsets)renderOutsets;
- (id).cxx_construct;
- (int64_t)zIndex;
- (unint64_t)anchorPosition;
- (unint64_t)halign;
- (unint64_t)hcompressed;
- (unint64_t)layoutDirection;
- (unint64_t)liveTransformKind;
- (unint64_t)modelKind;
- (unint64_t)renderModelKind;
- (unint64_t)role;
- (unint64_t)valign;
- (unint64_t)vcompressed;
- (void)_compressStorage;
- (void)appendLayoutModelsToArray:(id)a3;
- (void)setAXElement:(BOOL)a3;
- (void)setAnchorPosition:(unint64_t)a3;
- (void)setAnimationGroups:(id)a3;
- (void)setAxAdjustable:(BOOL)a3;
- (void)setAxButton:(BOOL)a3;
- (void)setAxCustomActions:(id)a3;
- (void)setAxDisabled:(BOOL)a3;
- (void)setAxHeading:(BOOL)a3;
- (void)setAxHint:(id)a3;
- (void)setAxIdentifier:(id)a3;
- (void)setAxImage:(BOOL)a3;
- (void)setAxLabel:(id)a3;
- (void)setAxStaticText:(BOOL)a3;
- (void)setAxToggle:(BOOL)a3;
- (void)setAxTouchContainer:(BOOL)a3;
- (void)setAxValue:(id)a3;
- (void)setGridCoord:(id)a3;
- (void)setGrouped:(BOOL)a3;
- (void)setGuides:(id)a3;
- (void)setHalign:(unint64_t)a3;
- (void)setHcompressed:(unint64_t)a3;
- (void)setHeight:(id *)a3;
- (void)setIdentifier:(id)a3;
- (void)setImpressionData:(id)a3;
- (void)setInheritHeight:(BOOL)a3;
- (void)setInheritWidth:(BOOL)a3;
- (void)setLayoutDirection:(unint64_t)a3;
- (void)setLiveTransformKind:(unint64_t)a3;
- (void)setParentModel:(id)a3;
- (void)setRefId:(id)a3;
- (void)setRefInstance:(id)a3;
- (void)setRelativeWidth:(id *)a3;
- (void)setRenderModelKind:(unint64_t)a3;
- (void)setRenderOutsets:(UIEdgeInsets)a3;
- (void)setRenderTransform:(CGAffineTransform *)a3;
- (void)setRole:(unint64_t)a3;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)setValign:(unint64_t)a3;
- (void)setVcompressed:(unint64_t)a3;
- (void)setWidth:(id *)a3;
- (void)setZIndex:(int64_t)a3;
@end

@implementation TUIBox

- (Class)dynamicArrayLayoutContainerClass
{
  return (Class)objc_opt_class();
}

- (Class)dynamicArrayLayoutIterationClass
{
  return (Class)objc_opt_class();
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if (qword_2DFBF0[0] != -1) {
      dispatch_once(qword_2DFBF0, &stru_2577B8);
    }
    v2 = (unsigned int *)[(id)qword_2DFBE8 bytes];
    uint64_t v3 = v2[1];
    if (v3)
    {
      v4 = (const char *)v2;
      uint64_t v5 = 0;
      v6 = (char *)(v2 + 2);
      while (strcmp("box", &v4[*(unsigned int *)&v6[v5]]))
      {
        v5 += 4;
        if (4 * v3 == v5)
        {
          uint64_t v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v7 = (uint64_t)&v4[*(unsigned int *)&v6[4 * v3 + v5]];
LABEL_11:
      uint64_t v9 = 0;
      TUIBoxStorageDataset = v7;
      while (strcmp("imagebox", &v4[*(unsigned int *)&v6[4 * v9]]))
      {
        if (v3 == ++v9)
        {
          uint64_t v10 = 0;
          goto LABEL_16;
        }
      }
      uint64_t v10 = (uint64_t)&v4[*(unsigned int *)&v6[4 * v3 + 4 * v9]];
LABEL_16:
      uint64_t v11 = 0;
      TUIImageBoxStorageDataset = v10;
      while (strcmp("vbox", &v4[*(unsigned int *)&v6[4 * v11]]))
      {
        if (v3 == ++v11)
        {
          uint64_t v12 = 0;
          goto LABEL_21;
        }
      }
      uint64_t v12 = (uint64_t)&v4[*(unsigned int *)&v6[4 * v3 + 4 * v11]];
LABEL_21:
      uint64_t v13 = 0;
      TUIVBoxStorageDataset = v12;
      while (strcmp("progressbox", &v4[*(unsigned int *)&v6[4 * v13]]))
      {
        if (v3 == ++v13)
        {
          uint64_t v14 = 0;
          goto LABEL_26;
        }
      }
      uint64_t v14 = (uint64_t)&v4[*(unsigned int *)&v6[4 * v3 + 4 * v13]];
LABEL_26:
      uint64_t v15 = 0;
      TUIProgressBoxStorageDataset = v14;
      while (strcmp("statefulelementbox", &v4[*(unsigned int *)&v6[4 * v15]]))
      {
        if (v3 == ++v15)
        {
          uint64_t v16 = 0;
          goto LABEL_31;
        }
      }
      uint64_t v16 = (uint64_t)&v4[*(unsigned int *)&v6[4 * v3 + 4 * v15]];
LABEL_31:
      uint64_t v17 = 0;
      TUIStatefulElementBoxStorageDataset = v16;
      while (strcmp("ratingsbox", &v4[*(unsigned int *)&v6[4 * v17]]))
      {
        if (v3 == ++v17)
        {
          uint64_t v18 = 0;
          goto LABEL_36;
        }
      }
      uint64_t v18 = (uint64_t)&v4[*(unsigned int *)&v6[4 * v3 + 4 * v17]];
LABEL_36:
      uint64_t v19 = 0;
      TUIRatingsBoxStorageDataset = v18;
      while (strcmp("styledbox", &v4[*(unsigned int *)&v6[4 * v19]]))
      {
        if (v3 == ++v19)
        {
          uint64_t v20 = 0;
          goto LABEL_41;
        }
      }
      uint64_t v20 = (uint64_t)&v4[*(unsigned int *)&v6[4 * v3 + 4 * v19]];
LABEL_41:
      uint64_t v21 = 0;
      TUIStyledBoxStorageDataset = v20;
      while (strcmp("wpbox", &v4[*(unsigned int *)&v6[4 * v21]]))
      {
        if (v3 == ++v21)
        {
          uint64_t v8 = 0;
          goto LABEL_46;
        }
      }
      uint64_t v8 = (uint64_t)&v4[*(unsigned int *)&v6[4 * v3 + 4 * v21]];
    }
    else
    {
      uint64_t v8 = 0;
      TUIBoxStorageDataset = 0;
      TUIImageBoxStorageDataset = 0;
      TUIVBoxStorageDataset = 0;
      TUIProgressBoxStorageDataset = 0;
      TUIStatefulElementBoxStorageDataset = 0;
      TUIRatingsBoxStorageDataset = 0;
      TUIStyledBoxStorageDataset = 0;
    }
LABEL_46:
    TUIWPBoxStorageDataset = v8;
  }
}

- (TUIBox)init
{
  v3.receiver = self;
  v3.super_class = (Class)TUIBox;
  result = [(TUIBox *)&v3 init];
  if (result) {
    result->_storage._data = TUIBoxStorageDataset | 1;
  }
  return result;
}

- (unint64_t)modelKind
{
  return 1;
}

- (void)appendLayoutModelsToArray:(id)a3
{
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)width
{
  uint64_t v3 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0);
  v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F **)&TUILengthNull;
  if (v3) {
    v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F **)v3;
  }
  return *v4;
}

- (void)setWidth:(id *)a3
{
  uint64_t v4 = v3;
  p_storage = &self->_storage;
  if ((v3 & 0x7000000000000) == 0x2000000000000)
  {
    uint64_t v7 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0);
    if (!v7) {
      return;
    }
    DataForKey = (void *)v7;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0);
  }
  else
  {
    DataForKey = (void *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->_storage, 0, 0x10uLL, 1);
    if (!DataForKey) {
      return;
    }
  }
  void *DataForKey = a3;
  DataForKey[1] = v4;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)relativeWidth
{
  uint64_t v3 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0x22u);
  uint64_t v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F **)&TUILengthNull;
  if (v3) {
    uint64_t v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F **)v3;
  }
  return *v4;
}

- (void)setRelativeWidth:(id *)a3
{
  uint64_t v4 = v3;
  p_storage = &self->_storage;
  if ((v3 & 0x7000000000000) == 0x2000000000000)
  {
    uint64_t v7 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0x22u);
    if (!v7) {
      return;
    }
    DataForKey = (void *)v7;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0x22u);
  }
  else
  {
    DataForKey = (void *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->_storage, 0x22u, 0x10uLL, 1);
    if (!DataForKey) {
      return;
    }
  }
  void *DataForKey = a3;
  DataForKey[1] = v4;
}

- (BOOL)hasRelativeWidth
{
  return TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0x22u) != 0;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)height
{
  uint64_t v3 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 8u);
  uint64_t v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F **)&TUILengthNull;
  if (v3) {
    uint64_t v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F **)v3;
  }
  return *v4;
}

- (void)setHeight:(id *)a3
{
  uint64_t v4 = v3;
  p_storage = &self->_storage;
  if ((v3 & 0x7000000000000) == 0x2000000000000)
  {
    uint64_t v7 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 8u);
    if (!v7) {
      return;
    }
    DataForKey = (void *)v7;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 8u);
  }
  else
  {
    DataForKey = (void *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->_storage, 8u, 0x10uLL, 1);
    if (!DataForKey) {
      return;
    }
  }
  void *DataForKey = a3;
  DataForKey[1] = v4;
}

- (CGAffineTransform)transform
{
  result = (CGAffineTransform *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0x28u);
  uint64_t v5 = (float32x2_t *)&TUIAffineTransform32Identity;
  if (result) {
    uint64_t v5 = (float32x2_t *)result;
  }
  float64x2_t v6 = vcvtq_f64_f32(v5[1]);
  *(float64x2_t *)&retstr->a = vcvtq_f64_f32(*v5);
  *(float64x2_t *)&retstr->c = v6;
  *(float64x2_t *)&retstr->tx = vcvtq_f64_f32(v5[2]);
  return result;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  p_storage = &self->_storage;
  float a = a3->a;
  float b = a3->b;
  float c = a3->c;
  float d = a3->d;
  float tx = a3->tx;
  float ty = a3->ty;
  v12[0] = a;
  v12[1] = b;
  v12[2] = c;
  v12[3] = d;
  v12[4] = tx;
  v12[5] = ty;
  if (TUIAffineTransform32IsIdentity(v12))
  {
    uint64_t v10 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)p_storage, 0x28u);
    if (!v10) {
      return;
    }
    DataForKey = (float *)v10;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0x28u);
  }
  else
  {
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)p_storage, 0x28u, 0x18uLL, 1);
    if (!DataForKey) {
      return;
    }
  }
  float *DataForKey = a;
  DataForKey[1] = b;
  DataForKey[2] = c;
  DataForKey[3] = d;
  DataForKey[4] = tx;
  DataForKey[5] = ty;
}

- (CGAffineTransform)renderTransform
{
  result = (CGAffineTransform *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0x2Au);
  uint64_t v5 = (float32x2_t *)&TUIAffineTransform32Identity;
  if (result) {
    uint64_t v5 = (float32x2_t *)result;
  }
  float64x2_t v6 = vcvtq_f64_f32(v5[1]);
  *(float64x2_t *)&retstr->float a = vcvtq_f64_f32(*v5);
  *(float64x2_t *)&retstr->float c = v6;
  *(float64x2_t *)&retstr->float tx = vcvtq_f64_f32(v5[2]);
  return result;
}

- (void)setRenderTransform:(CGAffineTransform *)a3
{
  p_storage = &self->_storage;
  float a = a3->a;
  float b = a3->b;
  float c = a3->c;
  float d = a3->d;
  float tx = a3->tx;
  float ty = a3->ty;
  v12[0] = a;
  v12[1] = b;
  v12[2] = c;
  v12[3] = d;
  v12[4] = tx;
  v12[5] = ty;
  if (TUIAffineTransform32IsIdentity(v12))
  {
    uint64_t v10 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)p_storage, 0x2Au);
    if (!v10) {
      return;
    }
    DataForKey = (float *)v10;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0x2Au);
  }
  else
  {
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)p_storage, 0x2Au, 0x18uLL, 1);
    if (!DataForKey) {
      return;
    }
  }
  float *DataForKey = a;
  DataForKey[1] = b;
  DataForKey[2] = c;
  DataForKey[3] = d;
  DataForKey[4] = tx;
  DataForKey[5] = ty;
}

- (int64_t)zIndex
{
  v2 = (int *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0x17u);
  if (v2 && *v2 != 0x7FFFFFFF) {
    return *v2;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)setZIndex:(int64_t)a3
{
  p_storage = &self->_storage;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    int v4 = 0x7FFFFFFF;
  }
  else {
    int v4 = a3;
  }
  if (v4 == 0x7FFFFFFF)
  {
    uint64_t v5 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0x17u);
    if (!v5) {
      return;
    }
    DataForKey = (_DWORD *)v5;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0x17u);
  }
  else
  {
    DataForKey = (_DWORD *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->_storage, 0x17u, 4uLL, 1);
    if (!DataForKey) {
      return;
    }
  }
  _DWORD *DataForKey = v4;
}

- (UIEdgeInsets)renderOutsets
{
  uint64_t v2 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0x1Du);
  uint64_t v3 = (float *)&TUIInsets32Zero;
  if (v2) {
    uint64_t v3 = (float *)v2;
  }
  double v4 = *v3;
  double v5 = v3[1];
  double v6 = v3[2];
  double v7 = v3[3];
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (void)setRenderOutsets:(UIEdgeInsets)a3
{
  p_storage = &self->_storage;
  float top = a3.top;
  float left = a3.left;
  float bottom = a3.bottom;
  float right = a3.right;
  if (TUIInsets32Equal(top, left, bottom, right, 0.0, 0.0, 0.0, 0.0))
  {
    uint64_t v8 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)p_storage, 0x1Du);
    if (!v8) {
      return;
    }
    DataForKey = (float *)v8;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0x1Du);
  }
  else
  {
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)p_storage, 0x1Du, 0x10uLL, 1);
    if (!DataForKey) {
      return;
    }
  }
  float *DataForKey = top;
  DataForKey[1] = left;
  DataForKey[2] = bottom;
  DataForKey[3] = right;
}

- (TUIImpressionData)impressionData
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0x13u);

  return (TUIImpressionData *)ObjectForKey;
}

- (void)setImpressionData:(id)a3
{
}

- (NSArray)axCustomActions
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0x31u);

  return (NSArray *)ObjectForKey;
}

- (void)setAxCustomActions:(id)a3
{
}

- (NSString)refId
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0xAu);

  return (NSString *)ObjectForKey;
}

- (void)setRefId:(id)a3
{
}

- (NSString)refInstance
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0x12u);

  return (NSString *)ObjectForKey;
}

- (void)setRefInstance:(id)a3
{
}

- (TUIGridCoord)gridCoord
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0x30u);

  return (TUIGridCoord *)ObjectForKey;
}

- (void)setGridCoord:(id)a3
{
}

- (NSString)axLabel
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0xEu);

  return (NSString *)ObjectForKey;
}

- (void)setAxLabel:(id)a3
{
  double v4 = (objc_object *)[a3 copy];
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->_storage, 0xEu, v4);
}

- (NSString)axValue
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0x1Eu);

  return (NSString *)ObjectForKey;
}

- (void)setAxValue:(id)a3
{
  double v4 = (objc_object *)[a3 copy];
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->_storage, 0x1Eu, v4);
}

- (NSString)axHint
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0x20u);

  return (NSString *)ObjectForKey;
}

- (void)setAxHint:(id)a3
{
  double v4 = (objc_object *)[a3 copy];
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->_storage, 0x20u, v4);
}

- (TUIAnimationGroupCollection)animationGroups
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0x27u);

  return (TUIAnimationGroupCollection *)ObjectForKey;
}

- (void)setAnimationGroups:(id)a3
{
}

- (TUIGuides)guides
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 9u);

  return (TUIGuides *)ObjectForKey;
}

- (void)setGuides:(id)a3
{
}

- (unint64_t)role
{
  return *(_DWORD *)&self->_flags & 7;
}

- (void)setRole:(unint64_t)a3
{
  int flags = (int)self->_flags;
  p_int flags = &self->_flags;
  *(_DWORD *)p_int flags = flags & 0xFFFFFFF8 | a3 & 7;
  LOWORD(flags) = *((_WORD *)p_flags + 2);
  p_int flags = (Flags *)((char *)p_flags + 4);
  *((unsigned char *)p_flags + 2) = *((unsigned char *)p_flags + 2);
  *(_WORD *)p_int flags = flags;
}

- (BOOL)inheritWidth
{
  return ((unint64_t)*(_DWORD *)&self->_flags >> 19) & 1;
}

- (void)setInheritWidth:(BOOL)a3
{
  int flags = (int)self->_flags;
  p_int flags = &self->_flags;
  __int16 v5 = *((_WORD *)p_flags + 2);
  int v6 = flags;
  int v7 = 0x80000;
  if (!a3) {
    int v7 = 0;
  }
  *((unsigned char *)p_flags + 6) = *((unsigned char *)p_flags + 6);
  *((_WORD *)p_flags + 2) = v5;
  *(_DWORD *)p_int flags = v6 & 0xFFF7FFFF | v7;
}

- (BOOL)inheritHeight
{
  return ((unint64_t)*(_DWORD *)&self->_flags >> 20) & 1;
}

- (void)setInheritHeight:(BOOL)a3
{
  int flags = (int)self->_flags;
  p_int flags = &self->_flags;
  __int16 v5 = *((_WORD *)p_flags + 2);
  int v6 = flags;
  int v7 = 0x100000;
  if (!a3) {
    int v7 = 0;
  }
  *((unsigned char *)p_flags + 6) = *((unsigned char *)p_flags + 6);
  *((_WORD *)p_flags + 2) = v5;
  *(_DWORD *)p_int flags = v6 & 0xFFEFFFFF | v7;
}

- (unint64_t)layoutDirection
{
  return ((unint64_t)*(_DWORD *)&self->_flags >> 3) & 3;
}

- (void)setLayoutDirection:(unint64_t)a3
{
  int flags = (int)self->_flags;
  p_int flags = &self->_flags;
  __int16 v5 = *((_WORD *)p_flags + 2);
  *((unsigned char *)p_flags + 6) = *((unsigned char *)p_flags + 6);
  *((_WORD *)p_flags + 2) = v5;
  *(_DWORD *)p_int flags = flags & 0xFFFFFFE7 | (8 * (a3 & 3));
}

- (unint64_t)renderModelKind
{
  return ((unint64_t)*(_DWORD *)&self->_flags >> 5) & 0xF;
}

- (void)setRenderModelKind:(unint64_t)a3
{
  int flags = (int)self->_flags;
  p_int flags = &self->_flags;
  __int16 v5 = *((_WORD *)p_flags + 2);
  *((unsigned char *)p_flags + 6) = *((unsigned char *)p_flags + 6);
  *((_WORD *)p_flags + 2) = v5;
  *(_DWORD *)p_int flags = flags & 0xFFFFFE1F | (32 * (a3 & 0xF));
}

- (unint64_t)valign
{
  return ((unint64_t)*(_DWORD *)&self->_flags >> 9) & 7;
}

- (void)setValign:(unint64_t)a3
{
  int flags = (int)self->_flags;
  p_int flags = &self->_flags;
  __int16 v5 = *((_WORD *)p_flags + 2);
  *((unsigned char *)p_flags + 6) = *((unsigned char *)p_flags + 6);
  *((_WORD *)p_flags + 2) = v5;
  *(_DWORD *)p_int flags = flags & 0xFFFFF1FF | ((a3 & 7) << 9);
}

- (unint64_t)halign
{
  return ((unint64_t)*(_DWORD *)&self->_flags >> 12) & 3;
}

- (void)setHalign:(unint64_t)a3
{
  int flags = (int)self->_flags;
  p_int flags = &self->_flags;
  __int16 v5 = *((_WORD *)p_flags + 2);
  *((unsigned char *)p_flags + 6) = *((unsigned char *)p_flags + 6);
  *((_WORD *)p_flags + 2) = v5;
  *(_DWORD *)p_int flags = flags & 0xFFFFCFFF | ((a3 & 3) << 12);
}

- (unint64_t)vcompressed
{
  return ((unint64_t)*(_DWORD *)&self->_flags >> 14) & 1;
}

- (void)setVcompressed:(unint64_t)a3
{
  int flags = (int)self->_flags;
  p_int flags = &self->_flags;
  __int16 v5 = *((_WORD *)p_flags + 2);
  *((unsigned char *)p_flags + 6) = *((unsigned char *)p_flags + 6);
  *((_WORD *)p_flags + 2) = v5;
  *(_DWORD *)p_int flags = flags & 0xFFFFBFFF | ((a3 & 1) << 14);
}

- (unint64_t)hcompressed
{
  return ((unint64_t)*(_DWORD *)&self->_flags >> 15) & 1;
}

- (void)setHcompressed:(unint64_t)a3
{
  int flags = (int)self->_flags;
  p_int flags = &self->_flags;
  __int16 v5 = *((_WORD *)p_flags + 2);
  *((unsigned char *)p_flags + 6) = *((unsigned char *)p_flags + 6);
  *((_WORD *)p_flags + 2) = v5;
  *(_DWORD *)p_int flags = flags & 0xFFFF7FFF | ((a3 & 1) << 15);
}

- (unint64_t)liveTransformKind
{
  return *((_WORD *)&self->_flags + 1) & 7;
}

- (void)setLiveTransformKind:(unint64_t)a3
{
  int flags = (int)self->_flags;
  p_int flags = &self->_flags;
  __int16 v5 = *((_WORD *)p_flags + 2);
  *((unsigned char *)p_flags + 6) = *((unsigned char *)p_flags + 6);
  *((_WORD *)p_flags + 2) = v5;
  *(_DWORD *)p_int flags = flags & 0xFFF8FFFF | ((a3 & 7) << 16);
}

- (unint64_t)anchorPosition
{
  return ((unint64_t)*(_DWORD *)&self->_flags >> 21) & 7;
}

- (void)setAnchorPosition:(unint64_t)a3
{
  int flags = (int)self->_flags;
  p_int flags = &self->_flags;
  __int16 v5 = *((_WORD *)p_flags + 2);
  *((unsigned char *)p_flags + 6) = *((unsigned char *)p_flags + 6);
  *((_WORD *)p_flags + 2) = v5;
  *(_DWORD *)p_int flags = flags & 0xFF1FFFFF | ((a3 & 7) << 21);
}

- (BOOL)axHasNonDefaultAttributess
{
  if ((((unint64_t)(*((unsigned __int16 *)&self->_flags + 2) | (*((unsigned __int8 *)&self->_flags + 6) << 16)) << 32) & 0x3FE0000000000) != 0) {
    return 1;
  }
  p_storage = &self->_storage;
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0xEu);
  if (ObjectForKey)
  {
    char v2 = 1;
  }
  else
  {
    __int16 v5 = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)p_storage, 0x1Eu);
    if (v5)
    {
      char v2 = 1;
    }
    else
    {
      int v6 = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)p_storage, 0x20u);
      char v2 = v6 != 0;
    }
  }

  return v2;
}

- (void)setAxDisabled:(BOOL)a3
{
  unsigned int flags = self->_flags;
  p_unsigned int flags = &self->_flags;
  int v5 = *((unsigned __int8 *)p_flags + 6);
  unint64_t v6 = flags | ((unint64_t)(*((unsigned __int16 *)p_flags + 2) | (v5 << 16)) << 32);
  __int16 v7 = 512;
  if (!a3) {
    __int16 v7 = 0;
  }
  unint64_t v8 = v6 & 0xFFFFFDFFFFFFFFFFLL;
  *((unsigned char *)p_flags + 6) = v5;
  *(_DWORD *)p_unsigned int flags = v8;
  *((_WORD *)p_flags + 2) = WORD2(v8) | v7;
}

- (BOOL)axDisabled
{
  return (*((unsigned __int16 *)&self->_flags + 2) >> 9) & 1;
}

- (void)setAXElement:(BOOL)a3
{
  unsigned int flags = self->_flags;
  p_unsigned int flags = &self->_flags;
  int v5 = *((unsigned __int8 *)p_flags + 6);
  unint64_t v6 = flags | ((unint64_t)(*((unsigned __int16 *)p_flags + 2) | (v5 << 16)) << 32);
  __int16 v7 = 1024;
  if (!a3) {
    __int16 v7 = 0;
  }
  unint64_t v8 = v6 & 0xFFFFFBFFFFFFFFFFLL;
  *((unsigned char *)p_flags + 6) = v5;
  *(_DWORD *)p_unsigned int flags = v8;
  *((_WORD *)p_flags + 2) = WORD2(v8) | v7;
}

- (BOOL)isAXElement
{
  return (*((unsigned __int16 *)&self->_flags + 2) >> 10) & 1;
}

- (void)setAxTouchContainer:(BOOL)a3
{
  unsigned int flags = self->_flags;
  p_unsigned int flags = &self->_flags;
  int v5 = *((unsigned __int8 *)p_flags + 6);
  unint64_t v6 = flags | ((unint64_t)(*((unsigned __int16 *)p_flags + 2) | (v5 << 16)) << 32);
  __int16 v7 = 2048;
  if (!a3) {
    __int16 v7 = 0;
  }
  unint64_t v8 = v6 & 0xFFFFF7FFFFFFFFFFLL;
  *((unsigned char *)p_flags + 6) = v5;
  *(_DWORD *)p_unsigned int flags = v8;
  *((_WORD *)p_flags + 2) = WORD2(v8) | v7;
}

- (BOOL)axTouchContainer
{
  return (*((unsigned __int16 *)&self->_flags + 2) >> 11) & 1;
}

- (void)setAxButton:(BOOL)a3
{
  unsigned int flags = self->_flags;
  p_unsigned int flags = &self->_flags;
  int v5 = *((unsigned __int8 *)p_flags + 6);
  unint64_t v6 = flags | ((unint64_t)(*((unsigned __int16 *)p_flags + 2) | (v5 << 16)) << 32);
  __int16 v7 = 4096;
  if (!a3) {
    __int16 v7 = 0;
  }
  unint64_t v8 = v6 & 0xFFFFEFFFFFFFFFFFLL;
  *((unsigned char *)p_flags + 6) = v5;
  *(_DWORD *)p_unsigned int flags = v8;
  *((_WORD *)p_flags + 2) = WORD2(v8) | v7;
}

- (BOOL)axButton
{
  return (*((unsigned __int16 *)&self->_flags + 2) >> 12) & 1;
}

- (void)setAxImage:(BOOL)a3
{
  unsigned int flags = self->_flags;
  p_unsigned int flags = &self->_flags;
  int v5 = *((unsigned __int8 *)p_flags + 6);
  unint64_t v6 = flags | ((unint64_t)(*((unsigned __int16 *)p_flags + 2) | (v5 << 16)) << 32);
  __int16 v7 = 0x2000;
  if (!a3) {
    __int16 v7 = 0;
  }
  unint64_t v8 = v6 & 0xFFFFDFFFFFFFFFFFLL;
  *((unsigned char *)p_flags + 6) = v5;
  *(_DWORD *)p_unsigned int flags = v8;
  *((_WORD *)p_flags + 2) = WORD2(v8) | v7;
}

- (BOOL)axImage
{
  return (*((unsigned __int16 *)&self->_flags + 2) >> 13) & 1;
}

- (void)setAxHeading:(BOOL)a3
{
  unsigned int flags = self->_flags;
  p_unsigned int flags = &self->_flags;
  int v5 = *((unsigned __int8 *)p_flags + 6);
  unint64_t v6 = flags | ((unint64_t)(*((unsigned __int16 *)p_flags + 2) | (v5 << 16)) << 32);
  __int16 v7 = 0x4000;
  if (!a3) {
    __int16 v7 = 0;
  }
  unint64_t v8 = v6 & 0xFFFFBFFFFFFFFFFFLL;
  *((unsigned char *)p_flags + 6) = v5;
  *(_DWORD *)p_unsigned int flags = v8;
  *((_WORD *)p_flags + 2) = WORD2(v8) | v7;
}

- (BOOL)axHeading
{
  return (*((unsigned __int16 *)&self->_flags + 2) >> 14) & 1;
}

- (void)setAxAdjustable:(BOOL)a3
{
  unsigned int flags = self->_flags;
  p_unsigned int flags = &self->_flags;
  int v5 = *((unsigned __int8 *)p_flags + 6);
  unint64_t v6 = flags | ((unint64_t)(*((unsigned __int16 *)p_flags + 2) | (v5 << 16)) << 32);
  __int16 v7 = 0x8000;
  if (!a3) {
    __int16 v7 = 0;
  }
  unint64_t v8 = v6 & 0xFFFF7FFFFFFFFFFFLL;
  *((unsigned char *)p_flags + 6) = v5;
  *(_DWORD *)p_unsigned int flags = v8;
  *((_WORD *)p_flags + 2) = WORD2(v8) | v7;
}

- (BOOL)axAdjustable
{
  return *((unsigned __int16 *)&self->_flags + 2) >> 15;
}

- (void)setAxToggle:(BOOL)a3
{
  unsigned int flags = self->_flags;
  p_unsigned int flags = &self->_flags;
  uint64_t v5 = *((unsigned __int16 *)p_flags + 2) | (*((unsigned __int8 *)p_flags + 6) << 16);
  *((_WORD *)p_flags + 2) = *((_WORD *)p_flags + 2);
  *(_DWORD *)p_unsigned int flags = flags;
  *((unsigned char *)p_flags + 6) = (((flags | (unint64_t)(v5 << 32)) & 0xFFFEFFFFFFFFFFFFLL) >> 48) | a3;
}

- (BOOL)axToggle
{
  return *((unsigned char *)&self->_flags + 6) & 1;
}

- (void)setAxStaticText:(BOOL)a3
{
  unsigned int flags = self->_flags;
  p_unsigned int flags = &self->_flags;
  unint64_t v5 = flags | ((unint64_t)(*((unsigned __int16 *)p_flags + 2) | (*((unsigned __int8 *)p_flags + 6) << 16)) << 32);
  char v6 = 2;
  if (!a3) {
    char v6 = 0;
  }
  unint64_t v7 = v5 & 0xFFFDFFFFFFFFFFFFLL;
  *((_WORD *)p_flags + 2) = *((_WORD *)p_flags + 2);
  *(_DWORD *)p_unsigned int flags = v7;
  *((unsigned char *)p_flags + 6) = BYTE6(v7) | v6;
}

- (BOOL)axStaticText
{
  return (*((unsigned __int8 *)&self->_flags + 6) >> 1) & 1;
}

- (void)setGrouped:(BOOL)a3
{
  unsigned int flags = self->_flags;
  p_unsigned int flags = &self->_flags;
  unint64_t v5 = flags | ((unint64_t)(*((unsigned __int16 *)p_flags + 2) | (*((unsigned __int8 *)p_flags + 6) << 16)) << 32);
  char v6 = 8;
  if (!a3) {
    char v6 = 0;
  }
  unint64_t v7 = v5 & 0xFFF7FFFFFFFFFFFFLL;
  *((_WORD *)p_flags + 2) = *((_WORD *)p_flags + 2);
  *(_DWORD *)p_unsigned int flags = v7;
  *((unsigned char *)p_flags + 6) = BYTE6(v7) | v6;
}

- (BOOL)grouped
{
  return (*((unsigned __int8 *)&self->_flags + 6) >> 3) & 1;
}

- (Class)layoutClass
{
  return 0;
}

- (void)_compressStorage
{
}

- (TUIDynamicArrayWindowing)dynamicArrayWindowingBox
{
  return 0;
}

+ (int64_t)textAlignmentFromString:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (qword_2DFAE0 == -1)
  {
    if (v3) {
      goto LABEL_3;
    }
LABEL_6:
    char v6 = 0;
    goto LABEL_7;
  }
  dispatch_once(&qword_2DFAE0, &stru_257570);
  if (!v4) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v5 = [(id)qword_2DFAD8 objectForKeyedSubscript:v4];
  char v6 = v5;
  if (!v5)
  {
LABEL_7:
    id v7 = &dword_4;
    goto LABEL_8;
  }
  id v7 = [v5 integerValue];
LABEL_8:

  return (int64_t)v7;
}

+ (unint64_t)halignFromString:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (qword_2DFAF0 != -1)
  {
    dispatch_once(&qword_2DFAF0, &stru_257590);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v5 = [(id)qword_2DFAE8 objectForKeyedSubscript:v4];
  id v6 = [v5 unsignedIntegerValue];

LABEL_6:
  return (unint64_t)v6;
}

+ (unint64_t)valignFromString:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (qword_2DFB00 != -1)
  {
    dispatch_once(&qword_2DFB00, &stru_2575B0);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v5 = [(id)qword_2DFAF8 objectForKeyedSubscript:v4];
  id v6 = [v5 unsignedIntegerValue];

LABEL_6:
  return (unint64_t)v6;
}

+ (unint64_t)anchorPositionFromString:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (qword_2DFB10 != -1)
  {
    dispatch_once(&qword_2DFB10, &stru_2575D0);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v5 = [(id)qword_2DFB08 objectForKeyedSubscript:v4];
  id v6 = [v5 unsignedIntegerValue];

LABEL_6:
  return (unint64_t)v6;
}

+ (unint64_t)compressedFromString:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (qword_2DFB20 != -1)
  {
    dispatch_once(&qword_2DFB20, &stru_2575F0);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v5 = [(id)qword_2DFB18 objectForKeyedSubscript:v4];
  id v6 = [v5 unsignedIntegerValue];

LABEL_6:
  return (unint64_t)v6;
}

+ (unint64_t)renderModelFromString:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (qword_2DFB30 != -1)
  {
    dispatch_once(&qword_2DFB30, &stru_257610);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v5 = [(id)qword_2DFB28 objectForKeyedSubscript:v4];
  id v6 = [v5 unsignedIntegerValue];

LABEL_6:
  return (unint64_t)v6;
}

+ (unint64_t)triggerStateFromString:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (qword_2DFB40 != -1)
  {
    dispatch_once(&qword_2DFB40, &stru_257630);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v5 = [(id)qword_2DFB38 objectForKeyedSubscript:v4];
  id v6 = [v5 unsignedIntegerValue];

LABEL_6:
  return (unint64_t)v6;
}

+ (id)blendModeFromString:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (qword_2DFB50 == -1)
  {
    if (v3)
    {
LABEL_3:
      unint64_t v5 = [(id)qword_2DFB48 objectForKeyedSubscript:v4];
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&qword_2DFB50, &stru_257650);
    if (v4) {
      goto LABEL_3;
    }
  }
  unint64_t v5 = 0;
LABEL_6:

  return v5;
}

+ (unint64_t)interfaceLayoutDirectionFromString:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (qword_2DFB60 != -1)
  {
    dispatch_once(&qword_2DFB60, &stru_257670);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v5 = [(id)qword_2DFB58 objectForKeyedSubscript:v4];
  id v6 = [v5 unsignedIntegerValue];

LABEL_6:
  return (unint64_t)v6;
}

+ (unint64_t)layoutModeFromString:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (qword_2DFB70 != -1)
  {
    dispatch_once(&qword_2DFB70, &stru_257690);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v5 = [(id)qword_2DFB68 objectForKeyedSubscript:v4];
  id v6 = [v5 unsignedIntegerValue];

LABEL_6:
  return (unint64_t)v6;
}

+ (unint64_t)defaultRole
{
  return 0;
}

+ (unint64_t)roleFromString:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (qword_2DFB80 != -1)
  {
    dispatch_once(&qword_2DFB80, &stru_2576B0);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v5 = [(id)qword_2DFB78 objectForKeyedSubscript:v4];
  id v6 = [v5 unsignedIntegerValue];

LABEL_6:
  return (unint64_t)v6;
}

+ (unint64_t)liveTransformFromString:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (qword_2DFB90 != -1)
  {
    dispatch_once(&qword_2DFB90, &stru_2576D0);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v5 = [(id)qword_2DFB88 objectForKeyedSubscript:v4];
  id v6 = [v5 unsignedIntegerValue];

LABEL_6:
  return (unint64_t)v6;
}

+ (id)layerContentsGravityFromString:(id)a3
{
  id v3 = a3;
  if (qword_2DFBA0 != -1) {
    dispatch_once(&qword_2DFBA0, &stru_2576F0);
  }
  double v4 = kCAGravityResize;
  if (v3
    && ([(id)qword_2DFB98 objectForKeyedSubscript:v3],
        (unint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = v5;

    double v4 = v6;
  }
  else
  {
    id v6 = 0;
  }

  return v4;
}

+ (int64_t)imageRenderingModeFromString:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (qword_2DFBB0 != -1)
  {
    dispatch_once(&qword_2DFBB0, &stru_257710);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v5 = [(id)qword_2DFBA8 objectForKeyedSubscript:v4];
  id v6 = [v5 integerValue];

LABEL_6:
  return (int64_t)v6;
}

+ (id)videoGravityFromString:(id)a3
{
  id v3 = a3;
  if (qword_2DFBC0 != -1) {
    dispatch_once(&qword_2DFBC0, &stru_257730);
  }
  double v4 = AVLayerVideoGravityResizeAspect;
  if (v3
    && ([(id)qword_2DFBB8 objectForKeyedSubscript:v3],
        (unint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = v5;

    double v4 = v6;
  }
  else
  {
    id v6 = 0;
  }

  return v4;
}

+ (unint64_t)axisFromString:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (qword_2DFBD0 != -1)
  {
    dispatch_once(&qword_2DFBD0, &stru_257750);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v5 = [(id)qword_2DFBC8 objectForKeyedSubscript:v4];
  id v6 = [v5 unsignedIntegerValue];

LABEL_6:
  return (unint64_t)v6;
}

+ (unint64_t)userInterfaceStyleFromString:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (qword_2DFBE0 != -1)
  {
    dispatch_once(&qword_2DFBE0, &stru_257770);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v5 = [(id)qword_2DFBD8 objectForKeyedSubscript:v4];
  id v6 = [v5 unsignedIntegerValue];

LABEL_6:
  return (unint64_t)v6;
}

- (NSString)description
{
  id v3 = (objc_class *)objc_opt_class();
  double v4 = NSStringFromClass(v3);
  unint64_t v5 = [(TUIBox *)self width];
  id v7 = TUILengthDescription((uint64_t)v5, v6);
  unint64_t v8 = [(TUIBox *)self height];
  uint64_t v10 = TUILengthDescription((uint64_t)v8, v9);
  uint64_t v11 = +[NSMutableString stringWithFormat:@"<%@ %p w=%@ h=%@ anchor-position=%lu", v4, self, v7, v10, [(TUIBox *)self anchorPosition]];

  [(TUIBox *)self appendBoxDescription:v11];
  uint64_t v12 = TUIProtocolCast(&OBJC_PROTOCOL___TUIModelContaining, self);
  uint64_t v13 = objc_opt_new();
  [v12 appendContainedChildrenToArray:v13];
  if ([v13 count])
  {
    [v11 appendFormat:@" children=["];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v14 = v13;
    id v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v21;
      uint64_t v17 = "";
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v14);
          }
          [v11 appendFormat:@"%s%@", v17, *(void *)(*((void *)&v20 + 1) + 8 * i)];
          uint64_t v17 = ", ";
        }
        id v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
        uint64_t v17 = ", ";
      }
      while (v15);
    }

    [v11 appendFormat:@"]"];
  }
  [v11 appendFormat:@">"];

  return (NSString *)v11;
}

- (TUIModelContaining)parentModel
{
  WeakRetainefloat d = objc_loadWeakRetained((id *)&self->_parentModel);

  return (TUIModelContaining *)WeakRetained;
}

- (void)setParentModel:(id)a3
{
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)axIdentifier
{
  return self->_axIdentifier;
}

- (void)setAxIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_parentModel);

  TUI::Util::PartialStruct::Storage::~Storage((TUI::Util::PartialStruct::Storage::Header **)&self->_storage);
}

- (id).cxx_construct
{
  self->_storage._datfloat a = 0;
  TUI::Box::Flags::Flags((unsigned int *)&self->_flags);
  return self;
}

@end