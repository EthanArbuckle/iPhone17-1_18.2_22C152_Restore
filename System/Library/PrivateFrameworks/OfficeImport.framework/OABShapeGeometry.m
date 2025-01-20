@interface OABShapeGeometry
+ (EshComputedValue)computedValueWithAdjustCoord:(OADAdjustCoord)a3;
+ (OADAdjustCoord)adjustCoordWithComputedValue:(EshComputedValue)a3;
+ (int)actualPathCommandForPathCommand:(int)a3 index:(unsigned __int16)a4;
+ (void)appendAdjustPoint:(OADAdjustPoint)a3 toPathParams:(void *)a4;
+ (void)readAdjustValuesFromShapeProperties:(const EshShapeProperties *)a3 toGeometry:(id)a4;
+ (void)readFromFormulas:(const void *)a3 toGeometry:(id)a4;
+ (void)readFromLimo:(CsPoint<int>)a3 toGeometry:(id)a4;
+ (void)readFromPathCommands:(const void *)a3 pathParams:(const void *)a4 toGeometry:(id)a5;
+ (void)readFromShape:(void *)a3 toShape:(id)a4;
+ (void)readFromTextBoxRects:(const void *)a3 toGeometry:(id)a4;
+ (void)readGeometryCoordSpaceFromShapeProperties:(const EshShapeProperties *)a3 toGeometry:(id)a4;
+ (void)readLimoFromPath:(const EshPath *)a3 toGeometry:(id)a4;
+ (void)readPathCommandsAndParamsFromPath:(const EshPath *)a3 toGeometry:(id)a4;
+ (void)writeAdjustValuesFromGeometry:(id)a3 toShapeProperties:(EshShapeProperties *)a4;
+ (void)writeCoordSpaceFromGeometry:(id)a3 toShape:(void *)a4;
+ (void)writeFormulasFromGeometry:(id)a3 toPath:(EshPath *)a4;
+ (void)writeFromShape:(id)a3 toShape:(void *)a4;
+ (void)writeLimoFromGeometry:(id)a3 toPath:(EshPath *)a4;
+ (void)writePathCommandsAndParamsFromGeometry:(id)a3 toPath:(EshPath *)a4;
+ (void)writeTextBodyRectsFromGeometry:(id)a3 toPath:(EshPath *)a4;
@end

@implementation OABShapeGeometry

