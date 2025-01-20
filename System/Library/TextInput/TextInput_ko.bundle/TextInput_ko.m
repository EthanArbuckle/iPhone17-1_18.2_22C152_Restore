BOOL Hangul2SetAutomata::SendUniChar(Hangul2SetAutomata *this, HangulSyllable *a2, BOOL *a3)
{
  HangulSyllable *v4;
  int JamoType;
  int v7;
  int v8;
  int v9;
  unsigned __int16 v10;
  int v11;
  int v12;
  int v13;
  int v14;
  unsigned __int16 v15;
  int var2;
  BOOL CanCompose;
  int v18;
  unsigned __int16 v19;
  int v20;
  unsigned __int16 v21;
  unsigned __int16 v22;
  int var1;
  HangulSyllable *v24;
  HangulSyllable *v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  HangulSyllable *p_var5;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  __CFString *v39;
  __CFString *var4;
  __CFString *v41;
  __CFString *v42;
  int v44;
  __CFString *v45;
  HangulSyllable chars;
  HangulSyllable v47;

  v4 = a2;
  *(_DWORD *)&v47.var0 = 0;
  v47.var2 = 0;
  *a3 = 0;
  JamoType = HangulSyllable::GetJamoType(a2);
  v7 = JamoType;
  if (JamoType == -1)
  {
    *a3 = 1;
    Hangul2SetAutomata::Reset(this);
    return v7 != -1;
  }
  switch(this->var3)
  {
    case 0:
      if (JamoType == 1) {
        v11 = 0;
      }
      else {
        v11 = (int)v4;
      }
      if (JamoType == 1)
      {
        v12 = 1;
      }
      else
      {
        LODWORD(v4) = 0;
        v12 = 2;
      }
      HangulSyllable::SetCho(&this->var5, v11);
      HangulSyllable::SetJung(&this->var5, (int)v4);
      HangulSyllable::SetJong(&this->var5, 0);
      this->var3 = v12;
      *(_DWORD *)&this->var1 = 1;
      goto LABEL_61;
    case 1:
      if (JamoType != 1) {
        goto LABEL_46;
      }
      v13 = HangulSyllable::DoubleJung((HangulSyllable *)this->var5.var1, (int)v4, this->var7);
      if (!v13) {
        goto LABEL_59;
      }
      v14 = v13;
      HangulSyllable::SetCho(&chars, 0);
      HangulSyllable::SetJung(&chars, v14);
      HangulSyllable::SetJong(&chars, 0);
      if (HangulSyllable::CanCompose(&chars))
      {
        v15 = 1;
        this->var3 = 1;
        HangulSyllable::Set(&this->var5, 0, v14, 0);
      }
      else
      {
        HangulSyllable::SetJung(&v47, (int)v4);
        v15 = 0;
        this->var3 = 1;
        *a3 = 1;
      }
      this->var2 = v15;
      goto LABEL_52;
    case 2:
      if (JamoType != 1) {
        goto LABEL_46;
      }
      var2 = this->var5.var2;
      HangulSyllable::SetCho(&this->var6, this->var5.var0);
      HangulSyllable::SetJung(&this->var6, (int)v4);
      HangulSyllable::SetJong(&this->var6, var2);
      CanCompose = HangulSyllable::CanCompose(&this->var6);
      if (v4 != 12685 && !CanCompose) {
        goto LABEL_59;
      }
      if (v4 == 12685) {
        v18 = 6;
      }
      else {
        v18 = 3;
      }
      this->var3 = v18;
      HangulSyllable::SetJung(&this->var5, this->var6.var1);
      HangulSyllable::SetJong(&this->var5, 0);
      v19 = this->var3 != 6;
      goto LABEL_51;
    case 3:
    case 6:
      if (JamoType != 1)
      {
        var1 = this->var5.var1;
        HangulSyllable::SetCho(&chars, this->var5.var0);
        HangulSyllable::SetJung(&chars, var1);
        HangulSyllable::SetJong(&chars, (int)v4);
        if (HangulSyllable::NormalizeJong(v4) && HangulSyllable::CanCompose(&chars))
        {
          HangulSyllable::SetJong(&this->var5, (int)v4);
          this->var3 = 4;
          v19 = 1;
        }
        else
        {
          HangulSyllable::SetCho(&v47, (int)v4);
          v19 = 0;
          this->var3 = 2;
          *a3 = 1;
        }
        goto LABEL_51;
      }
      v8 = HangulSyllable::DoubleJung((HangulSyllable *)this->var5.var1, (int)v4, this->var7);
      if (!v8) {
        goto LABEL_59;
      }
      v9 = v8;
      HangulSyllable::SetCho(&this->var6, this->var5.var0);
      HangulSyllable::SetJung(&this->var6, v9);
      HangulSyllable::SetJong(&this->var6, 0);
      if (HangulSyllable::CanCompose(&this->var6))
      {
        if (this->var3 == 6) {
          v10 = 2;
        }
        else {
          v10 = 1;
        }
        this->var2 = v10;
        this->var1 = 1;
        this->var3 = 3;
        *(_DWORD *)&this->var5.var0 = *(_DWORD *)&this->var6.var0;
        this->var5.var2 = this->var6.var2;
      }
      else
      {
        if (v4 != 12685) {
          goto LABEL_59;
        }
        *(_DWORD *)&this->var1 = 65537;
        HangulSyllable::SetJung(&this->var5, this->var6.var1);
        HangulSyllable::SetJong(&this->var5, 0);
        this->var3 = 6;
      }
      goto LABEL_61;
    case 4:
      if (JamoType == 1)
      {
        v20 = HangulSyllable::MapChoAndJong((HangulSyllable *)this->var5.var2);
        HangulSyllable::SetCho(&chars, v20);
        HangulSyllable::SetJung(&chars, (int)v4);
        HangulSyllable::SetJong(&chars, 0);
        if (HangulSyllable::CanCompose(&chars))
        {
          v47 = chars;
          HangulSyllable::SetJong(&this->var5, 0);
          this->var3 = 3;
          v21 = 1;
          *a3 = 1;
          v22 = 2;
        }
        else if (v4 == 12685)
        {
          HangulSyllable::SetJong(&this->var5, 0);
          HangulSyllable::SetCho(&v47, chars.var0);
          HangulSyllable::SetJung(&v47, 12685);
          this->var3 = 6;
          v22 = 2;
          v21 = 1;
        }
        else
        {
          HangulSyllable::SetJung(&v47, (int)v4);
          v21 = 0;
          v22 = 1;
          this->var3 = 1;
          *a3 = 1;
        }
        this->var2 = v21;
        goto LABEL_53;
      }
      v28 = HangulSyllable::DoubleJong((HangulSyllable *)this->var5.var2, (int)v4);
      if (!v28) {
        goto LABEL_46;
      }
      v29 = v28;
      v30 = this->var5.var1;
      HangulSyllable::SetCho(&chars, this->var5.var0);
      HangulSyllable::SetJung(&chars, v30);
      HangulSyllable::SetJong(&chars, v29);
      if (HangulSyllable::CanCompose(&chars))
      {
        p_var5 = &this->var5;
        v32 = v29;
        goto LABEL_45;
      }
      goto LABEL_49;
    case 5:
      v24 = (HangulSyllable *)this->var5.var2;
      if (v7 == 1)
      {
        v25 = (HangulSyllable *)HangulSyllable::JongRightHalf(v24);
        v26 = HangulSyllable::MapChoAndJong(v25);
        HangulSyllable::SetCho(&chars, v26);
        HangulSyllable::SetJung(&chars, (int)v4);
        HangulSyllable::SetJong(&chars, 0);
        if (HangulSyllable::CanCompose(&chars))
        {
          v27 = 3;
LABEL_58:
          this->var3 = v27;
          v37 = HangulSyllable::JongLeftHalf((HangulSyllable *)this->var5.var2);
          HangulSyllable::SetJong(&this->var5, v37);
          v47 = chars;
          *(_DWORD *)&this->var1 = 65538;
          *a3 = 1;
          goto LABEL_61;
        }
        if (v4 == 12685)
        {
          v27 = 6;
          goto LABEL_58;
        }
LABEL_59:
        HangulSyllable::SetJung(&v47, (int)v4);
        this->var3 = 1;
        goto LABEL_60;
      }
      v33 = HangulSyllable::DoubleJong(v24, (int)v4);
      if (!v33)
      {
LABEL_46:
        HangulSyllable::SetCho(&v47, (int)v4);
        this->var3 = 2;
LABEL_60:
        *a3 = 1;
        *(_DWORD *)&this->var1 = 1;
        goto LABEL_61;
      }
      v34 = v33;
      v35 = this->var5.var1;
      HangulSyllable::SetCho(&chars, this->var5.var0);
      HangulSyllable::SetJung(&chars, v35);
      HangulSyllable::SetJong(&chars, v34);
      if (HangulSyllable::CanCompose(&chars))
      {
        p_var5 = &this->var5;
        v32 = v34;
LABEL_45:
        HangulSyllable::SetJong(p_var5, v32);
        v19 = 1;
        v36 = 5;
      }
      else
      {
LABEL_49:
        HangulSyllable::SetCho(&v47, (int)v4);
        v19 = 0;
        *a3 = 1;
        v36 = 2;
      }
      this->var3 = v36;
LABEL_51:
      this->var2 = v19;
LABEL_52:
      v22 = 1;
LABEL_53:
      this->var1 = v22;
LABEL_61:
      v38 = this->var1;
      if (v38 == 2)
      {
        Hangul2SetAutomata::ClearOutputString(this);
        chars.var0 = HangulSyllable::GetUnicode(&this->var5);
        var4 = this->var4;
        if (var4) {
          CFStringAppendCharacters(var4, &chars.var0, 1);
        }
        if (this->var3 == 6)
        {
          chars.var0 = v47.var0;
          v41 = this->var4;
          if (!v41) {
            goto LABEL_75;
          }
          CFStringAppendCharacters(v41, &chars.var0, 1);
          v42 = this->var4;
          chars.var0 = v47.var1;
          if (!v42) {
            goto LABEL_75;
          }
        }
        else
        {
          chars.var0 = HangulSyllable::GetUnicode(&v47);
          v42 = this->var4;
          if (!v42)
          {
LABEL_75:
            this->var5 = v47;
            return v7 != -1;
          }
        }
        CFStringAppendCharacters(v42, &chars.var0, 1);
        goto LABEL_75;
      }
      if (v38 == 1)
      {
        Hangul2SetAutomata::ClearOutputString(this);
        if (*a3)
        {
          chars.var0 = HangulSyllable::GetUnicode(&v47);
          v39 = this->var4;
          if (v39) {
            CFStringAppendCharacters(v39, &chars.var0, 1);
          }
          this->var5 = v47;
        }
        else
        {
          if (this->var3 == 6)
          {
            v44 = this->var5.var1;
            if (v44 == 4510) {
              LOWORD(v44) = HangulSyllable::JungToCompatibility((HangulSyllable *)0x119E);
            }
          }
          else
          {
            LOWORD(v44) = HangulSyllable::GetUnicode(&this->var5);
          }
          chars.var0 = v44;
          v45 = this->var4;
          if (v45) {
            CFStringAppendCharacters(v45, &chars.var0, 1);
          }
        }
      }
      return v7 != -1;
    default:
      goto LABEL_61;
  }
}

