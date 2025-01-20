@interface WBShading
+ (CsColour)fixedUpVersionOfColor:(CsColour)a3;
+ (void)readFrom:(WrdShading *)a3 to:(id)a4;
+ (void)setToSolidWhite:(id)a3;
+ (void)write:(id)a3 to:(WrdShading *)a4;
@end

@implementation WBShading

+ (void)readFrom:(WrdShading *)a3 to:(id)a4
{
  id v6 = a4;
  if (a3 && v6)
  {
    id v13 = v6;
    [v6 setStyle:a3->var1];
    if (a3->var2)
    {
      if (a3->var1 != 0xFFFF
        || (transparentWhite(), a3->var3.var0 != (unsigned __int16)transparentWhite(void)::transparentWhite)
        || __PAIR64__(a3->var3.var2, a3->var3.var1) != __PAIR64__(WORD2(transparentWhite(void)::transparentWhite), WORD1(transparentWhite(void)::transparentWhite))|| a3->var3.var3 != HIWORD(transparentWhite(void)::transparentWhite)|| (transparentWhite(), a3->var4.var0 != (unsigned __int16)transparentWhite(void)::transparentWhite)|| __PAIR64__(a3->var4.var2, a3->var4.var1) != __PAIR64__(WORD2(transparentWhite(void)::transparentWhite), WORD1(transparentWhite(void)::transparentWhite))|| a3->var4.var3 != HIWORD(transparentWhite(void)::transparentWhite))
      {
        transparentBlack();
        p_var3 = &a3->var3;
        if (a3->var3.var0 == (unsigned __int16)transparentBlack(void)::transparentBlack
          && __PAIR64__(a3->var3.var2, a3->var3.var1) == __PAIR64__(WORD2(transparentBlack(void)::transparentBlack), WORD1(transparentBlack(void)::transparentBlack))&& a3->var3.var3 == HIWORD(transparentBlack(void)::transparentBlack))
        {
          v8 = +[WDShading autoForegroundColor];
          [v13 setForeground:v8];
        }
        else
        {
          v8 = +[OITSUColor colorWithCsColour:p_var3];
          [v13 setForeground:v8];
        }

        transparentBlack();
        p_var4 = &a3->var4;
        if (a3->var4.var0 == (unsigned __int16)transparentBlack(void)::transparentBlack
          && __PAIR64__(a3->var4.var2, a3->var4.var1) == __PAIR64__(WORD2(transparentBlack(void)::transparentBlack), WORD1(transparentBlack(void)::transparentBlack))&& a3->var4.var3 == HIWORD(transparentBlack(void)::transparentBlack))
        {
          v10 = +[WDShading autoBackgroundColor];
          [v13 setBackground:v10];
        }
        else
        {
          v10 = +[OITSUColor colorWithCsColour:p_var4];
          [v13 setBackground:v10];
        }
        goto LABEL_21;
      }
      goto LABEL_29;
    }
    id v6 = v13;
    if (!a3->var5) {
      goto LABEL_22;
    }
    int var6 = a3->var6;
    if (a3->var1 == 0xFFFF && var6 == 31)
    {
      if (a3->var7 == 31)
      {
LABEL_29:
        [a1 setToSolidWhite:v13];
        id v6 = v13;
        goto LABEL_22;
      }
    }
    else if (!var6)
    {
      v12 = +[WDShading autoForegroundColor];
      [v13 setForeground:v12];
      goto LABEL_33;
    }
    v12 = +[OITSUColor colorWithCsColour:&a3->var3];
    [v13 setForeground:v12];
LABEL_33:

    if (a3->var7) {
      +[OITSUColor colorWithCsColour:&a3->var4];
    }
    else {
    v10 = +[WDShading autoBackgroundColor];
    }
    [v13 setBackground:v10];
LABEL_21:

    id v6 = v13;
  }
LABEL_22:
}

+ (void)setToSolidWhite:(id)a3
{
  id v5 = a3;
  [v5 setStyle:1];
  v3 = +[OITSUColor whiteColor];
  [v5 setForeground:v3];

  v4 = +[OITSUColor whiteColor];
  [v5 setBackground:v4];
}

+ (CsColour)fixedUpVersionOfColor:(CsColour)a3
{
  uint64_t v4 = v3;
  int v5 = *(unsigned __int16 *)a3.var0;
  *(_WORD *)(v4 + 2) = *(_WORD *)(*(void *)&a3 + 2);
  *(_DWORD *)(v4 + 4) = *(_DWORD *)(*(void *)&a3 + 4);
  if (v5)
  {
    __int16 v6 = 255;
  }
  else
  {
    transparentBlack();
    __int16 v6 = transparentBlack(void)::transparentBlack;
    *(_WORD *)(v4 + 2) = WORD1(transparentBlack(void)::transparentBlack);
    *(_DWORD *)(v4 + 4) = HIDWORD(transparentBlack(void)::transparentBlack);
  }
  *(_WORD *)uint64_t v4 = v6;
  return (CsColour)a1;
}

+ (void)write:(id)a3 to:(WrdShading *)a4
{
  id v6 = a3;
  v7 = v6;
  if (v6 && a4)
  {
    a4->var1 = [v6 style];
    v8 = [v7 foreground];

    if (v8)
    {
      v9 = [v7 foreground];
      v10 = +[WDShading autoForegroundColor];

      if (v9 == v10)
      {
        transparentBlack();
        a4->var3 = (CsColour)transparentBlack(void)::transparentBlack;
      }
      else
      {
        v11 = [v7 foreground];
        v12 = v11;
        if (v11) {
          [v11 csColour];
        }
        else {
          uint64_t v19 = 0;
        }
        [a1 fixedUpVersionOfColor:&v19];
        a4->var3 = v20;
      }
    }
    id v13 = [v7 background];

    if (v13)
    {
      v14 = [v7 background];
      v15 = +[WDShading autoBackgroundColor];

      if (v14 == v15)
      {
        transparentBlack();
        a4->var4 = (CsColour)transparentBlack(void)::transparentBlack;
      }
      else
      {
        v16 = [v7 background];
        v17 = v16;
        if (v16) {
          [v16 csColour];
        }
        else {
          uint64_t v18 = 0;
        }
        [a1 fixedUpVersionOfColor:&v18];
        a4->var4 = v20;
      }
    }
  }
}

@end