+ (void)readFromShape:(void *)a3 toShape:(id)a4
{
  id v6 = a4;
  v7 = (EshShapeProperties *)((char *)a3 + 424);
  unsigned int ShapeType = EshShapeProperties::getShapeType((EshShapeProperties *)((char *)a3 + 424));
  v9 = (EshPath *)((char *)a3 + 528);
  if (ShapeType == 100) {
    uint64_t v10 = 99;
  }
  else {
    uint64_t v10 = ShapeType;
  }
  if ((EshPath::isParamsSet(v9) & 1) != 0
    || (EshPath::isCommandsSet(v9) & 1) != 0
    || ((char isPathTypeSet = EshPath::isPathTypeSet(v9), v10 != 20) ? (v12 = isPathTypeSet) : (v12 = 0),
        (v12 & 1) != 0
     || (EshPath::isFormulasSet(v9) & 1) != 0
     || (EshPath::isTextBoxRectsSet(v9) & 1) != 0
     || (EshPath::isLimoXSet(v9) & 1) != 0
     || (EshPath::isLimoYSet(v9) & 1) != 0
     || (EshShapeProperties::isCoordLeftSet(v7) & 1) != 0
     || (EshShapeProperties::isCoordTopSet(v7) & 1) != 0
     || (EshShapeProperties::isCoordRightSet(v7) & 1) != 0))
  {
    int isCoordBottomSet = 1;
    if (!v10) {
      goto LABEL_51;
    }
  }
  else
  {
    int isCoordBottomSet = EshShapeProperties::isCoordBottomSet(v7);
    if (!v10) {
      goto LABEL_51;
    }
  }
  if (isCoordBottomSet)
  {
    EshGeometryProperties::EshGeometryProperties((EshGeometryProperties *)&v32);
    if (EshShapeLib::cloneShapeProperties((EshShapeLib *)(unsigned __int16)v10, &v32, v14))
    {
      EshGeometryProperties::addImpliedSegments(&v32);
      if ((EshPath::isParamsSet(v9) & 1) == 0)
      {
        uint64_t Vertices = EshGeometryProperties::getVertices((EshGeometryProperties *)&v32);
        v16 = (EshPathParamTable *)(*(uint64_t (**)(uint64_t))(*(void *)Vertices + 16))(Vertices);
        EshPath::takeParams(v9, v16);
      }
      if ((EshPath::isCommandsSet(v9) & 1) == 0
        && (!EshPath::isPathTypeSet(v9) || EshPath::getPathType(v9) == 4)
        && EshGeometryProperties::getSegments((EshGeometryProperties *)&v32))
      {
        uint64_t Segments = EshGeometryProperties::getSegments((EshGeometryProperties *)&v32);
        v18 = (uint64_t *)(*(uint64_t (**)(uint64_t))(*(void *)Segments + 16))(Segments);
        EshPath::takeCommands((uint64_t)v9, v18);
      }
      if ((EshPath::isFormulasSet(v9) & 1) == 0)
      {
        uint64_t Formulas = EshGeometryProperties::getFormulas((EshGeometryProperties *)&v32);
        v20 = (uint64_t *)(*(uint64_t (**)(uint64_t))(*(void *)Formulas + 16))(Formulas);
        EshPath::takeFormulas((uint64_t)v9, v20);
      }
      if ((EshPath::isTextBoxRectsSet(v9) & 1) == 0
        && EshGeometryProperties::isInscribesSet((EshGeometryProperties *)&v32))
      {
        uint64_t Inscribes = EshGeometryProperties::getInscribes((EshGeometryProperties *)&v32);
        v22 = (uint64_t *)(*(uint64_t (**)(uint64_t))(*(void *)Inscribes + 16))(Inscribes);
        EshPath::takeTextBoxRects((uint64_t)v9, v22);
      }
      if ((EshPath::isLimoXSet(v9) & 1) == 0 && v38 != 0x7FFFFFFF) {
        EshPath::setLimoX(v9, v38);
      }
      if ((EshPath::isLimoYSet(v9) & 1) == 0 && v39 != 0x7FFFFFFF) {
        EshPath::setLimoY(v9, v39);
      }
      unsigned int v24 = v33;
      unsigned int v23 = v34;
      unsigned int v26 = v35;
      unsigned int v25 = v36;
      if ((EshShapeProperties::isCoordLeftSet(v7) & 1) == 0) {
        EshShapeProperties::setCoordLeft(v7, v24);
      }
      if ((EshShapeProperties::isCoordTopSet(v7) & 1) == 0) {
        EshShapeProperties::setCoordTop(v7, v23);
      }
      if ((EshShapeProperties::isCoordRightSet(v7) & 1) == 0) {
        EshShapeProperties::setCoordRight(v7, v26);
      }
      if ((EshShapeProperties::isCoordBottomSet(v7) & 1) == 0) {
        EshShapeProperties::setCoordBottom(v7, v25);
      }
      for (uint64_t i = 0; i != 10; ++i)
      {
        if ((EshShapeProperties::isAdjSet(v7, (unsigned __int16)i) & 1) == 0) {
          EshShapeProperties::setAdj(v7, (unsigned __int16)i, v37[i]);
        }
      }
    }
    EshGeometryProperties::~EshGeometryProperties((EshGeometryProperties *)&v32);
  }
LABEL_51:
  if (v10) {
    char v28 = isCoordBottomSet;
  }
  else {
    char v28 = 1;
  }
  if (v28)
  {
    v29 = objc_alloc_init(OADCustomShapeGeometry);
    [(OADShapeGeometry *)v29 setIsEscher:1];
    [v6 setGeometry:v29];
    [a1 readAdjustValuesFromShapeProperties:v7 toGeometry:v29];
    [a1 readGeometryCoordSpaceFromShapeProperties:v7 toGeometry:v29];
    [a1 readLimoFromPath:v9 toGeometry:v29];
    if (EshPath::isFormulasSet(v9))
    {
      v30 = EshPath::getFormulas(v9);
      if (v30) {
        [a1 readFromFormulas:v30 toGeometry:v29];
      }
    }
    if (EshPath::isTextBoxRectsSet(v9))
    {
      TextBoxRects = EshPath::getTextBoxRects(v9);
      if (TextBoxRects) {
        [a1 readFromTextBoxRects:TextBoxRects toGeometry:v29];
      }
    }
    [a1 readPathCommandsAndParamsFromPath:v9 toGeometry:v29];
  }
  else
  {
    v29 = objc_alloc_init(OADPresetShapeGeometry);
    [(OADShapeGeometry *)v29 setIsEscher:1];
    [v6 setGeometry:v29];
    [(OADCustomShapeGeometry *)v29 setType:v10];
    [a1 readAdjustValuesFromShapeProperties:v7 toGeometry:v29];
  }
}

