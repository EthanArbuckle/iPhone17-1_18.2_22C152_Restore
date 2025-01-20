@interface WebVisiblePosition
+ (id)_wrapVisiblePosition:(VisiblePosition *)a3;
+ (id)_wrapVisiblePositionIfValid:(VisiblePosition *)a3;
- (BOOL)atAlphaNumericBoundaryInDirection:(int)a3;
- (BOOL)atBoundaryOfGranularity:(int)a3 inDirection:(int)a4;
- (BOOL)directionIsDownstream:(int)a3;
- (BOOL)isEditable;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresContextForWordBoundary;
- (BOOL)textDirection;
- (BOOL)withinTextUnitOfGranularity:(int)a3 inDirectionIfAtBoundary:(int)a4;
- (VisiblePosition)_visiblePosition;
- (id)description;
- (id)enclosingRangeWithCorrectionIndicator;
- (id)enclosingRangeWithDictationPhraseAlternatives:(id *)a3;
- (id)enclosingTextUnitOfGranularity:(int)a3 inDirectionIfAtBoundary:(int)a4;
- (id)positionAtStartOrEndOfWord;
- (id)positionByMovingInDirection:(int)a3 amount:(unsigned int)a4;
- (id)positionByMovingInDirection:(int)a3 amount:(unsigned int)a4 withAffinityDownstream:(BOOL)a5;
- (id)positionOfNextBoundaryOfGranularity:(int)a3 inDirection:(int)a4;
- (int)distanceFromPosition:(id)a3;
- (int64_t)compare:(id)a3;
- (unint64_t)affinity;
- (void)dealloc;
- (void)setAffinity:(unint64_t)a3;
@end

@implementation WebVisiblePosition

+ (id)_wrapVisiblePosition:(VisiblePosition *)a3
{
  v3 = objc_alloc_init(WebVisiblePosition);
  operator new();
}

+ (id)_wrapVisiblePositionIfValid:(VisiblePosition *)a3
{
  var0 = a3->var0.var0.var0;
  if (a3->var0.var0.var0) {
    v4 = WTF::RefPtr<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::unspecifiedBoolTypeInstance;
  }
  else {
    v4 = 0;
  }
  if (!v4) {
    return 0;
  }
  if (var0) {
    *((_DWORD *)var0 + 7) += 2;
  }
  v8 = (WebCore::Node *)var0;
  unsigned int var1 = a3->var0.var1;
  char v10 = *((unsigned char *)&a3->var0 + 12);
  BOOL v11 = a3->var1;
  id v5 = +[WebVisiblePosition _wrapVisiblePosition:&v8];
  v6 = v8;
  v8 = 0;
  if (!v6) {
    return v5;
  }
  if (*((_DWORD *)v6 + 7) != 2)
  {
    *((_DWORD *)v6 + 7) -= 2;
    return v5;
  }
  if ((*((_WORD *)v6 + 17) & 0x400) != 0) {
    return v5;
  }
  WebCore::Node::removedLastRef(v6);
  return v5;
}