void Hangul2SetAutomata::Reset(Hangul2SetAutomata *this)
{
  *(_DWORD *)&this->var1 = 0;
  this->var3 = 0;
  p_var5 = &this->var5;
  HangulSyllable::SetCho(&this->var5, 0);
  HangulSyllable::SetJung(p_var5, 0);
  HangulSyllable::SetJong(p_var5, 0);

  Hangul2SetAutomata::ClearOutputString(this);
}

HangulSyllable *HangulSyllable::Set(HangulSyllable *this, int a2, int a3, int a4)
{
  HangulSyllable::SetCho(this, a2);
  HangulSyllable::SetJung(this, a3);

  return HangulSyllable::SetJong(this, a4);
}

void Hangul2SetAutomata::ClearOutputString(Hangul2SetAutomata *this)
{
  var4 = this->var4;
  if (var4)
  {
    uint64_t Length = CFStringGetLength(var4);
    if (Length >= 1)
    {
      v5.length = Length;
      v4 = this->var4;
      v5.location = 0;
      CFStringDelete(v4, v5);
    }
  }
}

void Hangul2SetAutomata::AppendCharToOutput(Hangul2SetAutomata *this, UniChar a2)
{
  UniChar chars = a2;
  var4 = this->var4;
  if (var4) {
    CFStringAppendCharacters(var4, &chars, 1);
  }
}

uint64_t Hangul2SetAutomata::HandleDelete(Hangul2SetAutomata *this)
{
  int var3 = this->var3;
  switch(var3)
  {
    case 0:
      int var3 = 0;
      this->var0 = 1;
      break;
    case 1:
      p_var5 = &this->var5;
      int v4 = HangulSyllable::VowelLeftHalf((HangulSyllable *)this->var5.var1);
      HangulSyllable::SetCho(&this->var5, 0);
      if (!v4) {
        goto LABEL_15;
      }
      HangulSyllable::SetJung(&this->var5, v4);
      HangulSyllable::SetJong(&this->var5, 0);
      int v5 = 1;
      goto LABEL_18;
    case 2:
      p_var5 = &this->var5;
      int v6 = HangulSyllable::ChoLeftHalf((HangulSyllable *)this->var5.var0);
      if (v6)
      {
        HangulSyllable::SetCho(&this->var5, v6);
LABEL_13:
        HangulSyllable::SetJung(p_var5, 0);
        HangulSyllable::SetJong(p_var5, 0);
        int var3 = 2;
        this->int var3 = 2;
        int v9 = 65537;
      }
      else
      {
        HangulSyllable::SetCho(&this->var5, 0);
LABEL_15:
        HangulSyllable::SetJung(p_var5, 0);
        HangulSyllable::SetJong(p_var5, 0);
        int var3 = 0;
        this->int var3 = 0;
        int v9 = 0x10000;
      }
      *(_DWORD *)&this->var1 = v9;
      break;
    case 3:
      int v7 = HangulSyllable::VowelLeftHalf((HangulSyllable *)this->var5.var1);
      if (v7)
      {
        HangulSyllable::SetJung(&this->var5, v7);
LABEL_10:
        int v5 = 3;
      }
      else
      {
        HangulSyllable::SetJung(&this->var5, 0);
        HangulSyllable::SetJong(&this->var5, 0);
        int v5 = 2;
      }
LABEL_18:
      this->int var3 = v5;
      *(_DWORD *)&this->var1 = 65537;
      int var3 = 2;
      break;
    case 4:
      HangulSyllable::SetJong(&this->var5, 0);
      goto LABEL_10;
    case 5:
      int v8 = HangulSyllable::JongLeftHalf((HangulSyllable *)this->var5.var2);
      HangulSyllable::SetJong(&this->var5, v8);
      int v5 = 4;
      goto LABEL_18;
    case 6:
      p_var5 = &this->var5;
      goto LABEL_13;
    default:
      break;
  }
  if (this->var1 == 1)
  {
    Hangul2SetAutomata::ClearOutputString(this);
    UniChar chars = HangulSyllable::GetUnicode(&this->var5);
    var4 = this->var4;
    if (var4) {
      CFStringAppendCharacters(var4, &chars, 1);
    }
  }
  else if (!var3)
  {
    Hangul2SetAutomata::ClearOutputString(this);
  }
  return 1;
}

