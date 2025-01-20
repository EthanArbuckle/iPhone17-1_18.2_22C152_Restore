@interface ICTTZoomController
- (ICTTZoomController)init;
- (double)checklistZoomFactor;
- (double)zoomFactor;
- (id)reallyZoomAttributedString:(id)a3 zoomDirection:(BOOL)a4;
- (id)reallyZoomAttributes:(id)a3 zoomDirection:(BOOL)a4;
- (id)reallyZoomFontInAttributes:(id)a3 zoomDirection:(BOOL)a4;
- (id)unzoomAttributedString:(id)a3;
- (id)unzoomAttributes:(id)a3;
- (id)unzoomFont:(id)a3;
- (id)unzoomFontInAttributes:(id)a3;
- (id)zoomAttributedString:(id)a3;
- (id)zoomAttributes:(id)a3;
- (id)zoomFont:(id)a3;
- (id)zoomFontInAttributes:(id)a3;
- (void)setChecklistZoomFactor:(double)a3;
- (void)setZoomFactor:(double)a3;
@end

@implementation ICTTZoomController

- (id)zoomFontInAttributes:(id)a3
{
  return [(ICTTZoomController *)self reallyZoomFontInAttributes:a3 zoomDirection:1];
}

- (id)reallyZoomFontInAttributes:(id)a3 zoomDirection:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (void *)[a3 mutableCopy];
  uint64_t v7 = *MEMORY[0x1E4FB06F8];
  v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  if (v8)
  {
    v9 = [v6 objectForKeyedSubscript:v7];
    if (v4) {
      [(ICTTZoomController *)self zoomFont:v9];
    }
    else {
    v10 = [(ICTTZoomController *)self unzoomFont:v9];
    }
    [v6 setObject:v10 forKeyedSubscript:v7];
  }
  return v6;
}

- (id)zoomFont:(id)a3
{
  id v4 = a3;
  [(ICTTZoomController *)self zoomFactor];
  if (v5 == 1.0)
  {
    uint64_t v9 = [v4 copy];
  }
  else
  {
    [v4 pointSize];
    double v7 = v6;
    [(ICTTZoomController *)self zoomFactor];
    uint64_t v9 = objc_msgSend(v4, "ic_fontConvertedToSize:", v7 * v8);
  }
  v10 = (void *)v9;

  return v10;
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (double)checklistZoomFactor
{
  return self->_checklistZoomFactor;
}

- (ICTTZoomController)init
{
  v8.receiver = self;
  v8.super_class = (Class)ICTTZoomController;
  result = [(ICTTZoomController *)&v8 init];
  if (result)
  {
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&result->_zoomFactor = _Q0;
  }
  return result;
}

- (id)unzoomFontInAttributes:(id)a3
{
  return [(ICTTZoomController *)self reallyZoomFontInAttributes:a3 zoomDirection:0];
}

- (id)zoomAttributes:(id)a3
{
  return [(ICTTZoomController *)self reallyZoomAttributes:a3 zoomDirection:1];
}

- (id)unzoomAttributes:(id)a3
{
  return [(ICTTZoomController *)self reallyZoomAttributes:a3 zoomDirection:0];
}

- (id)reallyZoomAttributes:(id)a3 zoomDirection:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = (void *)[v6 mutableCopy];
  uint64_t v8 = *MEMORY[0x1E4FB06F8];
  uint64_t v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F83208]];
    v12 = v11;
    if (v11)
    {
      [v11 pointSize];
      double v14 = v13;
    }
    else
    {
      v15 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F83220]];
      v16 = v15;
      if (v15)
      {
        v17 = +[ICTTTextController preferredFontForICTTTextStyle:](ICTTTextController, "preferredFontForICTTTextStyle:", [v15 style]);
        v18 = v17;
        if (v17)
        {
          [v17 pointSize];
          double v14 = v19;
        }
        else
        {
          double v14 = -1.0;
        }
      }
      else
      {
        double v14 = -1.0;
      }
    }
    if (v14 > 0.0 || ([(ICTTZoomController *)self zoomFactor], v20 == 1.0))
    {
      if (v14 <= 0.0)
      {
LABEL_23:

        goto LABEL_24;
      }
      if (v4)
      {
        [(ICTTZoomController *)self zoomFactor];
        double v23 = v14 * v22;
        v24 = v10;
      }
      else
      {
        v24 = v10;
        double v23 = v14;
      }
      uint64_t v21 = objc_msgSend(v24, "ic_fontConvertedToSize:", v23);
    }
    else
    {
      if (v4) {
        [(ICTTZoomController *)self zoomFont:v10];
      }
      else {
      uint64_t v21 = [(ICTTZoomController *)self unzoomFont:v10];
      }
    }
    v25 = (void *)v21;

    [v7 setObject:v25 forKeyedSubscript:v8];
    v10 = v25;
    goto LABEL_23;
  }
LABEL_24:

  return v7;
}

- (id)zoomAttributedString:(id)a3
{
  return [(ICTTZoomController *)self reallyZoomAttributedString:a3 zoomDirection:1];
}

- (id)unzoomAttributedString:(id)a3
{
  return [(ICTTZoomController *)self reallyZoomAttributedString:a3 zoomDirection:0];
}

- (id)reallyZoomAttributedString:(id)a3 zoomDirection:(BOOL)a4
{
  id v6 = (void *)[a3 mutableCopy];
  uint64_t v7 = [v6 length];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__ICTTZoomController_reallyZoomAttributedString_zoomDirection___block_invoke;
  v11[3] = &unk_1E5FDD780;
  id v8 = v6;
  id v12 = v8;
  double v13 = self;
  BOOL v14 = a4;
  objc_msgSend(v8, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0, v11);
  id v9 = v8;

  return v9;
}

void __63__ICTTZoomController_reallyZoomAttributedString_zoomDirection___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v10 = a2;
  uint64_t v7 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];
  if (v7)
  {
    id v8 = *(void **)(a1 + 32);
    id v9 = [*(id *)(a1 + 40) reallyZoomAttributes:v10 zoomDirection:*(unsigned __int8 *)(a1 + 48)];
    objc_msgSend(v8, "setAttributes:range:", v9, a3, a4);
  }
}

- (id)unzoomFont:(id)a3
{
  id v4 = a3;
  [(ICTTZoomController *)self zoomFactor];
  if (v5 == 1.0)
  {
    uint64_t v9 = [v4 copy];
  }
  else
  {
    [v4 pointSize];
    double v7 = v6;
    [(ICTTZoomController *)self zoomFactor];
    uint64_t v9 = objc_msgSend(v4, "ic_fontConvertedToSize:", v7 / v8);
  }
  id v10 = (void *)v9;

  return v10;
}

- (void)setZoomFactor:(double)a3
{
  self->_zoomFactor = a3;
}

- (void)setChecklistZoomFactor:(double)a3
{
  self->_checklistZoomFactor = a3;
}

@end