+ (void)readAdjustValuesFromShapeProperties:(const EshShapeProperties *)a3 toGeometry:(id)a4
{
  id v6 = a4;
  uint64_t v5 = 0;
  do
  {
    if (EshShapeProperties::isAdjSet((EshShapeProperties *)a3, (unsigned __int16)v5)) {
      objc_msgSend(v6, "setAdjustValue:atIndex:", EshShapeProperties::getAdj((EshShapeProperties *)a3, (unsigned __int16)v5), v5);
    }
    uint64_t v5 = (v5 + 1);
  }
  while (v5 != 10);
}

+ (void)readFromPathCommands:(const void *)a3 pathParams:(const void *)a4 toGeometry:(id)a5
{
  id v43 = a5;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x2020000000;
  int v54 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__OABShapeGeometry_readFromPathCommands_pathParams_toGeometry___block_invoke;
  aBlock[3] = &unk_264D626A0;
  aBlock[4] = v53;
  aBlock[5] = a4;
  id v49 = a1;
  aBlock[6] = a1;
  v8 = (uint64_t (**)(void))_Block_copy(aBlock);
  v9 = objc_alloc_init(OADPath);
  if (((*((void *)a3 + 2) - *((void *)a3 + 1)) & 0x7FFFFFFF8) != 0)
  {
    unsigned int v10 = 0;
    v44 = a3;
    v48 = 0;
    v46 = v8;
    do
    {
      unsigned int v45 = v10;
      v11 = (_WORD *)EshBasicTablePropVal<EshComputedValue>::operator[]((uint64_t)a3, v10);
      v51 = v9;
      if (*v11)
      {
        char v12 = v11;
        unsigned __int16 v13 = 0;
        v50 = v11;
        do
        {
          int v14 = [v49 actualPathCommandForPathCommand:*((unsigned int *)v12 + 1) index:v13];
          switch(v14)
          {
            case 0:
            case 29:
              uint64_t v27 = v8[2](v8);
              v18 = -[OADToPointPathElement initWithToPoint:]([OADLineToPathElement alloc], "initWithToPoint:", v27, v8[2](v8));
              [(OADToPointPathElement *)v18 setRelative:v14 == 29];
              [(OADPath *)v51 addElement:v18];
              goto LABEL_29;
            case 1:
            case 30:
              uint64_t v28 = v8[2](v8);
              uint64_t v29 = v8[2](v8);
              uint64_t v30 = v8[2](v8);
              uint64_t v31 = v8[2](v8);
              uint64_t v32 = v8[2](v8);
              v18 = -[OADCubicBezierToPathElement initWithControlPoint1:controlPoint2:toPoint:]([OADCubicBezierToPathElement alloc], "initWithControlPoint1:controlPoint2:toPoint:", v28, v29, v30, v31, v32, v8[2](v8));
              [(OADToPointPathElement *)v18 setRelative:v14 == 30];
              [(OADPath *)v51 addElement:v18];
              goto LABEL_29;
            case 2:
            case 28:
              uint64_t v33 = v8[2](v8);
              v18 = -[OADToPointPathElement initWithToPoint:]([OADMoveToPathElement alloc], "initWithToPoint:", v33, v8[2](v8));
              [(OADToPointPathElement *)v18 setRelative:v14 == 28];
              [(OADPath *)v51 addElement:v18];
              goto LABEL_29;
            case 3:
              v18 = objc_alloc_init(OADClosePathElement);
              [(OADPath *)v51 addElement:v18];
              goto LABEL_29;
            case 4:

              if ([(OADPath *)v51 elementCount])
              {
                [v43 addPath:v51];
                v48 = v51;
              }
              else
              {
                v48 = 0;
              }
              v18 = (OADLineToPathElement *)v51;
              v51 = objc_alloc_init(OADPath);
              goto LABEL_29;
            case 6:
            case 7:
              uint64_t v34 = v8[2](v8);
              uint64_t v35 = v8[2](v8);
              uint64_t v36 = v8[2](v8);
              uint64_t v37 = v8[2](v8);
              uint64_t v38 = v8[2](v8);
              LOBYTE(v41) = v14 == 6;
              v18 = -[OADAngleArcPathElement initWithCenter:semiaxes:startAngle:angleLength:connectedToPrevious:]([OADAngleArcPathElement alloc], "initWithCenter:semiaxes:startAngle:angleLength:connectedToPrevious:", v34, v35, v36, v37, v38, v8[2](v8), v41);
              [(OADPath *)v51 addElement:v18];
              goto LABEL_29;
            case 8:
            case 9:
            case 10:
            case 11:
              v20 = v8;
              uint64_t v21 = v8[2](v8);
              uint64_t v22 = v20[2](v20);
              uint64_t v23 = v20[2](v20);
              uint64_t v24 = v20[2](v20);
              uint64_t v47 = v20[2](v20);
              uint64_t v25 = v20[2](v20);
              uint64_t v26 = v20[2](v20);
              BYTE1(v42) = (v14 & 0xFFFFFFFD) == 8;
              LOBYTE(v42) = (v14 & 0xFFFFFFFE) == 10;
              v18 = -[OADVectorArcPathElement initWithLeft:top:right:bottom:startVector:endVector:clockwise:connectedToPrevious:]([OADVectorArcPathElement alloc], "initWithLeft:top:right:bottom:startVector:endVector:clockwise:connectedToPrevious:", v21, v22, v23, v24, v47, v25, v26, v20[2](v20), v42);
              [(OADPath *)v51 addElement:v18];
              v8 = v46;
              goto LABEL_29;
            case 12:
            case 13:
              uint64_t v39 = v8[2](v8);
              v18 = -[OADQuarterEllipseToPathElement initWithToPoint:startsVertical:]([OADQuarterEllipseToPathElement alloc], "initWithToPoint:startsVertical:", v39, v8[2](v8), v14 == 13);
              [(OADPath *)v51 addElement:v18];
              goto LABEL_29;
            case 14:
              uint64_t v40 = v8[2](v8);
              v18 = -[OADQuadBezierControlPointPathElement initWithControlPoint:]([OADQuadBezierControlPointPathElement alloc], "initWithControlPoint:", v40, v8[2](v8));
              [(OADPath *)v51 addElement:v18];
              goto LABEL_29;
            case 15:
            case 16:
            case 31:
            case 32:
            case 33:
            case 34:
            case 35:
              uint64_t v15 = [(OADPath *)v51 elementCount];
              v16 = v48;
              if (v15) {
                v16 = v51;
              }
              v17 = v16;
              v18 = v17;
              switch(v14)
              {
                case 31:
                  uint64_t v19 = 1;
                  goto LABEL_28;
                case 32:
                  uint64_t v19 = 3;
                  goto LABEL_28;
                case 33:
                  uint64_t v19 = 2;
                  goto LABEL_28;
                case 34:
                  uint64_t v19 = 5;
                  goto LABEL_28;
                case 35:
                  uint64_t v19 = 4;
                  goto LABEL_28;
                default:
                  if (v14 == 15)
                  {
                    uint64_t v19 = 0;
LABEL_28:
                    [(OADLineToPathElement *)v17 setFillMode:v19];
                  }
                  else if (v14 == 16)
                  {
                    [(OADLineToPathElement *)v17 setStroked:0];
                  }
                  break;
              }
LABEL_29:

              break;
            default:
              break;
          }
          ++v13;
          char v12 = v50;
        }
        while (*v50 > v13);
      }
      unsigned int v10 = v45 + 1;
      a3 = v44;
      v9 = v51;
    }
    while (v45 + 1 < ((v44[2] - v44[1]) >> 3));
  }
  else
  {
    v48 = 0;
  }
  if ([(OADPath *)v9 elementCount]) {
    [v43 addPath:v9];
  }

  _Block_object_dispose(v53, 8);
}