void Hangul2SetAutomata::Hangul2SetAutomata(Hangul2SetAutomata *this)
{
  this->var0 = 0;
  *(_DWORD *)&this->var1 = 0;
  this->int var3 = 0;
  this->var4 = 0;
  *(void *)&this->var5.var0 = 0;
  *(void *)((char *)&this->var5.var2 + 1) = 0;
  this->var4 = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 32);
}

{
  this->var0 = 0;
  *(_DWORD *)&this->var1 = 0;
  this->int var3 = 0;
  this->var4 = 0;
  *(void *)&this->var5.var0 = 0;
  *(void *)((char *)&this->var5.var2 + 1) = 0;
  this->var4 = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 32);
}

void Hangul2SetAutomata::~Hangul2SetAutomata(Hangul2SetAutomata *this)
{
  var4 = this->var4;
  if (var4)
  {
    CFRelease(var4);
    this->var4 = 0;
  }
}

{
  __CFString *var4;

  var4 = this->var4;
  if (var4)
  {
    CFRelease(var4);
    this->var4 = 0;
  }
}

uint64_t Hangul2SetAutomata::AppendComposedHangul(Hangul2SetAutomata *this, __CFString *theString)
{
  unsigned __int16 Length = CFStringGetLength(theString);
  if (Length)
  {
    v5.length = this->var2;
    if (Length >= LODWORD(v5.length))
    {
      v5.location = Length - v5.length;
      CFStringDelete(theString, v5);
    }
  }
  CFStringAppend(theString, this->var4);
  return this->var2;
}

void KB::LikelihoodInfo::~LikelihoodInfo(void **this)
{
  if (*((char *)this + 39) < 0) {
    operator delete(this[2]);
  }
}

__CFString *_composeJamo(const __CFString *a1, Hangul2SetAutomata *a2)
{
  Mutable = 0;
  if (a1)
  {
    if (a2)
    {
      uint64_t Length = CFStringGetLength(a1);
      Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], Length);
      if (Mutable)
      {
        Hangul2SetAutomata::Reset(a2);
        if (Length >= 1)
        {
          for (CFIndex i = 0; i != Length; ++i)
          {
            UniChar chars = 0;
            CharacterAtIndex = (HangulSyllable *)CFStringGetCharacterAtIndex(a1, i);
            UniChar chars = (unsigned __int16)CharacterAtIndex;
            BOOL v9 = 0;
            if (Hangul2SetAutomata::SendUniChar(a2, CharacterAtIndex, &v9)) {
              Hangul2SetAutomata::AppendComposedHangul(a2, Mutable);
            }
            else {
              CFStringAppendCharacters(Mutable, &chars, 1);
            }
          }
        }
      }
    }
  }
  return Mutable;
}

id DecomposeHangul(NSString *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v1 = a1;
  [(NSString *)v1 length];
  MEMORY[0x270FA5388]();
  v3 = (char *)&v15[-1] - v2;
  if ([(NSString *)v1 length])
  {
    unint64_t v4 = 0;
    int v5 = 0;
    do
    {
      unsigned __int16 v6 = [(NSString *)v1 characterAtIndex:v4];
      if ((unsigned __int16)((unsigned __int16)(v6 + 21504) >> 2) > 0xAE8u)
      {
        *(_WORD *)&v3[2 * v5++] = v6;
      }
      else
      {
        HangulSyllable::HangulSyllable(&v16, v6);
        *(_DWORD *)v15 = 0;
        uint64_t v7 = v5 + 1;
        *(_WORD *)&v3[2 * v5] = HangulSyllable::ChoToCompatibility((HangulSyllable *)v16.var0);
        uint64_t v9 = v5 + 2;
        if (HangulSyllable::SplitJamoCompound((HangulSyllable *)v16.var1, &v15[1], v15, v8))
        {
          *(_WORD *)&v3[2 * v7] = HangulSyllable::JungToCompatibility((HangulSyllable *)v15[1]);
          v5 += 3;
          *(_WORD *)&v3[2 * v9] = HangulSyllable::JungToCompatibility((HangulSyllable *)v15[0]);
        }
        else
        {
          *(_WORD *)&v3[2 * v7] = HangulSyllable::JungToCompatibility((HangulSyllable *)v16.var1);
          v5 += 2;
        }
        if (v16.var2)
        {
          uint64_t v11 = v5 + 1;
          if (HangulSyllable::SplitJamoCompound((HangulSyllable *)v16.var2, &v15[1], v15, v10))
          {
            *(_WORD *)&v3[2 * v5] = HangulSyllable::JongToCompatibility((HangulSyllable *)v15[1]);
            v5 += 2;
            *(_WORD *)&v3[2 * v11] = HangulSyllable::JongToCompatibility((HangulSyllable *)v15[0]);
          }
          else
          {
            *(_WORD *)&v3[2 * v5++] = HangulSyllable::JongToCompatibility((HangulSyllable *)v16.var2);
          }
        }
      }
      ++v4;
    }
    while ([(NSString *)v1 length] > v4);
  }
  else
  {
    int v5 = 0;
  }
  v12 = [NSString stringWithCharacters:v3 length:v5];

  return v12;
}

{
  NSString *v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  int v5;
  unsigned __int16 v6;
  uint64_t v7;
  unsigned __int16 *v8;
  uint64_t v9;
  unsigned __int16 *v10;
  uint64_t v11;
  void *v12;
  unsigned __int16 v15[2];
  HangulSyllable v16;
  uint64_t v17;
  uint64_t vars8;

  uint64_t v17 = *MEMORY[0x263EF8340];
  v1 = a1;
  [(NSString *)v1 length];
  MEMORY[0x270FA5388]();
  v3 = (char *)&v15[-1] - v2;
  if ([(NSString *)v1 length])
  {
    unint64_t v4 = 0;
    int v5 = 0;
    do
    {
      unsigned __int16 v6 = [(NSString *)v1 characterAtIndex:v4];
      if ((unsigned __int16)((unsigned __int16)(v6 + 21504) >> 2) > 0xAE8u)
      {
        *(_WORD *)&v3[2 * v5++] = v6;
      }
      else
      {
        HangulSyllable::HangulSyllable(&v16, v6);
        *(_DWORD *)v15 = 0;
        uint64_t v7 = v5 + 1;
        *(_WORD *)&v3[2 * v5] = HangulSyllable::ChoToCompatibility((HangulSyllable *)v16.var0);
        uint64_t v9 = v5 + 2;
        if (HangulSyllable::SplitJamoCompound((HangulSyllable *)v16.var1, &v15[1], v15, v8))
        {
          *(_WORD *)&v3[2 * v7] = HangulSyllable::JungToCompatibility((HangulSyllable *)v15[1]);
          v5 += 3;
          *(_WORD *)&v3[2 * v9] = HangulSyllable::JungToCompatibility((HangulSyllable *)v15[0]);
        }
        else
        {
          *(_WORD *)&v3[2 * v7] = HangulSyllable::JungToCompatibility((HangulSyllable *)v16.var1);
          v5 += 2;
        }
        if (v16.var2)
        {
          uint64_t v11 = v5 + 1;
          if (HangulSyllable::SplitJamoCompound((HangulSyllable *)v16.var2, &v15[1], v15, v10))
          {
            *(_WORD *)&v3[2 * v5] = HangulSyllable::JongToCompatibility((HangulSyllable *)v15[1]);
            v5 += 2;
            *(_WORD *)&v3[2 * v11] = HangulSyllable::JongToCompatibility((HangulSyllable *)v15[0]);
          }
          else
          {
            *(_WORD *)&v3[2 * v5++] = HangulSyllable::JongToCompatibility((HangulSyllable *)v16.var2);
          }
        }
      }
      ++v4;
    }
    while ([(NSString *)v1 length] > v4);
  }
  else
  {
    int v5 = 0;
  }
  v12 = [NSString stringWithCharacters:v3 length:v5];

  return v12;
}