- (VisiblePosition)_visiblePosition
{
  v3 = *(uint64_t **)&self->var0.var1;
  uint64_t v4 = *v3;
  if (*v3) {
    *(_DWORD *)(v4 + 28) += 2;
  }
  retstr->var0.var0.var0 = (Node *)v4;
  retstr->var0.unsigned int var1 = *((_DWORD *)v3 + 2);
  *((unsigned char *)&retstr->var0 + 12) = *((unsigned char *)v3 + 12);
  retstr->unsigned int var1 = *((unsigned char *)v3 + 16);
  return self;
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {
    uint64_t v4 = *(void *)internal;
    *(void *)internal = 0;
    if (v4)
    {
      if (*(_DWORD *)(v4 + 28) == 2)
      {
        if ((*(_WORD *)(v4 + 34) & 0x400) == 0) {
          WebCore::Node::removedLastRef((WebCore::Node *)v4);
        }
      }
      else
      {
        *(_DWORD *)(v4 + 28) -= 2;
      }
    }
    MEMORY[0x1E4E4B240](internal, 0x1020C4021B6F8B6);
  }
  self->_internal = 0;
  v5.receiver = self;
  v5.super_class = (Class)WebVisiblePosition;
  [(WebVisiblePosition *)&v5 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if (!self)
  {
    memset(v10, 0, sizeof(v10));
    if (a3) {
      goto LABEL_4;
    }
LABEL_8:
    memset(v9, 0, sizeof(v9));
    goto LABEL_9;
  }
  [(WebVisiblePosition *)self _visiblePosition];
  if (!a3) {
    goto LABEL_8;
  }
LABEL_4:
  [a3 _visiblePosition];
LABEL_9:
  BOOL v5 = WebCore::operator==((uint64_t)v10, (uint64_t)v9);
  v7 = v9[0];
  v9[0] = 0;
  if (v7)
  {
    if (*((_DWORD *)v7 + 7) == 2)
    {
      if ((*((_WORD *)v7 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v7);
      }
    }
    else
    {
      *((_DWORD *)v7 + 7) -= 2;
    }
  }
  v8 = v10[0];
  v10[0] = 0;
  if (!v8) {
    return v5;
  }
  if (*((_DWORD *)v8 + 7) != 2)
  {
    *((_DWORD *)v8 + 7) -= 2;
    return v5;
  }
  if ((*((_WORD *)v8 + 17) & 0x400) != 0) {
    return v5;
  }
  WebCore::Node::removedLastRef(v8);
  return v5;
}

- (int64_t)compare:(id)a3
{
  if (self)
  {
    [(WebVisiblePosition *)self _visiblePosition];
    if (a3)
    {
LABEL_3:
      [a3 _visiblePosition];
      goto LABEL_6;
    }
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    if (a3) {
      goto LABEL_3;
    }
  }
  memset(&v11, 0, sizeof(v11));
LABEL_6:
  if (WebCore::operator==((uint64_t)v12, (uint64_t)&v11))
  {
    int64_t v5 = 0;
  }
  else
  {
    int v6 = (char)WebCore::documentOrder((WebCore *)v12, &v11, v4);
    if (v6 >= 0 || v6 == -127) {
      int64_t v5 = 1;
    }
    else {
      int64_t v5 = -1;
    }
  }
  var0 = v11.var0.var0.var0;
  v11.var0.var0.var0 = 0;
  if (var0)
  {
    if (*((_DWORD *)var0 + 7) == 2)
    {
      if ((*((_WORD *)var0 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef((WebCore::Node *)var0);
      }
    }
    else
    {
      *((_DWORD *)var0 + 7) -= 2;
    }
  }
  v9 = v12[0];
  v12[0] = 0;
  if (!v9) {
    return v5;
  }
  if (*((_DWORD *)v9 + 7) != 2)
  {
    *((_DWORD *)v9 + 7) -= 2;
    return v5;
  }
  if ((*((_WORD *)v9 + 17) & 0x400) != 0) {
    return v5;
  }
  WebCore::Node::removedLastRef(v9);
  return v5;
}

- (int)distanceFromPosition:(id)a3
{
  if (self)
  {
    [(WebVisiblePosition *)self _visiblePosition];
    if (a3)
    {
LABEL_3:
      [a3 _visiblePosition];
      goto LABEL_6;
    }
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    if (a3) {
      goto LABEL_3;
    }
  }
  memset(&v8, 0, sizeof(v8));
LABEL_6:
  int v4 = WebCore::distanceBetweenPositions((WebCore *)v9, &v8, (const VisiblePosition *)a3);
  var0 = v8.var0.var0.var0;
  v8.var0.var0.var0 = 0;
  if (var0)
  {
    if (*((_DWORD *)var0 + 7) == 2)
    {
      if ((*((_WORD *)var0 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef((WebCore::Node *)var0);
      }
    }
    else
    {
      *((_DWORD *)var0 + 7) -= 2;
    }
  }
  int v6 = v9[0];
  v9[0] = 0;
  if (!v6) {
    return v4;
  }
  if (*((_DWORD *)v6 + 7) != 2)
  {
    *((_DWORD *)v6 + 7) -= 2;
    return v4;
  }
  if ((*((_WORD *)v6 + 17) & 0x400) != 0) {
    return v4;
  }
  WebCore::Node::removedLastRef(v6);
  return v4;
}

- (id)description
{
  v17.receiver = self;
  v17.super_class = (Class)WebVisiblePosition;
  v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", -[WebVisiblePosition description](&v17, sel_description));
  if (self)
  {
    [(WebVisiblePosition *)self _visiblePosition];
    int v4 = v14;
    if (v14)
    {
      int v5 = *((_DWORD *)v14 + 7);
      *((_DWORD *)v14 + 7) = v5 + 2;
      uint64_t v6 = v15;
      if (v5)
      {
        *((_DWORD *)v4 + 7) = v5;
      }
      else if ((*((_WORD *)v4 + 17) & 0x400) == 0)
      {
        WebCore::Node::removedLastRef(v4);
      }
    }
    else
    {
      uint64_t v6 = v15;
    }
  }
  else
  {
    uint64_t v6 = 0;
    v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
  }
  WebCore::VisiblePosition::previous();
  uint64_t v7 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)v18);
  uint64_t v8 = v18[0];
  v18[0] = 0;
  if (v8)
  {
    if (*(_DWORD *)(v8 + 28) == 2)
    {
      if ((*(_WORD *)(v8 + 34) & 0x400) == 0) {
        WebCore::Node::removedLastRef((WebCore::Node *)v8);
      }
    }
    else
    {
      *(_DWORD *)(v8 + 28) -= 2;
    }
  }
  uint64_t v9 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v14);
  WebCore::VisiblePosition::previous();
  uint64_t v10 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)v18);
  uint64_t v11 = v18[0];
  v18[0] = 0;
  if (v11)
  {
    if (*(_DWORD *)(v11 + 28) == 2)
    {
      if ((*(_WORD *)(v11 + 34) & 0x400) == 0) {
        WebCore::Node::removedLastRef((WebCore::Node *)v11);
      }
    }
    else
    {
      *(_DWORD *)(v11 + 28) -= 2;
    }
  }
  objc_msgSend(v3, "appendFormat:", @"(offset=%d, context=([%c|%c], [u+%04x|u+%04x])"), v6, v7, v9, v10, WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v14);
  v12 = v14;
  v14 = 0;
  if (v12)
  {
    if (*((_DWORD *)v12 + 7) == 2)
    {
      if ((*((_WORD *)v12 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v12);
      }
    }
    else
    {
      *((_DWORD *)v12 + 7) -= 2;
    }
  }
  return v3;
}

- (BOOL)textDirection
{
  return 0;
}

- (BOOL)directionIsDownstream:(int)a3
{
  if (a3 == 1) {
    return 0;
  }
  if (!a3) {
    return 1;
  }
  if ([(WebVisiblePosition *)self textDirection]) {
    return a3 == 3;
  }
  return a3 == 2;
}

- (id)positionByMovingInDirection:(int)a3 amount:(unsigned int)a4 withAffinityDownstream:(BOOL)a5
{
  if (!self)
  {
    v33 = 0;
    uint64_t v34 = 0;
    BOOL v35 = a5;
LABEL_5:
    switch(a3)
    {
      case 0:
        if (!a4) {
          goto LABEL_60;
        }
        while (1)
        {
          WebCore::VisiblePosition::next();
          uint64_t v8 = v29;
          v29 = 0;
          uint64_t v9 = v33;
          v33 = v8;
          if (v9)
          {
            if (*((_DWORD *)v9 + 7) == 2)
            {
              if ((*((_WORD *)v9 + 17) & 0x400) == 0)
              {
                WebCore::Node::removedLastRef(v9);
                LODWORD(v34) = v30;
                BYTE4(v34) = v31;
                LOBYTE(v35) = v32;
                v29 = 0;
                goto LABEL_10;
              }
            }
            else
            {
              *((_DWORD *)v9 + 7) -= 2;
            }
          }
          LODWORD(v34) = v30;
          BYTE4(v34) = v31;
          LOBYTE(v35) = v32;
LABEL_10:
          if (!--a4) {
            goto LABEL_60;
          }
        }
      case 1:
        if (!a4) {
          goto LABEL_60;
        }
        while (1)
        {
          WebCore::VisiblePosition::previous();
          uint64_t v10 = v29;
          v29 = 0;
          uint64_t v11 = v33;
          v33 = v10;
          if (v11)
          {
            if (*((_DWORD *)v11 + 7) == 2)
            {
              if ((*((_WORD *)v11 + 17) & 0x400) == 0)
              {
                WebCore::Node::removedLastRef(v11);
                LODWORD(v34) = v30;
                BYTE4(v34) = v31;
                LOBYTE(v35) = v32;
                v29 = 0;
                goto LABEL_19;
              }
            }
            else
            {
              *((_DWORD *)v11 + 7) -= 2;
            }
          }
          LODWORD(v34) = v30;
          BYTE4(v34) = v31;
          LOBYTE(v35) = v32;
LABEL_19:
          if (!--a4) {
            goto LABEL_60;
          }
        }
      case 2:
        if (!a4) {
          goto LABEL_60;
        }
        while (1)
        {
          WebCore::VisiblePosition::right((WebCore::VisiblePosition *)&v33, 0, 0);
          v12 = v29;
          v29 = 0;
          v13 = v33;
          v33 = v12;
          if (v13)
          {
            if (*((_DWORD *)v13 + 7) == 2)
            {
              if ((*((_WORD *)v13 + 17) & 0x400) == 0)
              {
                WebCore::Node::removedLastRef(v13);
                LODWORD(v34) = v30;
                BYTE4(v34) = v31;
                LOBYTE(v35) = v32;
                v29 = 0;
                goto LABEL_28;
              }
            }
            else
            {
              *((_DWORD *)v13 + 7) -= 2;
            }
          }
          LODWORD(v34) = v30;
          BYTE4(v34) = v31;
          LOBYTE(v35) = v32;
LABEL_28:
          if (!--a4) {
            goto LABEL_60;
          }
        }
      case 3:
        if (!a4) {
          goto LABEL_60;
        }
        while (1)
        {
          WebCore::VisiblePosition::left((WebCore::VisiblePosition *)&v33, 0, 0);
          v14 = v29;
          v29 = 0;
          uint64_t v15 = v33;
          v33 = v14;
          if (v15)
          {
            if (*((_DWORD *)v15 + 7) == 2)
            {
              if ((*((_WORD *)v15 + 17) & 0x400) == 0)
              {
                WebCore::Node::removedLastRef(v15);
                LODWORD(v34) = v30;
                BYTE4(v34) = v31;
                LOBYTE(v35) = v32;
                v29 = 0;
                goto LABEL_37;
              }
            }
            else
            {
              *((_DWORD *)v15 + 7) -= 2;
            }
          }
          LODWORD(v34) = v30;
          BYTE4(v34) = v31;
          LOBYTE(v35) = v32;
LABEL_37:
          if (!--a4) {
            goto LABEL_60;
          }
        }
      case 4:
        WebCore::VisiblePosition::lineDirectionPointForBlockDirectionNavigation((WebCore::VisiblePosition *)&v33);
        if (!a4) {
          goto LABEL_60;
        }
        while (1)
        {
          WebCore::previousLinePosition();
          uint64_t v16 = v29;
          v29 = 0;
          objc_super v17 = v33;
          v33 = v16;
          if (v17)
          {
            if (*((_DWORD *)v17 + 7) == 2)
            {
              if ((*((_WORD *)v17 + 17) & 0x400) == 0)
              {
                WebCore::Node::removedLastRef(v17);
                LODWORD(v34) = v30;
                BYTE4(v34) = v31;
                LOBYTE(v35) = v32;
                v29 = 0;
                goto LABEL_46;
              }
            }
            else
            {
              *((_DWORD *)v17 + 7) -= 2;
            }
          }
          LODWORD(v34) = v30;
          BYTE4(v34) = v31;
          LOBYTE(v35) = v32;
LABEL_46:
          if (!--a4) {
            goto LABEL_60;
          }
        }
      case 5:
        WebCore::VisiblePosition::lineDirectionPointForBlockDirectionNavigation((WebCore::VisiblePosition *)&v33);
        if (!a4) {
          goto LABEL_60;
        }
        break;
      default:
        goto LABEL_60;
    }
    while (1)
    {
      WebCore::nextLinePosition();
      v18 = v29;
      v29 = 0;
      v19 = v33;
      v33 = v18;
      if (v19)
      {
        if (*((_DWORD *)v19 + 7) == 2)
        {
          if ((*((_WORD *)v19 + 17) & 0x400) == 0)
          {
            WebCore::Node::removedLastRef(v19);
            LODWORD(v34) = v30;
            BYTE4(v34) = v31;
            LOBYTE(v35) = v32;
            v29 = 0;
            goto LABEL_55;
          }
        }
        else
        {
          *((_DWORD *)v19 + 7) -= 2;
        }
      }
      LODWORD(v34) = v30;
      BYTE4(v34) = v31;
      LOBYTE(v35) = v32;
LABEL_55:
      if (!--a4) {
        goto LABEL_60;
      }
    }
  }
  [(WebVisiblePosition *)self _visiblePosition];
  LOBYTE(v35) = a5;
  if (a3 <= 5) {
    goto LABEL_5;
  }
LABEL_60:
  v20 = v33;
  if (v33) {
    *((_DWORD *)v33 + 7) += 2;
  }
  v25 = v20;
  int v26 = v34;
  char v27 = BYTE4(v34);
  BOOL v28 = v35;
  id v21 = +[WebVisiblePosition _wrapVisiblePositionIfValid:&v25];
  v22 = v25;
  v25 = 0;
  if (v22)
  {
    if (*((_DWORD *)v22 + 7) == 2)
    {
      if ((*((_WORD *)v22 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v22);
      }
    }
    else
    {
      *((_DWORD *)v22 + 7) -= 2;
    }
  }
  v23 = v33;
  v33 = 0;
  if (!v23) {
    return v21;
  }
  if (*((_DWORD *)v23 + 7) != 2)
  {
    *((_DWORD *)v23 + 7) -= 2;
    return v21;
  }
  if ((*((_WORD *)v23 + 17) & 0x400) != 0) {
    return v21;
  }
  WebCore::Node::removedLastRef(v23);
  return v21;
}

- (id)positionByMovingInDirection:(int)a3 amount:(unsigned int)a4
{
  return [(WebVisiblePosition *)self positionByMovingInDirection:*(void *)&a3 amount:*(void *)&a4 withAffinityDownstream:1];
}

- (BOOL)atBoundaryOfGranularity:(int)a3 inDirection:(int)a4
{
  if (self) {
    [(WebVisiblePosition *)self _visiblePosition];
  }
  else {
    uint64_t v6 = 0;
  }
  char v4 = WebCore::atBoundaryOfGranularity();
  if (!v6) {
    return v4;
  }
  if (*((_DWORD *)v6 + 7) != 2)
  {
    *((_DWORD *)v6 + 7) -= 2;
    return v4;
  }
  if ((*((_WORD *)v6 + 17) & 0x400) != 0) {
    return v4;
  }
  WebCore::Node::removedLastRef(v6);
  return v4;
}

- (id)positionOfNextBoundaryOfGranularity:(int)a3 inDirection:(int)a4
{
  if (self) {
    [(WebVisiblePosition *)self _visiblePosition];
  }
  else {
    uint64_t v7 = 0;
  }
  WebCore::positionOfNextBoundaryOfGranularity();
  id v4 = +[WebVisiblePosition _wrapVisiblePositionIfValid:&v8];
  int v5 = v8;
  uint64_t v8 = 0;
  if (v5)
  {
    if (*((_DWORD *)v5 + 7) == 2)
    {
      if ((*((_WORD *)v5 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v5);
      }
    }
    else
    {
      *((_DWORD *)v5 + 7) -= 2;
    }
  }
  if (!v7) {
    return v4;
  }
  if (*((_DWORD *)v7 + 7) != 2)
  {
    *((_DWORD *)v7 + 7) -= 2;
    return v4;
  }
  if ((*((_WORD *)v7 + 17) & 0x400) != 0) {
    return v4;
  }
  WebCore::Node::removedLastRef(v7);
  return v4;
}

- (BOOL)withinTextUnitOfGranularity:(int)a3 inDirectionIfAtBoundary:(int)a4
{
  if (self) {
    [(WebVisiblePosition *)self _visiblePosition];
  }
  else {
    uint64_t v6 = 0;
  }
  char v4 = WebCore::withinTextUnitOfGranularity();
  if (!v6) {
    return v4;
  }
  if (*((_DWORD *)v6 + 7) != 2)
  {
    *((_DWORD *)v6 + 7) -= 2;
    return v4;
  }
  if ((*((_WORD *)v6 + 17) & 0x400) != 0) {
    return v4;
  }
  WebCore::Node::removedLastRef(v6);
  return v4;
}

- (id)enclosingTextUnitOfGranularity:(int)a3 inDirectionIfAtBoundary:(int)a4
{
  if (self) {
    [(WebVisiblePosition *)self _visiblePosition];
  }
  else {
    uint64_t v6 = 0;
  }
  WebCore::enclosingTextUnitOfGranularity();
  WebCore::createLiveRange();
  char v4 = kit(v10);
  if (!v10)
  {
LABEL_7:
    if (!v9) {
      goto LABEL_20;
    }
    goto LABEL_10;
  }
  if (*((_DWORD *)v10 + 2) != 1)
  {
    --*((_DWORD *)v10 + 2);
    goto LABEL_7;
  }
  (*(void (**)())(*(void *)v10 + 8))();
  if (!v9) {
    goto LABEL_20;
  }
LABEL_10:
  if (v8)
  {
    if (*((_DWORD *)v8 + 7) == 2)
    {
      if ((*((_WORD *)v8 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v8);
      }
    }
    else
    {
      *((_DWORD *)v8 + 7) -= 2;
    }
  }
  if (v7)
  {
    if (*((_DWORD *)v7 + 7) == 2)
    {
      if ((*((_WORD *)v7 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v7);
      }
    }
    else
    {
      *((_DWORD *)v7 + 7) -= 2;
    }
  }
LABEL_20:
  if (!v6) {
    return v4;
  }
  if (*((_DWORD *)v6 + 7) != 2)
  {
    *((_DWORD *)v6 + 7) -= 2;
    return v4;
  }
  if ((*((_WORD *)v6 + 17) & 0x400) != 0) {
    return v4;
  }
  WebCore::Node::removedLastRef(v6);
  return v4;
}

- (id)positionAtStartOrEndOfWord
{
  if (self)
  {
    [(WebVisiblePosition *)self _visiblePosition];
    v2 = v78;
    if (v78)
    {
      char v3 = 0;
      *((_DWORD *)v78 + 7) += 2;
    }
    else
    {
      char v3 = 1;
    }
  }
  else
  {
    v2 = 0;
    v78 = 0;
    uint64_t v79 = 0;
    char v3 = 1;
    uint64_t v80 = 0;
  }
  v74 = v2;
  int v75 = v79;
  char v76 = BYTE4(v79);
  char v4 = v80;
  char v77 = v80;
  UChar32 v5 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v78);
  unsigned int IntPropertyValue = u_getIntPropertyValue(v5, UCHAR_LINE_BREAK);
  if (IntPropertyValue > 0x25 || ((1 << IntPropertyValue) & 0x2001004000) == 0)
  {
    UTF32Char v19 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v78);
    CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
    CFCharacterSetRef v22 = Predefined;
    if (!v19 || CFCharacterSetIsLongCharacterMember(Predefined, v19))
    {
      while (v78)
      {
        if (WebCore::isStartOfLine((WebCore *)&v78, v21)) {
          goto LABEL_84;
        }
        WebCore::VisiblePosition::previous();
        UTF32Char v23 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v81);
        v24 = v81;
        v81 = 0;
        if (v24)
        {
          if (*((_DWORD *)v24 + 7) == 2)
          {
            if ((*((_WORD *)v24 + 17) & 0x400) == 0) {
              WebCore::Node::removedLastRef(v24);
            }
          }
          else
          {
            *((_DWORD *)v24 + 7) -= 2;
          }
        }
        if (!CFCharacterSetIsLongCharacterMember(v22, v23)) {
          goto LABEL_84;
        }
        WebCore::VisiblePosition::previous();
        v25 = v81;
        v81 = 0;
        int v26 = v78;
        v78 = v25;
        if (v26)
        {
          if (*((_DWORD *)v26 + 7) == 2)
          {
            if ((*((_WORD *)v26 + 17) & 0x400) == 0)
            {
              WebCore::Node::removedLastRef(v26);
              char v27 = v81;
              LODWORD(v79) = v82;
              BYTE4(v79) = v83;
              LOBYTE(v80) = v84;
              v81 = 0;
              if (v27)
              {
                if (*((_DWORD *)v27 + 7) == 2)
                {
                  if ((*((_WORD *)v27 + 17) & 0x400) == 0) {
                    WebCore::Node::removedLastRef(v27);
                  }
                }
                else
                {
                  *((_DWORD *)v27 + 7) -= 2;
                }
              }
              continue;
            }
          }
          else
          {
            *((_DWORD *)v26 + 7) -= 2;
          }
        }
        LODWORD(v79) = v82;
        BYTE4(v79) = v83;
        LOBYTE(v80) = v84;
      }
LABEL_158:
      v33 = 0;
      goto LABEL_86;
    }
    if (!v78) {
      goto LABEL_158;
    }
    if (WebCore::isStartOfLine((WebCore *)&v78, v21)) {
      goto LABEL_84;
    }
    WebCore::VisiblePosition::previous();
    UTF32Char v38 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v81);
    v39 = v81;
    v81 = 0;
    if (v39)
    {
      if (*((_DWORD *)v39 + 7) == 2)
      {
        if ((*((_WORD *)v39 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v39);
        }
      }
      else
      {
        *((_DWORD *)v39 + 7) -= 2;
      }
    }
    if (CFCharacterSetIsLongCharacterMember(v22, v38)) {
      goto LABEL_84;
    }
    WebCore::VisiblePosition::previous();
    v41 = v81;
    v81 = 0;
    v42 = v78;
    v78 = v41;
    if (v42)
    {
      if (*((_DWORD *)v42 + 7) == 2)
      {
        if ((*((_WORD *)v42 + 17) & 0x400) == 0)
        {
          WebCore::Node::removedLastRef(v42);
          v43 = v81;
          LODWORD(v79) = v82;
          BYTE4(v79) = v83;
          LOBYTE(v80) = v84;
          v81 = 0;
          if (v43)
          {
            if (*((_DWORD *)v43 + 7) == 2)
            {
              if ((*((_WORD *)v43 + 17) & 0x400) == 0) {
                WebCore::Node::removedLastRef(v43);
              }
            }
            else
            {
              *((_DWORD *)v43 + 7) -= 2;
            }
          }
LABEL_118:
          if (!v78) {
            goto LABEL_158;
          }
          if (WebCore::isStartOfLine((WebCore *)&v78, v40)) {
            goto LABEL_84;
          }
          WebCore::VisiblePosition::previous();
          UTF32Char v44 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v81);
          v45 = v81;
          v81 = 0;
          if (v45)
          {
            if (*((_DWORD *)v45 + 7) == 2)
            {
              if ((*((_WORD *)v45 + 17) & 0x400) == 0) {
                WebCore::Node::removedLastRef(v45);
              }
            }
            else
            {
              *((_DWORD *)v45 + 7) -= 2;
            }
          }
          if (CFCharacterSetIsLongCharacterMember(v22, v44)) {
            goto LABEL_84;
          }
          WebCore::VisiblePosition::previous();
          v47 = v81;
          v81 = 0;
          v48 = v78;
          v78 = v47;
          if (v48)
          {
            if (*((_DWORD *)v48 + 7) == 2)
            {
              if ((*((_WORD *)v48 + 17) & 0x400) == 0)
              {
                WebCore::Node::removedLastRef(v48);
                v49 = v81;
                LODWORD(v79) = v82;
                BYTE4(v79) = v83;
                LOBYTE(v80) = v84;
                v81 = 0;
                if (v49)
                {
                  if (*((_DWORD *)v49 + 7) == 2)
                  {
                    if ((*((_WORD *)v49 + 17) & 0x400) == 0) {
                      WebCore::Node::removedLastRef(v49);
                    }
                  }
                  else
                  {
                    *((_DWORD *)v49 + 7) -= 2;
                  }
                }
LABEL_136:
                if ((v3 & 1) == 0) {
                  *((_DWORD *)v2 + 7) += 2;
                }
                v50 = v78;
                v78 = v2;
                v51 = v2;
                if (v50)
                {
                  if (*((_DWORD *)v50 + 7) == 2)
                  {
                    v51 = v2;
                    if ((*((_WORD *)v50 + 17) & 0x400) == 0)
                    {
                      WebCore::Node::removedLastRef(v50);
                      v51 = v78;
                    }
                  }
                  else
                  {
                    *((_DWORD *)v50 + 7) -= 2;
                    v51 = v2;
                  }
                }
                LODWORD(v79) = v75;
                BYTE4(v79) = v76;
                LOBYTE(v80) = v4;
                if (!v51) {
                  goto LABEL_158;
                }
                while (1)
                {
                  if (WebCore::isEndOfLine((WebCore *)&v78, v46)) {
                    goto LABEL_84;
                  }
                  UTF32Char v52 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v78);
                  if (CFCharacterSetIsLongCharacterMember(v22, v52)) {
                    goto LABEL_84;
                  }
                  WebCore::VisiblePosition::next();
                  v53 = v81;
                  v81 = 0;
                  v54 = v78;
                  v78 = v53;
                  if (v54)
                  {
                    if (*((_DWORD *)v54 + 7) == 2)
                    {
                      if ((*((_WORD *)v54 + 17) & 0x400) == 0)
                      {
                        WebCore::Node::removedLastRef(v54);
                        v55 = v81;
                        LODWORD(v79) = v82;
                        BYTE4(v79) = v83;
                        LOBYTE(v80) = v84;
                        v81 = 0;
                        if (v55)
                        {
                          if (*((_DWORD *)v55 + 7) == 2)
                          {
                            if ((*((_WORD *)v55 + 17) & 0x400) == 0) {
                              WebCore::Node::removedLastRef(v55);
                            }
                          }
                          else
                          {
                            *((_DWORD *)v55 + 7) -= 2;
                          }
                        }
                        goto LABEL_147;
                      }
                    }
                    else
                    {
                      *((_DWORD *)v54 + 7) -= 2;
                    }
                  }
                  LODWORD(v79) = v82;
                  BYTE4(v79) = v83;
                  LOBYTE(v80) = v84;
LABEL_147:
                  if (!v78) {
                    goto LABEL_158;
                  }
                }
              }
            }
            else
            {
              *((_DWORD *)v48 + 7) -= 2;
            }
          }
          LODWORD(v79) = v82;
          BYTE4(v79) = v83;
          LOBYTE(v80) = v84;
          goto LABEL_136;
        }
      }
      else
      {
        *((_DWORD *)v42 + 7) -= 2;
      }
    }
    LODWORD(v79) = v82;
    BYTE4(v79) = v83;
    LOBYTE(v80) = v84;
    goto LABEL_118;
  }
  WebCore::startOfWord();
  uint64_t v7 = v81;
  if (v81) {
    *((_DWORD *)v81 + 7) += 2;
  }
  v71 = v7;
  int v72 = v82;
  char v73 = v83;
  if ((v83 & 8) == 0 && ((int v8 = v83 & 7, v8 == 2) || v8 == 4)) {
    int v9 = WebCore::Position::offsetForPositionAfterAnchor((WebCore::Position *)&v71);
  }
  else {
    int v9 = v72;
  }
  uint64_t v10 = v78;
  if (v78) {
    *((_DWORD *)v78 + 7) += 2;
  }
  v67 = v10;
  int v68 = v79;
  char v69 = BYTE4(v79);
  if ((v79 & 0x800000000) == 0 && ((int v11 = v69 & 7, v11 == 2) || v11 == 4))
  {
    int v12 = WebCore::Position::offsetForPositionAfterAnchor((WebCore::Position *)&v67);
    uint64_t v10 = v67;
  }
  else
  {
    int v12 = v68;
  }
  int v13 = v9 + 1;
  v67 = 0;
  if (v10)
  {
    if (*((_DWORD *)v10 + 7) == 2)
    {
      if ((*((_WORD *)v10 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v10);
      }
    }
    else
    {
      *((_DWORD *)v10 + 7) -= 2;
    }
  }
  if (v13 < v12)
  {
    WebCore::endOfWord();
    v14 = v67;
    if (v67) {
      *((_DWORD *)v67 + 7) += 2;
    }
    v64 = v14;
    int v65 = v68;
    char v66 = v69;
    WebCore::VisiblePosition::VisiblePosition();
    uint64_t v15 = v60;
    v60 = 0;
    uint64_t v16 = v78;
    v78 = v15;
    if (v16)
    {
      if (*((_DWORD *)v16 + 7) == 2)
      {
        if ((*((_WORD *)v16 + 17) & 0x400) == 0)
        {
          WebCore::Node::removedLastRef(v16);
          LODWORD(v79) = v61;
          BYTE4(v79) = v62;
          LOBYTE(v80) = v63;
          v60 = 0;
          goto LABEL_66;
        }
      }
      else
      {
        *((_DWORD *)v16 + 7) -= 2;
      }
    }
    LODWORD(v79) = v61;
    BYTE4(v79) = v62;
    LOBYTE(v80) = v63;
LABEL_66:
    int v30 = v64;
    v64 = 0;
    if (v30)
    {
      if (*((_DWORD *)v30 + 7) == 2)
      {
        if ((*((_WORD *)v30 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v30);
        }
      }
      else
      {
        *((_DWORD *)v30 + 7) -= 2;
      }
    }
    BOOL v28 = v67;
    v67 = 0;
    if (!v28) {
      goto LABEL_74;
    }
    int v29 = *((_DWORD *)v28 + 7) - 2;
    if (*((_DWORD *)v28 + 7) != 2) {
      goto LABEL_73;
    }
    goto LABEL_60;
  }
  WebCore::VisiblePosition::VisiblePosition();
  objc_super v17 = v67;
  v67 = 0;
  v18 = v78;
  v78 = v17;
  if (!v18) {
    goto LABEL_62;
  }
  if (*((_DWORD *)v18 + 7) != 2)
  {
    *((_DWORD *)v18 + 7) -= 2;
LABEL_62:
    LODWORD(v79) = v68;
    BYTE4(v79) = v69;
    LOBYTE(v80) = v70;
    goto LABEL_74;
  }
  if ((*((_WORD *)v18 + 17) & 0x400) != 0) {
    goto LABEL_62;
  }
  WebCore::Node::removedLastRef(v18);
  BOOL v28 = v67;
  LODWORD(v79) = v68;
  BYTE4(v79) = v69;
  LOBYTE(v80) = v70;
  v67 = 0;
  if (v28)
  {
    int v29 = *((_DWORD *)v28 + 7) - 2;
    if (*((_DWORD *)v28 + 7) != 2)
    {
LABEL_73:
      *((_DWORD *)v28 + 7) = v29;
      goto LABEL_74;
    }
LABEL_60:
    if ((*((_WORD *)v28 + 17) & 0x400) == 0) {
      WebCore::Node::removedLastRef(v28);
    }
  }
LABEL_74:
  char v31 = v71;
  v71 = 0;
  if (v31)
  {
    if (*((_DWORD *)v31 + 7) == 2)
    {
      if ((*((_WORD *)v31 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v31);
      }
    }
    else
    {
      *((_DWORD *)v31 + 7) -= 2;
    }
  }
  char v32 = v81;
  v81 = 0;
  if (v32)
  {
    if (*((_DWORD *)v32 + 7) == 2)
    {
      if ((*((_WORD *)v32 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v32);
      }
    }
    else
    {
      *((_DWORD *)v32 + 7) -= 2;
    }
  }
LABEL_84:
  v33 = v78;
  if (v78) {
    *((_DWORD *)v78 + 7) += 2;
  }
LABEL_86:
  v56 = v33;
  int v57 = v79;
  char v58 = BYTE4(v79);
  char v59 = v80;
  id v34 = +[WebVisiblePosition _wrapVisiblePositionIfValid:&v56];
  BOOL v35 = v56;
  v56 = 0;
  if (v35)
  {
    if (*((_DWORD *)v35 + 7) == 2)
    {
      if ((*((_WORD *)v35 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v35);
      }
    }
    else
    {
      *((_DWORD *)v35 + 7) -= 2;
    }
  }
  if ((v3 & 1) == 0)
  {
    if (*((_DWORD *)v2 + 7) == 2)
    {
      if ((*((_WORD *)v2 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v2);
      }
    }
    else
    {
      *((_DWORD *)v2 + 7) -= 2;
    }
  }
  v36 = v78;
  v78 = 0;
  if (v36)
  {
    if (*((_DWORD *)v36 + 7) == 2)
    {
      if ((*((_WORD *)v36 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v36);
      }
    }
    else
    {
      *((_DWORD *)v36 + 7) -= 2;
    }
  }
  return v34;
}

- (BOOL)isEditable
{
  if (self)
  {
    [(WebVisiblePosition *)self _visiblePosition];
    v2 = v5;
    if (v5) {
      *((_DWORD *)v5 + 7) += 2;
    }
  }
  else
  {
    v2 = 0;
    UChar32 v5 = 0;
  }
  uint64_t v6 = v2;
  char isEditablePosition = WebCore::isEditablePosition();
  if (v6)
  {
    if (*((_DWORD *)v6 + 7) == 2)
    {
      if ((*((_WORD *)v6 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v6);
      }
    }
    else
    {
      *((_DWORD *)v6 + 7) -= 2;
    }
  }
  if (!v5) {
    return isEditablePosition;
  }
  if (*((_DWORD *)v5 + 7) != 2)
  {
    *((_DWORD *)v5 + 7) -= 2;
    return isEditablePosition;
  }
  if ((*((_WORD *)v5 + 17) & 0x400) != 0) {
    return isEditablePosition;
  }
  WebCore::Node::removedLastRef(v5);
  return isEditablePosition;
}

- (BOOL)requiresContextForWordBoundary
{
  if (self) {
    [(WebVisiblePosition *)self _visiblePosition];
  }
  else {
    memset(v10, 0, sizeof(v10));
  }
  UChar32 v2 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)v10);
  unsigned int IntPropertyValue = u_getIntPropertyValue(v2, UCHAR_LINE_BREAK);
  if (IntPropertyValue <= 0x25 && ((1 << IntPropertyValue) & 0x2001004000) != 0)
  {
    BOOL v4 = 1;
    UChar32 v5 = v10[0];
    v10[0] = 0;
    if (!v5) {
      return v4;
    }
  }
  else
  {
    WebCore::VisiblePosition::previous();
    UChar32 v6 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v11);
    uint64_t v7 = v11;
    int v11 = 0;
    if (v7)
    {
      if (*((_DWORD *)v7 + 7) == 2)
      {
        if ((*((_WORD *)v7 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v7);
        }
      }
      else
      {
        *((_DWORD *)v7 + 7) -= 2;
      }
    }
    unsigned int v8 = u_getIntPropertyValue(v6, UCHAR_LINE_BREAK);
    if (v8 <= 0x25) {
      BOOL v4 = (0x2001004000uLL >> v8) & 1;
    }
    else {
      BOOL v4 = 0;
    }
    UChar32 v5 = v10[0];
    v10[0] = 0;
    if (!v5) {
      return v4;
    }
  }
  if (*((_DWORD *)v5 + 7) != 2)
  {
    *((_DWORD *)v5 + 7) -= 2;
    return v4;
  }
  if ((*((_WORD *)v5 + 17) & 0x400) != 0) {
    return v4;
  }
  WebCore::Node::removedLastRef(v5);
  return v4;
}

- (BOOL)atAlphaNumericBoundaryInDirection:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (_MergedGlobals_26)
  {
    if (self)
    {
LABEL_3:
      [(WebVisiblePosition *)self _visiblePosition];
      goto LABEL_6;
    }
  }
  else
  {
    qword_1EB3A9888 = (uint64_t)CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
    _MergedGlobals_26 = 1;
    if (self) {
      goto LABEL_3;
    }
  }
  memset(v15, 0, sizeof(v15));
LABEL_6:
  WebCore::VisiblePosition::previous();
  UniChar v5 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v16);
  UChar32 v6 = v16;
  uint64_t v16 = 0;
  if (v6)
  {
    if (*((_DWORD *)v6 + 7) == 2)
    {
      if ((*((_WORD *)v6 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v6);
      }
    }
    else
    {
      *((_DWORD *)v6 + 7) -= 2;
    }
  }
  UniChar v7 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)v15);
  int IsCharacterMember = CFCharacterSetIsCharacterMember((CFCharacterSetRef)qword_1EB3A9888, v5);
  int v9 = CFCharacterSetIsCharacterMember((CFCharacterSetRef)qword_1EB3A9888, v7);
  BOOL v10 = [(WebVisiblePosition *)self directionIsDownstream:v3];
  if (v10) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = v9 != 0;
  }
  if (v10) {
    BOOL v12 = IsCharacterMember != 0;
  }
  else {
    BOOL v12 = IsCharacterMember == 0;
  }
  int v13 = v15[0];
  v15[0] = 0;
  if (v13)
  {
    if (*((_DWORD *)v13 + 7) == 2)
    {
      if ((*((_WORD *)v13 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v13);
      }
    }
    else
    {
      *((_DWORD *)v13 + 7) -= 2;
    }
  }
  return v12 && v11;
}

- (id)enclosingRangeWithDictationPhraseAlternatives:(id *)a3
{
  if (!a3) {
    return 0;
  }
  *a3 = 0;
  if (!self) {
    return 0;
  }
  [(WebVisiblePosition *)self _visiblePosition];
  BOOL v4 = (DOMObjectInternal *)v38;
  if (v38)
  {
    int v5 = v38[7];
    v38[7] = v5 + 2;
    if (v5)
    {
      *((_DWORD *)v4 + 7) = v5;
    }
    else
    {
      if ((*((_WORD *)v4 + 17) & 0x400) == 0)
      {
        WebCore::Node::removedLastRef(v4);
        UChar32 v6 = v38;
        if (!v38)
        {
LABEL_13:
          CFTypeRef cf = v6;
          unsigned int v30 = v39;
          char v31 = v40;
          if ((v40 & 8) == 0 && ((v7 = v31 & 7, v7 != 2) ? (BOOL v8 = v7 == 4) : (BOOL v8 = 1), v8))
          {
            unsigned int v9 = WebCore::Position::offsetForPositionAfterAnchor((WebCore::Position *)&cf);
            UChar32 v6 = (void *)cf;
          }
          else
          {
            unsigned int v9 = v30;
          }
          CFTypeRef cf = 0;
          if (v6)
          {
            if (*((_DWORD *)v6 + 7) == 2)
            {
              if ((*((_WORD *)v6 + 17) & 0x400) == 0) {
                WebCore::Node::removedLastRef((WebCore::Node *)v6);
              }
            }
            else
            {
              *((_DWORD *)v6 + 7) -= 2;
            }
          }
          if (!*(void *)(*(void *)(*((void *)v4 + 6) + 8) + 1536)) {
            WebCore::Document::ensureMarkers(*(WebCore::Document **)(*((void *)v4 + 6) + 8));
          }
          WebCore::DocumentMarkerController::markersFor();
          BOOL v11 = v35;
          unsigned int v12 = v37;
          if (!v37)
          {
            BOOL v4 = 0;
LABEL_63:
            if (v11)
            {
              BOOL v35 = 0;
              int v36 = 0;
              WTF::fastFree(v11, v10);
            }
            UTF32Char v23 = v38;
            UTF32Char v38 = 0;
            if (v23)
            {
              if (v23[7] == 2)
              {
                if ((*((_WORD *)v23 + 17) & 0x400) == 0) {
                  WebCore::Node::removedLastRef((WebCore::Node *)v23);
                }
              }
              else
              {
                v23[7] -= 2;
              }
            }
            return v4;
          }
          uint64_t v13 = 0;
          while (1)
          {
            uint64_t v14 = *(void *)((char *)v35 + v13);
            if (v14)
            {
              uint64_t v15 = *(_DWORD **)(v14 + 8);
              if (v15[3] <= v9 && v15[4] >= v9) {
                break;
              }
            }
            v13 += 8;
            if (8 * v37 == v13)
            {
              BOOL v4 = 0;
              goto LABEL_56;
            }
          }
          if (v15[20] != 2)
          {
            id result = (id)std::__throw_bad_variant_access[abi:sn180100]();
            __break(1u);
            return result;
          }
          WTF::createNSArray<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&>((uint64_t)(v15 + 8), (uint64_t *)&cf);
          CFTypeRef v16 = cf;
          CFTypeRef cf = 0;
          *a3 = (id)(id)CFMakeCollectable(v16);
          CFTypeRef v17 = cf;
          CFTypeRef cf = 0;
          if (v17) {
            CFRelease(v17);
          }
          WebCore::makeSimpleRange();
          CFTypeRef cf = v25;
          unsigned int v30 = v26;
          char v32 = v27;
          int v33 = v28;
          char v34 = 1;
          WebCore::createLiveRange();
          BOOL v4 = kit(v41);
          v18 = v41;
          v41 = 0;
          if (v18)
          {
            if (*((_DWORD *)v18 + 2) == 1)
            {
              (*(void (**)(DOMObjectInternal *))(*(void *)v18 + 8))(v18);
              if (!v34)
              {
LABEL_55:
                unsigned int v12 = v37;
                BOOL v11 = v35;
                if (!v37) {
                  goto LABEL_63;
                }
LABEL_56:
                uint64_t v21 = 8 * v12;
                do
                {
                  while (1)
                  {
                    CFCharacterSetRef v22 = *(atomic_uint **)v11;
                    *(void *)BOOL v11 = 0;
                    if (v22)
                    {
                      if (atomic_fetch_add(v22, 0xFFFFFFFF) == 1) {
                        break;
                      }
                    }
                    BOOL v11 = (WTF *)((char *)v11 + 8);
                    v21 -= 8;
                    if (!v21) {
                      goto LABEL_62;
                    }
                  }
                  atomic_store(1u, (unsigned int *)v22);
                  WTF::fastFree((WTF *)v22, v10);
                  BOOL v11 = (WTF *)((char *)v11 + 8);
                  v21 -= 8;
                }
                while (v21);
LABEL_62:
                BOOL v11 = v35;
                goto LABEL_63;
              }
LABEL_45:
              UTF32Char v19 = v32;
              char v32 = 0;
              if (v19)
              {
                if (*((_DWORD *)v19 + 7) == 2)
                {
                  if ((*((_WORD *)v19 + 17) & 0x400) == 0) {
                    WebCore::Node::removedLastRef(v19);
                  }
                }
                else
                {
                  *((_DWORD *)v19 + 7) -= 2;
                }
              }
              v20 = (WebCore::Node *)cf;
              CFTypeRef cf = 0;
              if (v20)
              {
                if (*((_DWORD *)v20 + 7) == 2)
                {
                  if ((*((_WORD *)v20 + 17) & 0x400) == 0) {
                    WebCore::Node::removedLastRef(v20);
                  }
                }
                else
                {
                  *((_DWORD *)v20 + 7) -= 2;
                }
              }
              goto LABEL_55;
            }
            --*((_DWORD *)v18 + 2);
          }
          if (!v34) {
            goto LABEL_55;
          }
          goto LABEL_45;
        }
        int v5 = v38[7];
LABEL_12:
        *((_DWORD *)v6 + 7) = v5 + 2;
        goto LABEL_13;
      }
      int v5 = 2;
    }
    UChar32 v6 = v4;
    goto LABEL_12;
  }
  return v4;
}

- (id)enclosingRangeWithCorrectionIndicator
{
  if (!self) {
    return 0;
  }
  [(WebVisiblePosition *)self _visiblePosition];
  UChar32 v2 = (DOMObjectInternal *)v33;
  if (v33)
  {
    int v3 = v33[7];
    v33[7] = v3 + 2;
    if (v3)
    {
      *((_DWORD *)v2 + 7) = v3;
    }
    else
    {
      if ((*((_WORD *)v2 + 17) & 0x400) == 0)
      {
        WebCore::Node::removedLastRef(v2);
        BOOL v4 = (WebCore::Node *)v33;
        if (!v33)
        {
LABEL_12:
          v24 = v4;
          unsigned int v25 = v34;
          char v26 = v35;
          if ((v35 & 8) == 0 && ((int v5 = v26 & 7, v5 != 2) ? (v6 = v5 == 4) : (v6 = 1), v6))
          {
            unsigned int v7 = WebCore::Position::offsetForPositionAfterAnchor((WebCore::Position *)&v24);
            BOOL v4 = v24;
          }
          else
          {
            unsigned int v7 = v25;
          }
          v24 = 0;
          if (v4)
          {
            if (*((_DWORD *)v4 + 7) == 2)
            {
              if ((*((_WORD *)v4 + 17) & 0x400) == 0) {
                WebCore::Node::removedLastRef(v4);
              }
            }
            else
            {
              *((_DWORD *)v4 + 7) -= 2;
            }
          }
          if (!*(void *)(*(void *)(*((void *)v2 + 6) + 8) + 1536)) {
            WebCore::Document::ensureMarkers(*(WebCore::Document **)(*((void *)v2 + 6) + 8));
          }
          WebCore::DocumentMarkerController::markersFor();
          unsigned int v9 = v30;
          unsigned int v10 = v32;
          if (!v32)
          {
            UChar32 v2 = 0;
LABEL_59:
            if (v9)
            {
              unsigned int v30 = 0;
              int v31 = 0;
              WTF::fastFree(v9, v8);
            }
            v18 = v33;
            int v33 = 0;
            if (v18)
            {
              if (v18[7] == 2)
              {
                if ((*((_WORD *)v18 + 17) & 0x400) == 0) {
                  WebCore::Node::removedLastRef((WebCore::Node *)v18);
                }
              }
              else
              {
                v18[7] -= 2;
              }
            }
            return v2;
          }
          uint64_t v11 = 0;
          while (1)
          {
            uint64_t v12 = *(void *)((char *)v30 + v11);
            if (v12)
            {
              BOOL v8 = *(_DWORD **)(v12 + 8);
              if (v8[3] <= v7 && v8[4] >= v7) {
                break;
              }
            }
            v11 += 8;
            if (8 * v32 == v11)
            {
              UChar32 v2 = 0;
              goto LABEL_52;
            }
          }
          WebCore::makeSimpleRange();
          v24 = v20;
          unsigned int v25 = v21;
          char v27 = v22;
          int v28 = v23;
          char v29 = 1;
          WebCore::createLiveRange();
          UChar32 v2 = kit(v36);
          uint64_t v13 = v36;
          int v36 = 0;
          if (v13)
          {
            if (*((_DWORD *)v13 + 2) == 1)
            {
              (*(void (**)(DOMObjectInternal *))(*(void *)v13 + 8))(v13);
              if (!v29)
              {
LABEL_51:
                unsigned int v10 = v32;
                unsigned int v9 = v30;
                if (!v32) {
                  goto LABEL_59;
                }
LABEL_52:
                uint64_t v16 = 8 * v10;
                do
                {
                  while (1)
                  {
                    CFTypeRef v17 = *(atomic_uint **)v9;
                    *(void *)unsigned int v9 = 0;
                    if (v17)
                    {
                      if (atomic_fetch_add(v17, 0xFFFFFFFF) == 1) {
                        break;
                      }
                    }
                    unsigned int v9 = (WTF *)((char *)v9 + 8);
                    v16 -= 8;
                    if (!v16) {
                      goto LABEL_58;
                    }
                  }
                  atomic_store(1u, (unsigned int *)v17);
                  WTF::fastFree((WTF *)v17, v8);
                  unsigned int v9 = (WTF *)((char *)v9 + 8);
                  v16 -= 8;
                }
                while (v16);
LABEL_58:
                unsigned int v9 = v30;
                goto LABEL_59;
              }
LABEL_41:
              uint64_t v14 = v27;
              char v27 = 0;
              if (v14)
              {
                if (*((_DWORD *)v14 + 7) == 2)
                {
                  if ((*((_WORD *)v14 + 17) & 0x400) == 0) {
                    WebCore::Node::removedLastRef(v14);
                  }
                }
                else
                {
                  *((_DWORD *)v14 + 7) -= 2;
                }
              }
              uint64_t v15 = v24;
              v24 = 0;
              if (v15)
              {
                if (*((_DWORD *)v15 + 7) == 2)
                {
                  if ((*((_WORD *)v15 + 17) & 0x400) == 0) {
                    WebCore::Node::removedLastRef(v15);
                  }
                }
                else
                {
                  *((_DWORD *)v15 + 7) -= 2;
                }
              }
              goto LABEL_51;
            }
            --*((_DWORD *)v13 + 2);
          }
          if (!v29) {
            goto LABEL_51;
          }
          goto LABEL_41;
        }
        int v3 = v33[7];
LABEL_11:
        *((_DWORD *)v4 + 7) = v3 + 2;
        goto LABEL_12;
      }
      int v3 = 2;
    }
    BOOL v4 = v2;
    goto LABEL_11;
  }
  return v2;
}

- (unint64_t)affinity
{
  if (!self) {
    return 0;
  }
  [(WebVisiblePosition *)self _visiblePosition];
  UChar32 v2 = v5;
  unsigned int v3 = v6;
  int v5 = 0;
  if (!v2) {
    return v3;
  }
  if (*((_DWORD *)v2 + 7) != 2)
  {
    *((_DWORD *)v2 + 7) -= 2;
    return v3;
  }
  if ((*((_WORD *)v2 + 17) & 0x400) != 0) {
    return v3;
  }
  WebCore::Node::removedLastRef(v2);
  return v3;
}

- (void)setAffinity:(unint64_t)a3
{
  *((unsigned char *)self->_internal + 16) = a3 != 0;
}

@end