+ (int)actualPathCommandForPathCommand:(int)a3 index:(unsigned __int16)a4
{
  int result = a3;
  switch(a3)
  {
    case 7:
      if (a4) {
        int result = 6;
      }
      break;
    case 9:
      if (a4) {
        int result = 8;
      }
      break;
    case 11:
      if (a4) {
        int result = 10;
      }
      break;
    case 12:
      if (a4) {
        int result = 13;
      }
      break;
    case 13:
      if (a4) {
        int result = 12;
      }
      break;
    default:
      return result;
  }
  return result;
}

+ (OADAdjustCoord)adjustCoordWithComputedValue:(EshComputedValue)a3
{
  return (OADAdjustCoord)(*(unsigned __int8 *)a3.var0 | ((unint64_t)*(unsigned int *)(*(void *)&a3 + 4) << 32));
}

+ (void)readFromFormulas:(const void *)a3 toGeometry:(id)a4
{
  v15[3] = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (-1227133513 * ((*((void *)a3 + 2) - *((void *)a3 + 1)) >> 2))
  {
    unsigned int v6 = 0;
    do
    {
      v7 = (_DWORD *)EshBasicTablePropVal<EshFormula>::operator[]((uint64_t)a3, v6);
      uint64_t v8 = 1;
      do
      {
        v9 = &v14[v8];
        _DWORD *v9 = 0;
        *((_WORD *)v9 + 2) = 0;
        v8 += 2;
      }
      while (v9 + 2 != (_DWORD *)v15);
      EshFormula::operator=(v14, v7);
      unint64_t v10 = 0;
      uint64_t v11 = v14[0];
      do
      {
        v15[v10 / 2] = v14[v10 + 1] | ((unint64_t)LOWORD(v14[v10 + 2]) << 32);
        v10 += 2;
      }
      while (v10 != 6);
      char v12 = [OADFormula alloc];
      unsigned __int16 v13 = [(OADFormula *)v12 initWithType:v11 arg0:v15[0] arg1:v15[1] arg2:v15[2]];
      [v5 addFormula:v13];

      ++v6;
    }
    while (v6 < -1227133513 * ((*((void *)a3 + 2) - *((void *)a3 + 1)) >> 2));
  }
}