void _GLOBAL__sub_I_TIKeyboardInputManagerFavonius_ko_mm()
{
  v0 = (void *)MEMORY[0x24563CAC0]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241E2C000);
}

HangulSyllable *HangulSyllable::NormalizeCho(HangulSyllable *this)
{
  if ((this - 12593) <= 0x5D) {
    return (HangulSyllable *)gCompatibilityJamoToChoMap[this - 12593];
  }
  return this;
}

HangulSyllable *HangulSyllable::NormalizeJung(HangulSyllable *this)
{
  if ((this - 12593) <= 0x5D) {
    return (HangulSyllable *)gCompatibilityJamoToJungMap[this - 12593];
  }
  return this;
}

HangulSyllable *HangulSyllable::NormalizeJong(HangulSyllable *this)
{
  if ((this - 12593) <= 0x5D) {
    return (HangulSyllable *)gCompatibilityJamoToJongMap[this - 12593];
  }
  return this;
}

uint64_t HangulSyllable::ChoToCompatibility(HangulSyllable *this)
{
  unint64_t v1 = this - 4352;
  if (v1 > 0x12) {
    return 0;
  }
  else {
    return gChoToCompatibilityTable[v1];
  }
}

uint64_t HangulSyllable::JungToCompatibility(HangulSyllable *this)
{
  if ((this - 4449) <= 0x14) {
    return gJungToCompatibilityTable[this - 4449];
  }
  if (this == 4514) {
    unsigned int v2 = 4514;
  }
  else {
    unsigned int v2 = 0;
  }
  if (this == 4510) {
    return 12685;
  }
  else {
    return v2;
  }
}

uint64_t HangulSyllable::JongToCompatibility(HangulSyllable *this)
{
  unint64_t v1 = this - 4520;
  if (v1 > 0x1A) {
    return 0;
  }
  else {
    return gJongToCompatibilityTable[v1];
  }
}

HangulSyllable *HangulSyllable::MapChoAndJong(HangulSyllable *this)
{
  unint64_t v1 = this;
  int JamoType = HangulSyllable::GetJamoType(this);
  if (JamoType == 4)
  {
    unint64_t v3 = v1 - 4520;
    if (v3 <= 0x1A)
    {
      unint64_t v4 = (unsigned __int16 *)&gJongToChoMap;
      return (HangulSyllable *)v4[v3];
    }
  }
  else if (JamoType == 2)
  {
    unint64_t v3 = v1 - 4352;
    if (v3 <= 0x12)
    {
      unint64_t v4 = (unsigned __int16 *)&gChoToJongMap;
      return (HangulSyllable *)v4[v3];
    }
  }
  return v1;
}

uint64_t HangulSyllable::GetJamoType(HangulSyllable *this)
{
  if ((this - 4520) >= 0x52) {
    int v1 = -1;
  }
  else {
    int v1 = 4;
  }
  if ((this - 4449) >= 0x42) {
    int v2 = v1;
  }
  else {
    int v2 = 3;
  }
  if ((this - 4352) >= 0x5A) {
    unsigned int v3 = v2;
  }
  else {
    unsigned int v3 = 2;
  }
  BOOL v5 = this > 0x3186 || (this - 12623) < 0x15;
  if ((this - 12592) <= 0x5E) {
    return v5;
  }
  else {
    return v3;
  }
}

HangulSyllable *HangulSyllable::SetCho(HangulSyllable *this, int a2)
{
  if ((a2 - 12593) <= 0x5D) {
    LOWORD(a2) = gCompatibilityJamoToChoMap[a2 - 12593];
  }
  this->var0 = a2;
  return this;
}

HangulSyllable *HangulSyllable::SetJung(HangulSyllable *this, int a2)
{
  if ((a2 - 12593) <= 0x5D) {
    LOWORD(a2) = gCompatibilityJamoToJungMap[a2 - 12593];
  }
  this->var1 = a2;
  return this;
}

HangulSyllable *HangulSyllable::SetJong(HangulSyllable *this, int a2)
{
  if ((a2 - 12593) <= 0x5D) {
    LOWORD(a2) = gCompatibilityJamoToJongMap[a2 - 12593];
  }
  this->var2 = a2;
  return this;
}

uint64_t HangulSyllable::GetUnicode(HangulSyllable *this)
{
  uint64_t var0 = this->var0;
  int var1 = this->var1;
  if (!this->var0)
  {
    if (!this->var1) {
      return (unsigned __int16)var1;
    }
    if (!this->var2)
    {
      if ((var1 - 4449) > 0x14)
      {
        if (var1 == 4514) {
          __int16 v8 = 4514;
        }
        else {
          __int16 v8 = 0;
        }
        if (var1 == 4510) {
          LOWORD(var1) = 12685;
        }
        else {
          LOWORD(var1) = v8;
        }
      }
      else
      {
        LOWORD(var1) = gJungToCompatibilityTable[var1 - 4449];
      }
      return (unsigned __int16)var1;
    }
LABEL_17:
    LOWORD(var1) = 0;
    return (unsigned __int16)var1;
  }
  if (!this->var1)
  {
    if (!this->var2 && (unint64_t)(var0 - 4352) <= 0x12)
    {
      LOWORD(var1) = gChoToCompatibilityTable[var0 - 4352];
      return (unsigned __int16)var1;
    }
    goto LABEL_17;
  }
  if (var1 == 4510 || var1 == 4514) {
    goto LABEL_17;
  }
  unsigned int var2 = this->var2;
  BOOL v5 = var2 >= 0x11A7;
  __int16 v6 = var2 - 4519;
  if (!v5) {
    __int16 v6 = 0;
  }
  LOWORD(var1) = 28 * var1 + 588 * var0 + v6 - 18076;
  return (unsigned __int16)var1;
}

BOOL HangulSyllable::CanCompose(HangulSyllable *this)
{
  return HangulSyllable::GetUnicode(this) != 0;
}

uint64_t SearchForJamoCompound(int a1, int a2, uint64_t a3, int a4)
{
  int v4 = a4 - 1;
  if (a4 < 1) {
    return 0;
  }
  int v5 = 0;
  unsigned int v6 = a2 | (a1 << 16);
  while (1)
  {
    int v7 = v4 + v5;
    if (v4 + v5 < 0 != __OFADD__(v4, v5)) {
      ++v7;
    }
    int v8 = v7 >> 1;
    uint64_t v9 = (uint64_t)v7 >> 1;
    unsigned int v10 = *(unsigned __int16 *)(a3 + 6 * v8 + 2) | (*(unsigned __int16 *)(a3 + 6 * v8) << 16);
    if (v6 == v10) {
      break;
    }
    if (v6 <= v10) {
      int v4 = v9 - 1;
    }
    else {
      int v5 = v9 + 1;
    }
    if (v5 > v4) {
      return 0;
    }
  }
  return *(unsigned __int16 *)(a3 + 6 * (int)v9 + 4);
}

