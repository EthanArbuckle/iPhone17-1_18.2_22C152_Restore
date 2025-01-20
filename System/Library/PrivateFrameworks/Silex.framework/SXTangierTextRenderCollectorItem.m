@interface SXTangierTextRenderCollectorItem
- (BOOL)selectable;
- (id)description;
- (id)initWithStorage:(void *)a3 layout:(void *)a4 directLayerHost:(char)a5 selectable:(void *)a6 componentIdentifier:;
- (uint64_t)componentIdentifier;
- (uint64_t)directLayerHost;
- (uint64_t)flowRange;
- (uint64_t)storage;
- (uint64_t)updateWithLayout:(uint64_t)a1;
- (void)appendToFlowStorage:(uint64_t)a1;
- (void)flowInfo;
- (void)flowLayoutWithICC:(void *)a1;
@end

@implementation SXTangierTextRenderCollectorItem

- (id)initWithStorage:(void *)a3 layout:(void *)a4 directLayerHost:(char)a5 selectable:(void *)a6 componentIdentifier:
{
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)SXTangierTextRenderCollectorItem;
    v16 = (id *)objc_msgSendSuper2(&v18, sel_init);
    a1 = v16;
    if (v16)
    {
      objc_storeStrong(v16 + 3, a2);
      objc_storeStrong(a1 + 7, a3);
      objc_storeStrong(a1 + 6, a4);
      *((unsigned char *)a1 + 8) = a5;
      objc_storeStrong(a1 + 5, a6);
      *(int64x2_t *)(a1 + 9) = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    }
  }

  return a1;
}

- (uint64_t)updateWithLayout:(uint64_t)a1
{
  v4 = a2;
  v5 = v4;
  if (a1)
  {
    v4 = (id *)(a1 + 56);
    if (*(id **)(a1 + 56) != v5)
    {
      v10 = v5;
      objc_storeStrong(v4, a2);
      id v6 = *(id *)(a1 + 64);
      v7 = [v6 layoutController];
      [v7 unregisterLayout:*(void *)(a1 + 64)];

      v8 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = 0;

      v5 = v10;
    }
  }
  return MEMORY[0x270F9A758](v4, v5);
}

- (void)appendToFlowStorage:(uint64_t)a1
{
  id v6 = a2;
  if (a1)
  {
    uint64_t v4 = [v6 length];
    [v6 insertStorage:*(void *)(a1 + 24) atCharIndex:v4 dolcContext:0 undoTransaction:0];
    uint64_t v5 = [v6 length];
    objc_storeStrong((id *)(a1 + 32), a2);
    *(void *)(a1 + 72) = v4;
    *(void *)(a1 + 80) = v5 - v4;
  }
}

- (uint64_t)storage
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (void)flowInfo
{
  if (a1)
  {
    v2 = a1;
    v3 = (void *)a1[2];
    if (!v3)
    {
      uint64_t v4 = -[SXTextTangierFlowInfo initWithStorage:range:]([SXTextTangierFlowInfo alloc], "initWithStorage:range:", a1[4], a1[9], a1[10]);
      uint64_t v5 = (void *)v2[2];
      v2[2] = v4;

      [(id)v2[2] setDirectLayerHost:v2[6]];
      v3 = (void *)v2[2];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)flowLayoutWithICC:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = a1[8];
    uint64_t v5 = (void *)a1[6];
    id v6 = (id)a1[7];
    id v7 = v5;
    [v6 frame];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    v16 = [v3 canvasView];
    objc_msgSend(v7, "convertRect:toView:", v16, v9, v11, v13, v15);
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;

    if (v4)
    {
      v25 = [(id)a1[8] geometry];
      [v25 frame];
      v39.origin.x = v26;
      v39.origin.y = v27;
      v39.size.width = v28;
      v39.size.height = v29;
      v38.origin.x = v18;
      v38.origin.y = v20;
      v38.size.width = v22;
      v38.size.height = v24;
      BOOL v30 = CGRectEqualToRect(v38, v39);

      if (v30)
      {
LABEL_7:
        a1 = (id)a1[8];
        goto LABEL_8;
      }
      v31 = objc_msgSend(objc_alloc(MEMORY[0x263F7C6D0]), "initWithFrame:", v18, v20, v22, v24);
      [(id)a1[8] setGeometry:v31];
    }
    else
    {
      v32 = [SXTextTangierFlowLayout alloc];
      v31 = -[SXTangierTextRenderCollectorItem flowInfo](a1);
      id v33 = (id)a1[7];
      uint64_t v34 = -[SXTextTangierFlowLayout initWithInfo:layout:frame:](v32, "initWithInfo:layout:frame:", v31, v33, v18, v20, v22, v24);
      v35 = (void *)a1[8];
      a1[8] = v34;
    }
    goto LABEL_7;
  }
LABEL_8:

  return a1;
}

- (uint64_t)directLayerHost
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self)
  {
    NSRange flowRange = self->_flowRange;
  }
  else
  {
    flowRange.length = 0;
    flowRange.location = 0;
  }
  id v6 = NSStringFromRange(flowRange);
  id v7 = [v3 stringWithFormat:@"<%@: %p; flowRange: %@>", v4, self, v6];

  return v7;
}

- (uint64_t)flowRange
{
  if (result) {
    return *(void *)(result + 72);
  }
  return result;
}

- (uint64_t)componentIdentifier
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (BOOL)selectable
{
  if (result) {
    return *(unsigned char *)(result + 8) != 0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_directLayerHost, 0);
  objc_storeStrong((id *)&self->_componentIdentifier, 0);
  objc_storeStrong((id *)&self->_flowStorage, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_flowInfo, 0);
}

@end