+ (void)readFromTextBoxRects:(const void *)a3 toGeometry:(id)a4
{
  id v6 = a4;
  if (((*((void *)a3 + 2) - *((void *)a3 + 1)) & 0x1FFFFFFFE0) != 0)
  {
    unsigned int v7 = 0;
    do
    {
      uint64_t v8 = (long long *)EshBasicTablePropVal<EshComputedRect>::operator[]((uint64_t)a3, v7);
      for (uint64_t i = 0; i != 32; i += 8)
      {
        unint64_t v10 = (char *)&v20 + i;
        *unint64_t v10 = 0;
        *((_DWORD *)v10 + 1) = 0;
      }
      long long v11 = v8[1];
      long long v20 = *v8;
      long long v21 = v11;
      uint64_t v19 = v20;
      uint64_t v12 = [a1 adjustCoordWithComputedValue:&v19];
      uint64_t v18 = *((void *)&v20 + 1);
      uint64_t v13 = [a1 adjustCoordWithComputedValue:&v18];
      uint64_t v17 = v21;
      uint64_t v14 = [a1 adjustCoordWithComputedValue:&v17];
      uint64_t v16 = *((void *)&v21 + 1);
      uint64_t v15 = -[OADAdjustRect initWithLeft:top:right:bottom:]([OADAdjustRect alloc], "initWithLeft:top:right:bottom:", v12, v13, v14, [a1 adjustCoordWithComputedValue:&v16]);
      [v6 addTextBodyRect:v15];

      ++v7;
    }
    while (v7 < ((*((void *)a3 + 2) - *((void *)a3 + 1)) >> 5));
  }
}