BOOL HangulSyllable::SplitJamoCompound(HangulSyllable *this, unsigned __int16 *a2, unsigned __int16 *a3, unsigned __int16 *a4)
{
  int v4 = 0;
  int v5 = 22;
  while (1)
  {
    int v6 = v5 + v4;
    if (v5 + v4 < 0 != __OFADD__(v5, v4)) {
      ++v6;
    }
    uint64_t v7 = (uint64_t)v6 >> 1;
    unsigned int v8 = gCompoundJamoTable[3 * (v6 >> 1) + 2];
    if (v8 == this) {
      break;
    }
    if (v8 >= this) {
      int v5 = v7 - 1;
    }
    else {
      int v4 = v7 + 1;
    }
    if (v4 > v5) {
      return v8 == this;
    }
  }
  uint64_t v9 = &gCompoundJamoTable[3 * (int)v7];
  *a2 = *v9;
  *a3 = v9[1];
  return v8 == this;
}

uint64_t HangulSyllable::DoubleCho(HangulSyllable *this, int a2)
{
  if ((this - 12593) <= 0x5D) {
    LODWORD(this) = gCompatibilityJamoToChoMap[this - 12593];
  }
  if ((a2 - 12593) <= 0x5D) {
    a2 = gCompatibilityJamoToChoMap[a2 - 12593];
  }
  return SearchForJamoCompound((int)this, a2, (uint64_t)gDoubleChoTable, 5);
}

uint64_t HangulSyllable::DoubleJung(HangulSyllable *this, int a2, int a3)
{
  int v4 = a2;
  int v5 = (int)this;
  unsigned __int16 v6 = (_WORD)this - 12593;
  if ((this - 12593) <= 0x5D) {
    LODWORD(this) = gCompatibilityJamoToJungMap[this - 12593];
  }
  unsigned __int16 v7 = a2 - 12593;
  if ((a2 - 12593) <= 0x5D) {
    a2 = gCompatibilityJamoToJungMap[a2 - 12593];
  }
  unsigned int v8 = v6;
  int v9 = SearchForJamoCompound((int)this, a2, (uint64_t)&gExtendedDoubleJungTable, 4);
  if (v8 <= 0x5D) {
    int v5 = gCompatibilityJamoToJungMap[v5 - 12593];
  }
  if (v7 <= 0x5Du) {
    int v4 = gCompatibilityJamoToJungMap[v4 - 12593];
  }
  LODWORD(result) = SearchForJamoCompound(v5, v4, (uint64_t)gDoubleJungTable, 26);
  if (v9) {
    int v11 = a3;
  }
  else {
    int v11 = 1;
  }
  if (v11) {
    return result;
  }
  else {
    return 0;
  }
}

uint64_t HangulSyllable::DoubleJong(HangulSyllable *this, int a2)
{
  if ((this - 12593) <= 0x5D) {
    LODWORD(this) = gCompatibilityJamoToJongMap[this - 12593];
  }
  if ((a2 - 12593) <= 0x5D) {
    a2 = gCompatibilityJamoToJongMap[a2 - 12593];
  }
  return SearchForJamoCompound((int)this, a2, (uint64_t)gDoubleJongTable, 11);
}

uint64_t HangulSyllable::ChoLeftHalf(HangulSyllable *this)
{
  if ((this - 12593) <= 0x5D) {
    LODWORD(this) = gCompatibilityJamoToChoMap[this - 12593];
  }
  int v1 = 0;
  int v2 = 4;
  while (1)
  {
    int v3 = v1 + v2;
    int v4 = v1 + v2 < 0 != __OFADD__(v1, v2) ? v3 + 1 : v1 + v2;
    int v5 = v4 >> 1;
    uint64_t v6 = (uint64_t)v4 >> 1;
    unsigned int v7 = gDoubleChoTable[3 * v5 + 2];
    if (v7 == this) {
      break;
    }
    if (v7 >= this) {
      int v2 = v6 - 1;
    }
    else {
      int v1 = v6 + 1;
    }
    if (v1 > v2) {
      return 0;
    }
  }
  if ((v3 + 3) < 2) {
    return 0;
  }
  return gDoubleChoTable[3 * (int)v6];
}

uint64_t HangulSyllable::ChoRightHalf(HangulSyllable *this)
{
  if ((this - 12593) <= 0x5D) {
    LODWORD(this) = gCompatibilityJamoToChoMap[this - 12593];
  }
  int v1 = 0;
  int v2 = 4;
  while (1)
  {
    int v3 = v1 + v2;
    int v4 = v1 + v2 < 0 != __OFADD__(v1, v2) ? v3 + 1 : v1 + v2;
    int v5 = v4 >> 1;
    uint64_t v6 = (uint64_t)v4 >> 1;
    unsigned int v7 = gDoubleChoTable[3 * v5 + 2];
    if (v7 == this) {
      break;
    }
    if (v7 >= this) {
      int v2 = v6 - 1;
    }
    else {
      int v1 = v6 + 1;
    }
    if (v1 > v2) {
      return 0;
    }
  }
  if ((v3 + 3) < 2) {
    return 0;
  }
  return gDoubleChoTable[3 * (int)v6 + 1];
}

uint64_t HangulSyllable::VowelLeftHalf(HangulSyllable *this)
{
  if ((this - 12593) <= 0x5D) {
    LODWORD(this) = gCompatibilityJamoToJungMap[this - 12593];
  }
  int v1 = 0;
  int v2 = 25;
  while (1)
  {
    int v3 = v1 + v2;
    int v4 = v1 + v2 < 0 != __OFADD__(v1, v2) ? v3 + 1 : v1 + v2;
    int v5 = v4 >> 1;
    uint64_t v6 = (uint64_t)v4 >> 1;
    unsigned int v7 = gDoubleJungTable[3 * v5 + 2];
    if (v7 == this) {
      break;
    }
    if (v7 >= this) {
      int v2 = v6 - 1;
    }
    else {
      int v1 = v6 + 1;
    }
    if (v1 > v2) {
      return 0;
    }
  }
  if ((v3 + 3) < 2) {
    return 0;
  }
  return gDoubleJungTable[3 * (int)v6];
}

uint64_t HangulSyllable::VowelRightHalf(HangulSyllable *this)
{
  if ((this - 12593) <= 0x5D) {
    LODWORD(this) = gCompatibilityJamoToJungMap[this - 12593];
  }
  int v1 = 0;
  int v2 = 25;
  while (1)
  {
    int v3 = v1 + v2;
    int v4 = v1 + v2 < 0 != __OFADD__(v1, v2) ? v3 + 1 : v1 + v2;
    int v5 = v4 >> 1;
    uint64_t v6 = (uint64_t)v4 >> 1;
    unsigned int v7 = gDoubleJungTable[3 * v5 + 2];
    if (v7 == this) {
      break;
    }
    if (v7 >= this) {
      int v2 = v6 - 1;
    }
    else {
      int v1 = v6 + 1;
    }
    if (v1 > v2) {
      return 0;
    }
  }
  if ((v3 + 3) < 2) {
    return 0;
  }
  return gDoubleJungTable[3 * (int)v6 + 1];
}

uint64_t HangulSyllable::JongLeftHalf(HangulSyllable *this)
{
  if ((this - 12593) <= 0x5D) {
    LODWORD(this) = gCompatibilityJamoToJongMap[this - 12593];
  }
  int v1 = 0;
  int v2 = 10;
  while (1)
  {
    int v3 = v1 + v2;
    int v4 = v1 + v2 < 0 != __OFADD__(v1, v2) ? v3 + 1 : v1 + v2;
    int v5 = v4 >> 1;
    uint64_t v6 = (uint64_t)v4 >> 1;
    unsigned int v7 = gDoubleJongTable[3 * v5 + 2];
    if (v7 == this) {
      break;
    }
    if (v7 >= this) {
      int v2 = v6 - 1;
    }
    else {
      int v1 = v6 + 1;
    }
    if (v1 > v2) {
      return 0;
    }
  }
  if ((v3 + 3) < 2) {
    return 0;
  }
  return gDoubleJongTable[3 * (int)v6];
}