+ (void)readFromLimo:(CsPoint<int>)a3 toGeometry:(id)a4
{
  uint64_t v4 = **(void **)&a3;
  [a4 setLimo:&v4];
}

+ (void)readGeometryCoordSpaceFromShapeProperties:(const EshShapeProperties *)a3 toGeometry:(id)a4
{
  id v5 = a4;
  isCoordLeftSet = (EshContentProperties *)EshShapeProperties::isCoordLeftSet((EshShapeProperties *)a3);
  if (isCoordLeftSet) {
    int CoordLeft = EshShapeProperties::getCoordLeft((EshShapeProperties *)a3);
  }
  else {
    int CoordLeft = EshContentProperties::getDefaultPositionHorizontal(isCoordLeftSet);
  }
  int v8 = CoordLeft;
  isCoordTopSet = (EshContentProperties *)EshShapeProperties::isCoordTopSet((EshShapeProperties *)a3);
  if (isCoordTopSet) {
    int CoordTop = EshShapeProperties::getCoordTop((EshShapeProperties *)a3);
  }
  else {
    int CoordTop = EshContentProperties::getDefaultPositionHorizontal(isCoordTopSet);
  }
  int v11 = CoordTop;
  isCoordRightSet = (EshShapeProperties *)EshShapeProperties::isCoordRightSet((EshShapeProperties *)a3);
  if (isCoordRightSet) {
    int CoordRight = EshShapeProperties::getCoordRight((EshShapeProperties *)a3);
  }
  else {
    int CoordRight = EshShapeProperties::getDefaultCoordRight(isCoordRightSet);
  }
  int v14 = CoordRight;
  int isCoordBottomSet = (EshShapeProperties *)EshShapeProperties::isCoordBottomSet((EshShapeProperties *)a3);
  if (isCoordBottomSet) {
    int CoordBottom = EshShapeProperties::getCoordBottom((EshShapeProperties *)a3);
  }
  else {
    int CoordBottom = EshShapeProperties::getDefaultCoordRight(isCoordBottomSet);
  }
  v17[0] = v8;
  v17[1] = v11;
  v17[2] = v14;
  v17[3] = CoordBottom;
  [v5 setGeometryCoordSpace:v17];
}

+ (void)readLimoFromPath:(const EshPath *)a3 toGeometry:(id)a4
{
  id v6 = a4;
  isLimoXSet = (EshPath *)EshPath::isLimoXSet((EshPath *)a3);
  if (isLimoXSet) {
    int LimoX = EshPath::getLimoX((EshPath *)a3);
  }
  else {
    int LimoX = EshPath::getDefaultLimoX(isLimoXSet);
  }
  int v9 = LimoX;
  isLimoYSet = (EshPath *)EshPath::isLimoYSet((EshPath *)a3);
  if (isLimoYSet) {
    int LimoY = EshPath::getLimoY((EshPath *)a3);
  }
  else {
    int LimoY = EshPath::getDefaultLimoX(isLimoYSet);
  }
  v12[0] = v9;
  v12[1] = LimoY;
  [a1 readFromLimo:v12 toGeometry:v6];
}

+ (void)readPathCommandsAndParamsFromPath:(const EshPath *)a3 toGeometry:(id)a4
{
  id v12 = a4;
  if (EshPath::isParamsSet((EshPath *)a3))
  {
    Params = EshPath::getParams((EshPath *)a3);
    unsigned int v7 = Params;
    if (Params)
    {
      if (((Params[2] - Params[1]) & 0x7FFFFFFF8) != 0)
      {
        if (EshPath::isCommandsSet((EshPath *)a3)
          && (Commands = EshPath::getCommands((EshPath *)a3)) != 0)
        {
          int v9 = 0;
        }
        else
        {
          Commands = operator new(0x20uLL);
          Commands[1] = 0;
          Commands[2] = 0;
          Commands[3] = 0;
          void *Commands = &unk_26EBD6288;
          char isPathTypeSet = (EshContentProperties *)EshPath::isPathTypeSet((EshPath *)a3);
          __int16 v11 = isPathTypeSet
              ? EshPath::getPathType((EshPath *)a3)
              : EshContentProperties::getDefaultAllowOverlap(isPathTypeSet);
          EshGeometryProperties::generateImpliedPath((unsigned __int16)((*((_DWORD *)v7 + 4) - *((_DWORD *)v7 + 2)) >> 3), v11, (uint64_t)Commands);
          int v9 = Commands;
        }
        [a1 readFromPathCommands:Commands pathParams:v7 toGeometry:v12];
        if (v9) {
          (*(void (**)(void *))(*v9 + 8))(v9);
        }
      }
    }
  }
}