uint64_t HangulSyllable::JongRightHalf(HangulSyllable *this)
{
  if ((this - 12593) <= 0x5D) {
    LODWORD(this) = gCompatibilityJamoToJongMap[this - 12593];
  }
  int v1 = 0;
  int v2 = 10;
  while (1)
  {
    int v3 = v1 + v2;
    int v4 = v1 + v2 < 0 != __OFADD__(v1, v2) ? v3 + 1 : v1 + v2;
    int v5 = v4 >> 1;
    uint64_t v6 = (uint64_t)v4 >> 1;
    unsigned int v7 = gDoubleJongTable[3 * v5 + 2];
    if (v7 == this) {
      break;
    }
    if (v7 >= this) {
      int v2 = v6 - 1;
    }
    else {
      int v1 = v6 + 1;
    }
    if (v1 > v2) {
      return 0;
    }
  }
  if ((v3 + 3) < 2) {
    return 0;
  }
  return gDoubleJongTable[3 * (int)v6 + 1];
}

void HangulSyllable::HangulSyllable(HangulSyllable *this, __int16 a2)
{
  *(_DWORD *)&this->uint64_t var0 = 0;
  this->unsigned int var2 = 0;
  if ((unsigned __int16)((unsigned __int16)(a2 + 21504) >> 2) <= 0xAE8u)
  {
    this->uint64_t var0 = ((28533 * (unsigned __int16)(a2 + 21504)) >> 24) | 0x1100;
    this->int var1 = (unsigned __int16)(a2 + 21504) % 0x24Cu / 0x1C + 4449;
    if ((unsigned __int16)(a2 + 21504) % 0x1Cu) {
      this->unsigned int var2 = (unsigned __int16)(a2 + 21504) % 0x1Cu + 4519;
    }
  }
}

__CFString *__composeJamo(const __CFString *a1, Hangul2SetAutomata *a2)
{
  Mutable = 0;
  if (a1)
  {
    if (a2)
    {
      uint64_t Length = CFStringGetLength(a1);
      Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], Length);
      if (Mutable)
      {
        Hangul2SetAutomata::Reset(a2);
        if (Length >= 1)
        {
          for (CFIndex i = 0; i != Length; ++i)
          {
            UniChar chars = 0;
            CharacterAtIndex = (HangulSyllable *)CFStringGetCharacterAtIndex(a1, i);
            UniChar chars = (unsigned __int16)CharacterAtIndex;
            BOOL v9 = 0;
            if (Hangul2SetAutomata::SendUniChar(a2, CharacterAtIndex, &v9)) {
              Hangul2SetAutomata::AppendComposedHangul(a2, Mutable);
            }
            else {
              CFStringAppendCharacters(Mutable, &chars, 1);
            }
          }
        }
      }
    }
  }
  return Mutable;
}

void _GLOBAL__sub_I_TIKeyboardInputManager_ko_mm()
{
  v0 = (void *)MEMORY[0x24563CAC0]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241E2C000);
}

uint64_t TIInputManager_ko::TIInputManager_ko()
{
  uint64_t result = TIInputManager::TIInputManager();
  *(void *)uint64_t result = &unk_26F5E1478;
  *(unsigned char *)(result + 716) = 0;
  return result;
}

{
  uint64_t result;

  uint64_t result = TIInputManager::TIInputManager();
  *(void *)uint64_t result = &unk_26F5E1478;
  *(unsigned char *)(result + 716) = 0;
  return result;
}

void TIInputManager_ko::~TIInputManager_ko(TIInputManager_ko *this)
{
  TIInputManager::~TIInputManager(this);

  JUMPOUT(0x24563CA00);
}

uint64_t TIInputManager_ko::set_is_10key(uint64_t this, int a2)
{
  if (*(unsigned __int8 *)(this + 716) != a2)
  {
    *(unsigned char *)(this + 716) = a2;
    return (*(uint64_t (**)(void))(**(void **)(this + 184) + 136))();
  }
  return this;
}

uint64_t TIInputManager_ko::is_10key(TIInputManager_ko *this)
{
  return *((unsigned __int8 *)this + 716);
}

void TIInputManager_ko::completion_candidates(TIInputManager *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)this + 716))
  {
    TIInputManager::input_stem((uint64_t *)&v6, this);
    compose_10key_vowels((const KB::String *)&v6, (uint64_t)v15);
    KB::String::~String((KB::String *)&v6);
    TIInputManager::predictions_for_string();
    TIInputManager::input_stem((uint64_t *)v5, this);
    *(_OWORD *)a2 = v6;
    *(void *)(a2 + 16) = v7;
    long long v6 = 0uLL;
    *(_OWORD *)(a2 + 24) = v8;
    *(void *)(a2 + 40) = v9;
    uint64_t v7 = 0;
    long long v8 = 0uLL;
    uint64_t v9 = 0;
    *(_OWORD *)(a2 + 48) = v10;
    *(void *)(a2 + 64) = v11;
    long long v10 = 0uLL;
    *(_OWORD *)(a2 + 72) = v12;
    uint64_t v11 = 0;
    *(void *)&long long v12 = 0;
    uint64_t v4 = v14;
    *(void *)(a2 + 88) = v13;
    *(void *)(a2 + 96) = v4;
    *((void *)&v12 + 1) = 0;
    uint64_t v13 = 0;
    KB::String::String();
    KB::String::~String((KB::String *)v5);
    v5[0] = (void **)&v12;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v5);
    v5[0] = (void **)&v10;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v5);
    v5[0] = (void **)&v8;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v5);
    v5[0] = (void **)&v6;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v5);
    KB::String::~String((KB::String *)v15);
  }
  else
  {
    MEMORY[0x270F7CE38]();
  }
}

void compose_10key_vowels(const KB::String *a1@<X0>, uint64_t a2@<X8>)
{
  v33[4] = *MEMORY[0x263EF8340];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x4802000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  KB::String::String((KB::String *)v33);
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2000000000;
  __int16 v27 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 0x40000000;
  v20 = ___ZL20compose_10key_vowelsRKN2KB6StringE_block_invoke;
  v21 = &unk_2650FC840;
  v22 = &v24;
  v23 = &v28;
  uint64_t v4 = (char *)*((void *)a1 + 1);
  if (!v4) {
    uint64_t v4 = (char *)a1 + 16;
  }
  v15 = v4;
  int v5 = *(unsigned __int16 *)a1;
  int v16 = 0;
  int v17 = v5;
  unsigned int v18 = 0;
  KB::String::iterator::initialize((KB::String::iterator *)&v15);
  int v6 = *(unsigned __int16 *)a1;
  uint64_t v7 = (char *)*((void *)a1 + 1);
  if (!v7) {
    uint64_t v7 = (char *)a1 + 16;
  }
  uint64_t v11 = v7;
  int v12 = v6;
  int v13 = v6;
  int v14 = 0;
  KB::String::iterator::initialize((KB::String::iterator *)&v11);
  while (v16 != v12)
  {
    unsigned __int16 v8 = v18;
    if (HIWORD(v18) || HangulSyllable::GetJamoType((HangulSyllable *)(unsigned __int16)v18) != 1)
    {
      ((void (*)(void *))v20)(v19);
      KB::String::append((KB::String *)(v29 + 5));
    }
    else
    {
      uint64_t v9 = v25;
      if (*((_WORD *)v25 + 12))
      {
        int v10 = HangulSyllable::DoubleJung((HangulSyllable *)*((unsigned __int16 *)v25 + 12), v8, 1);
        if (v10)
        {
          *((_WORD *)v25 + 12) = v10;
          goto LABEL_13;
        }
        ((void (*)(void *))v20)(v19);
        uint64_t v9 = v25;
      }
      *((_WORD *)v9 + 12) = v8;
    }
LABEL_13:
    KB::String::iterator::operator++();
  }
  ((void (*)(void *))v20)(v19);
  MEMORY[0x24563C940](a2, v29 + 5);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  KB::String::~String((KB::String *)v33);
}