uint64_t __63__OABShapeGeometry_readFromPathCommands_pathParams_toGeometry___block_invoke(void *a1)
{
  uint64_t v3 = a1[4];
  uint64_t v2 = a1[5];
  unsigned int v4 = *(_DWORD *)(*(void *)(v3 + 8) + 24);
  if (v4 >= ((*(void *)(v2 + 16) - *(void *)(v2 + 8)) >> 3))
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF578] format:@"not enough parameters"];
    uint64_t v2 = a1[5];
    unsigned int v4 = *(_DWORD *)(*(void *)(a1[4] + 8) + 24);
  }
  id v5 = (void *)a1[6];
  uint64_t v7 = *(void *)EshBasicTablePropVal<EshComputedValue>::operator[](v2, v4);
  uint64_t result = [v5 adjustCoordWithComputedValue:&v7];
  ++*(_DWORD *)(*(void *)(a1[4] + 8) + 24);
  return result;
}

+ (EshComputedValue)computedValueWithAdjustCoord:(OADAdjustCoord)a3
{
  *(unsigned char *)uint64_t v3 = a3.isFormulaResult;
  *(_DWORD *)(v3 + 4) = a3.value;
  return (EshComputedValue)a1;
}

+ (void)writeAdjustValuesFromGeometry:(id)a3 toShapeProperties:(EshShapeProperties *)a4
{
  id v6 = a3;
  uint64_t v5 = 0;
  do
  {
    if ([v6 hasAdjustValueAtIndex:v5]) {
      EshShapeProperties::setAdj(a4, (unsigned __int16)v5, [v6 adjustValueAtIndex:v5]);
    }
    uint64_t v5 = (v5 + 1);
  }
  while (v5 != 10);
}

+ (void)writeCoordSpaceFromGeometry:(id)a3 toShape:(void *)a4
{
  id v5 = a3;
  id v6 = (EshContentProperties *)[v5 isEscher];
  if (v6)
  {
    if (v5)
    {
      id v6 = (EshContentProperties *)[v5 geometryCoordSpace];
      int v7 = v11[0];
    }
    else
    {
      int v7 = 0;
      *(void *)__int16 v11 = 0;
      *(void *)id v12 = 0;
    }
    DefaultPositionHorizontal = (EshContentProperties *)EshContentProperties::getDefaultPositionHorizontal(v6);
    if (v7 != DefaultPositionHorizontal) {
      EshShapeProperties::setCoordLeft((EshShapeProperties *)((char *)a4 + 424), v11[0]);
    }
    int v9 = (EshShapeProperties *)EshContentProperties::getDefaultPositionHorizontal(DefaultPositionHorizontal);
    if (v11[1] != v9) {
      EshShapeProperties::setCoordTop((EshShapeProperties *)((char *)a4 + 424), v11[1]);
    }
    Defaultint CoordRight = (EshShapeProperties *)EshShapeProperties::getDefaultCoordRight(v9);
    if (v12[0] != DefaultCoordRight) {
      EshShapeProperties::setCoordRight((EshShapeProperties *)((char *)a4 + 424), v12[0]);
    }
    if (v12[1] != EshShapeProperties::getDefaultCoordRight(DefaultCoordRight)) {
      EshShapeProperties::setCoordBottom((EshShapeProperties *)((char *)a4 + 424), v12[1]);
    }
    operator new();
  }
}