void TIInputManager_ko::autocorrections(TIInputManager *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)this + 716))
  {
    if (*((_DWORD *)this + 24))
    {
      TIInputManager::input_stem((uint64_t *)v9, this);
      compose_10key_vowels((const KB::String *)v9, (uint64_t)v10);
      KB::String::~String((KB::String *)v9);
      TIInputManager::predictions_for_string();
      if (v4[0] == v4[1])
      {
        MEMORY[0x24563C970](v9, v10, 0);
        TIInputManager::input_stem(v8, this);
        std::vector<KB::Candidate>::vector((void *)a2, 1uLL, (const KB::Candidate *)v9);
        *(_DWORD *)(a2 + 100) = 0;
        *(_OWORD *)(a2 + 24) = 0u;
        *(_OWORD *)(a2 + 40) = 0u;
        *(_OWORD *)(a2 + 56) = 0u;
        *(_OWORD *)(a2 + 72) = 0u;
        *(void *)(a2 + 88) = 0;
        KB::String::String();
        KB::String::~String((KB::String *)v8);
        MEMORY[0x24563C980](v9);
      }
      else
      {
        TIInputManager::input_stem((uint64_t *)v9, this);
        std::vector<KB::Candidate>::vector((void *)a2, 1uLL, v4[0]);
        *(_DWORD *)(a2 + 100) = 0;
        *(_OWORD *)(a2 + 24) = 0u;
        *(_OWORD *)(a2 + 40) = 0u;
        *(_OWORD *)(a2 + 56) = 0u;
        *(_OWORD *)(a2 + 72) = 0u;
        *(void *)(a2 + 88) = 0;
        KB::String::String();
        KB::String::~String((KB::String *)v9);
      }
      v9[0] = (void **)&v7;
      std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v9);
      v9[0] = (void **)&v6;
      std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v9);
      v9[0] = (void **)&v5;
      std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v9);
      v9[0] = (void **)v4;
      std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v9);
      KB::String::~String((KB::String *)v10);
    }
    else
    {
      *(_DWORD *)(a2 + 100) = 0;
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)(a2 + 64) = 0u;
      *(_OWORD *)(a2 + 80) = 0u;
      KB::String::String((KB::String *)(a2 + 104));
    }
  }
  else
  {
    MEMORY[0x270F7CE00]();
  }
}

void TIInputManager::filter_pre_lookup_input()
{
}

void TIInputManager::internal_string_to_external(unsigned char *a1@<X8>)
{
  *a1 = 0;
  a1[32] = 0;
}

void TIInputManager::external_string_to_internal(unsigned char *a1@<X8>)
{
  *a1 = 0;
  a1[32] = 0;
}

uint64_t TIInputManager::should_exclude_filter_corrections_if_any_candidate_matches_input(TIInputManager *this)
{
  return 0;
}

uint64_t __Block_byref_object_copy_()
{
  return KB::String::String();
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t ___ZL20compose_10key_vowelsRKN2KB6StringE_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int16 *a4)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t result = *(unsigned __int16 *)(v5 + 24);
  if (*(_WORD *)(v5 + 24))
  {
    LODWORD(v11) = 0;
    if (HangulSyllable::SplitJamoCompound((HangulSyllable *)result, (unsigned __int16 *)&v11 + 1, (unsigned __int16 *)&v11, a4))
    {
      uint64_t v7 = (KB::String *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      HangulSyllable::JungToCompatibility((HangulSyllable *)WORD1(v11));
      KB::String::append(v7);
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8) + 40;
      HangulSyllable::JungToCompatibility((HangulSyllable *)(unsigned __int16)v11);
      uint64_t v9 = (KB::String *)v8;
    }
    else
    {
      int v10 = (HangulSyllable *)*(unsigned __int16 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      if (v10 == 4514)
      {
        KB::String::append((KB::String *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
        uint64_t v9 = (KB::String *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      }
      else
      {
        if (HangulSyllable::GetJamoType(v10) != 1) {
          *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HangulSyllable::JungToCompatibility((HangulSyllable *)*(unsigned __int16 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
        }
        uint64_t v9 = (KB::String *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      }
    }
    uint64_t result = KB::String::append(v9);
    *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  return result;
}

void std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  int v1 = *a1;
  int v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = v2;
    if ((void *)v4 != v2)
    {
      do
        uint64_t v4 = MEMORY[0x24563C980](v4 - 1000);
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *std::vector<KB::Candidate>::vector(void *a1, unint64_t a2, const KB::Candidate *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<KB::Candidate>::__vallocate[abi:nn180100](a1, a2);
    uint64_t v6 = (KB::Candidate *)a1[1];
    uint64_t v7 = 1000 * a2;
    uint64_t v8 = (char *)v6 + 1000 * a2;
    do
    {
      uint64_t v6 = (KB::Candidate *)((char *)KB::Candidate::Candidate(v6, a3) + 1000);
      v7 -= 1000;
    }
    while (v7);
    a1[1] = v8;
  }
  return a1;
}

char *std::vector<KB::Candidate>::__vallocate[abi:nn180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x4189374BC6A7F0) {
    abort();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<KB::Candidate>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[1000 * v4];
  return result;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<KB::Candidate>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x4189374BC6A7F0) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(1000 * a2);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
}

KB::Candidate *KB::Candidate::Candidate(KB::Candidate *this, const KB::Candidate *a2)
{
  uint64_t v4 = WTF::Vector<KB::Word,3ul>::Vector(this, a2);
  long long v5 = *(_OWORD *)((char *)a2 + 744);
  long long v6 = *(_OWORD *)((char *)a2 + 760);
  v4[97] = *((void *)a2 + 97);
  *(_OWORD *)(v4 + 93) = v5;
  *(_OWORD *)(v4 + 95) = v6;
  KB::LanguageModelContext::LanguageModelContext((uint64_t)(v4 + 98), (uint64_t)a2 + 784);
  MEMORY[0x24563C940]((char *)this + 888, (char *)a2 + 888);
  uint64_t v7 = (std::string *)((char *)this + 920);
  if (*((char *)a2 + 943) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *((const std::string::value_type **)a2 + 115), *((void *)a2 + 116));
  }
  else
  {
    long long v8 = *(_OWORD *)((char *)a2 + 920);
    *((void *)this + 117) = *((void *)a2 + 117);
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = v8;
  }
  KB::ByteString::copy();
  *((_OWORD *)this + 60) = *((_OWORD *)a2 + 60);
  uint64_t v9 = (const void *)*((void *)a2 + 122);
  *((void *)this + 122) = v9;
  if (v9)
  {
    CFRetain(v9);
    *((void *)this + 122) = v9;
  }
  int v10 = (const void *)*((void *)a2 + 123);
  *((void *)this + 123) = v10;
  if (v10)
  {
    CFRetain(v10);
    *((void *)this + 123) = v10;
  }
  *((_DWORD *)this + 248) = *((_DWORD *)a2 + 248);
  return this;
}

void *WTF::Vector<KB::Word,3ul>::Vector(void *a1, void *a2)
{
  unint64_t v4 = a2[2];
  long long v5 = a1 + 3;
  *a1 = *a2;
  a1[1] = v5;
  a1[2] = 3;
  if (v4 < 4 || (a1[2] = v4, long long v5 = malloc_type_malloc(240 * v4, 0x10B2040DF775671uLL), (a1[1] = v5) != 0))
  {
    uint64_t v6 = *a2;
    if (*a2)
    {
      uint64_t v7 = a2[1];
      uint64_t v8 = 240 * v6;
      do
      {
        long long v5 = (void *)(KB::Word::Word((uint64_t)v5, v7) + 240);
        v7 += 240;
        v8 -= 240;
      }
      while (v8);
    }
  }
  return a1;
}

uint64_t KB::Word::Word(uint64_t a1, uint64_t a2)
{
  MEMORY[0x24563C940]();
  KB::ByteString::copy();
  uint64_t v4 = *(void *)(a2 + 48);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(void *)(a1 + 48) = v4;
  MEMORY[0x24563C940](a1 + 64, a2 + 64);
  long long v5 = *(_OWORD *)(a2 + 96);
  long long v6 = *(_OWORD *)(a2 + 112);
  long long v7 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v7;
  *(_OWORD *)(a1 + 96) = v5;
  *(_OWORD *)(a1 + 112) = v6;
  MEMORY[0x24563C940](a1 + 160, a2 + 160);
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  std::unordered_set<unsigned long long>::unordered_set(a1 + 200, a2 + 200);
  return a1;
}

uint64_t std::unordered_set<unsigned long long>::unordered_set(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, *(void *)(a2 + 8));
  for (CFIndex i = *(void **)(a2 + 16); i; CFIndex i = (void *)*i)
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>(a1, i + 2, i + 2);
  return a1;
}

void std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__do_rehash<true>(a1, prime);
    }
  }
}

void std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      uint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *uint64_t v7 = *v11;
            *uint64_t v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            uint64_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          uint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    int v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void *std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>(uint64_t a1, unint64_t *a2, void *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    uint8x8_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      for (CFIndex i = *v9; i; CFIndex i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6) {
            return i;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v3) {
            break;
          }
        }
      }
    }
  }
  CFIndex i = operator new(0x18uLL);
  *CFIndex i = 0;
  i[1] = v6;
  i[2] = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v18 = *(void *)a1;
  v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    *CFIndex i = *v19;