+ (void)writeLimoFromGeometry:(id)a3 toPath:(EshPath *)a4
{
  id v5 = a3;
  id v6 = (EshPath *)[v5 isEscher];
  if (v6)
  {
    if (v5)
    {
      id v6 = (EshPath *)[v5 limo];
      int v7 = v19[0];
    }
    else
    {
      int v7 = 0;
      *(void *)uint64_t v19 = 0;
    }
    Defaultint LimoX = (EshPath *)EshPath::getDefaultLimoX(v6);
    if (v7 != DefaultLimoX) {
      EshPath::setLimoX(a4, v19[0]);
    }
    int v18 = v19[1];
    if (v18 != EshPath::getDefaultLimoX(DefaultLimoX)) {
      EshPath::setLimoY(a4, v19[1]);
    }
  }
  else
  {
    Defaultint CoordRight = (EshContentProperties *)EshShapeProperties::getDefaultCoordRight((EshShapeProperties *)v6);
    int v9 = (int)DefaultCoordRight;
    int DefaultPositionHorizontal = EshContentProperties::getDefaultPositionHorizontal(DefaultCoordRight);
    int v11 = v9 - DefaultPositionHorizontal;
    if (v9 < DefaultPositionHorizontal) {
      ++v11;
    }
    EshPath::setLimoX(a4, v11 >> 1);
    uint64_t v13 = (EshContentProperties *)EshShapeProperties::getDefaultCoordRight(v12);
    int v14 = (int)v13;
    int v15 = EshContentProperties::getDefaultPositionHorizontal(v13);
    int v16 = v14 - v15;
    if (v14 < v15) {
      ++v16;
    }
    EshPath::setLimoY(a4, v16 >> 1);
  }
}

+ (void)appendAdjustPoint:(OADAdjustPoint)a3 toPathParams:(void *)a4
{
  OADAdjustCoord y = a3.y;
  [a1 computedValueWithAdjustCoord:*(void *)&a3.x];
  EshBasicTablePropVal<EshComputedValue>::append(a4, &v8);
  [a1 computedValueWithAdjustCoord:y];
  EshBasicTablePropVal<EshComputedValue>::append(a4, &v7);
}

+ (void)writePathCommandsAndParamsFromGeometry:(id)a3 toPath:(EshPath *)a4
{
  id v5 = a3;
  if ([v5 pathCount]) {
    operator new();
  }
  EshPath::takeCommands((uint64_t)a4, 0);
  EshPath::takeParams(a4, 0);
}

+ (void)writeFormulasFromGeometry:(id)a3 toPath:(EshPath *)a4
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([v5 formulaCount]) {
    operator new();
  }
  EshPath::takeFormulas((uint64_t)a4, 0);
}

+ (void)writeTextBodyRectsFromGeometry:(id)a3 toPath:(EshPath *)a4
{
  id v5 = a3;
  if ([v5 textBodyRectCount]) {
    operator new();
  }
  EshPath::takeTextBoxRects((uint64_t)a4, 0);
}

+ (void)writeFromShape:(id)a3 toShape:(void *)a4
{
  id v11 = a3;
  uint64_t v6 = [v11 geometry];
  int v7 = [v11 type];
  __int16 v8 = v7;
  if (v7 < 203)
  {
    if (v7) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v9 = [v6 equivalentCustomGeometry];

    uint64_t v6 = (void *)v9;
  }
  __int16 v8 = 100;
LABEL_5:
  EshShapeProperties::setShapeType((uint64_t)a4 + 424, v8);
  EshShapeProperties::setHasShapeType((EshShapeProperties *)((char *)a4 + 424), 1);
  [a1 writeAdjustValuesFromGeometry:v6 toShapeProperties:(char *)a4 + 424];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v6;
    EshPath::takeConnectAngles((uint64_t)a4 + 528, 0);
    EshPath::takeHandles((uint64_t)a4 + 528, 0);
    [a1 writeCoordSpaceFromGeometry:v10 toShape:a4];
    [a1 writeLimoFromGeometry:v10 toPath:(char *)a4 + 528];
    [a1 writePathCommandsAndParamsFromGeometry:v10 toPath:(char *)a4 + 528];
    [a1 writeFormulasFromGeometry:v10 toPath:(char *)a4 + 528];
    [a1 writeTextBodyRectsFromGeometry:v10 toPath:(char *)a4 + 528];
  }
  EshShapeProperties::setHidden((EshShapeProperties *)((char *)a4 + 424), [v11 hidden]);
}

@end