LABEL_38:
    void *v19 = i;
    goto LABEL_39;
  }
  *CFIndex i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*i)
  {
    unint64_t v20 = *(void *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }
    else
    {
      v20 &= v7 - 1;
    }
    v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

uint64_t KB::LanguageModelContext::LanguageModelContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  std::vector<TITokenID>::vector((void *)(a1 + 16), a2 + 16);
  long long v5 = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = v5;
  language_modeling::v1::LinguisticContext::LinguisticContext();
  language_modeling::v1::LinguisticContext::LinguisticContext();
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 80) = 0;
  std::vector<std::string>::__init_with_size[abi:nn180100]<std::string*,std::string*>((std::string *)(a1 + 80), *(long long **)(a2 + 80), *(long long **)(a2 + 88), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 88) - *(void *)(a2 + 80)) >> 3));
  return a1;
}

void *std::vector<TITokenID>::vector(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  uint64_t v4 = *(const void **)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  int64_t v5 = v3 - *(void *)a2;
  if (v3 != *(void *)a2)
  {
    std::vector<TITokenID>::__vallocate[abi:nn180100](a1, v5 >> 3);
    unint64_t v6 = (char *)a1[1];
    memmove(v6, v4, v5);
    a1[1] = &v6[v5];
  }
  return a1;
}

char *std::vector<TITokenID>::__vallocate[abi:nn180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    abort();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<TITokenID>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<TITokenID>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(8 * a2);
}

std::string *std::vector<std::string>::__init_with_size[abi:nn180100]<std::string*,std::string*>(std::string *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    unint64_t v6 = result;
    std::vector<std::string>::__vallocate[abi:nn180100](result, a4);
    uint64_t result = std::__uninitialized_allocator_copy[abi:nn180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>((int)v6 + 16, a2, a3, (std::string *)v6->__r_.__value_.__l.__size_);
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)result;
  }
  return result;
}

char *std::vector<std::string>::__vallocate[abi:nn180100](void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    abort();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(24 * a2);
}

std::string *std::__uninitialized_allocator_copy[abi:nn180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(int a1, long long *a2, long long *a3, std::string *this)
{
  if (a2 != a3)
  {
    unint64_t v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)v6, *((void *)v6 + 1));
      }
      else
      {
        long long v7 = *v6;
        this->__r_.__value_.__r.__words[2] = *((void *)v6 + 2);
        *(_OWORD *)&this->__r_.__value_.__l.__data_ = v7;
      }
      unint64_t v6 = (long long *)((char *)v6 + 24);
      ++this;
    }
    while (v6 != a3);
  }
  return this;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  int64_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      abort();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    uint8x8_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    int64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

uint64_t _GLOBAL__sub_I_TIInputManager_ko_cpp()
{
  return __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241E2C000);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

void CFStringDelete(CFMutableStringRef theString, CFRange range)
{
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x270EE5190](theString, idx);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

uint64_t TIInputModeGetComponentsFromIdentifier()
{
  return MEMORY[0x270F7CC08]();
}

uint64_t TIInputModeGetSWLayout()
{
  return MEMORY[0x270F7CC50]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t TIInputManager::delete_from_input(TIInputManager *this)
{
  return MEMORY[0x270F7CE18](this);
}

uint64_t TIInputManager::or_input_flags_from_input()
{
  return MEMORY[0x270F7CE70]();
}

uint64_t TIInputManager::TIInputManager()
{
  return MEMORY[0x270F7CEB8]();
}

void TIInputManager::~TIInputManager(TIInputManager *this)
{
}

uint64_t language_modeling::v1::LinguisticContext::LinguisticContext()
{
  return MEMORY[0x270F46CB8]();
}

uint64_t KB::ByteString::copy()
{
  return MEMORY[0x270F7CEF0]();
}

uint64_t KB::std_string(KB *this, NSString *a2)
{
  return MEMORY[0x270F7CF08](this, a2);
}

uint64_t KB::utf8_string(KB *this, NSString *a2)
{
  return MEMORY[0x270F7CF10](this, a2);
}

uint64_t KB::String::append(KB::String *this)
{
  return MEMORY[0x270F7D050](this);
}

uint64_t KB::String::iterator::initialize(KB::String::iterator *this)
{
  return MEMORY[0x270F7D058](this);
}

uint64_t KB::String::iterator::operator++()
{
  return MEMORY[0x270F7D060]();
}

uint64_t KB::String::String()
{
  return MEMORY[0x270F7D070]();
}

uint64_t KB::String::String(KB::String *this, const KB::String *a2)
{
  return MEMORY[0x270F7D080](this, a2);
}

uint64_t KB::String::String(KB::String *this)
{
  return MEMORY[0x270F7D090](this);
}

void KB::String::~String(KB::String *this)
{
}

uint64_t KB::Candidate::Candidate(KB::Candidate *this, const KB::String *a2)
{
  return MEMORY[0x270F7D0C0](this, a2);
}

void KB::Candidate::~Candidate(KB::Candidate *this)
{
}

uint64_t KB::ns_string(KB *this, const KB::String *a2)
{
  return MEMORY[0x270F7D0E0](this, a2);
}

uint64_t TIInputManager::input_stem(TIInputManager *this)
{
  return MEMORY[0x270F7D168](this);
}

uint64_t TIInputManager::input_string(TIInputManager *this)
{
  return MEMORY[0x270F7D178](this);
}

uint64_t TIInputManager::is_uppercase(TIInputManager *this)
{
  return MEMORY[0x270F7D180](this);
}

uint64_t TIInputManager::predictions_for_string()
{
  return MEMORY[0x270F7D1A8]();
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void abort(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

uint64_t uset_contains()
{
  return MEMORY[0x270F99968]();
}