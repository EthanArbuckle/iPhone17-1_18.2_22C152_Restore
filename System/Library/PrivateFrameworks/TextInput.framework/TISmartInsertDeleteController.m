@interface TISmartInsertDeleteController
- (BOOL)isEnabled;
- (TISmartInsertDeleteController)initWithTextInputTraits:(id)a3;
- (TITextInputTraits)textInputTraits;
- (unint64_t)_numberOfCharactersInSet:(id)a3 atBeginningOfString:(id)a4;
- (unint64_t)_numberOfCharactersInSet:(id)a3 atEndOfString:(id)a4;
- (void)setEnabled:(BOOL)a3;
- (void)smartDeleteForDocumentState:(id)a3 outBeforeLength:(unint64_t *)a4 outAfterLength:(unint64_t *)a5;
- (void)smartInsertForDocumentState:(id)a3 stringToInsert:(id)a4 outBeforeString:(id *)a5 outAfterString:(id *)a6;
@end

@implementation TISmartInsertDeleteController

- (void).cxx_destruct
{
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (TITextInputTraits)textInputTraits
{
  return self->_textInputTraits;
}

- (void)smartInsertForDocumentState:(id)a3 stringToInsert:(id)a4 outBeforeString:(id *)a5 outAfterString:(id *)a6
{
  id v66 = a3;
  id v10 = a4;
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  if ([(TISmartInsertDeleteController *)self isEnabled])
  {
    id v11 = [(TISmartInsertDeleteController *)self textInputTraits];
    if (![v11 smartInsertDeleteEnabled])
    {
LABEL_90:

      goto LABEL_91;
    }
    v12 = [(TISmartInsertDeleteController *)self textInputTraits];
    uint64_t v13 = [v12 smartInsertDeleteType];

    if (v13 != 1 && v66 && v10)
    {
      id v11 = v10;
      v14 = _getPreSmartSet();
      v15 = _getPostSmartSet();
      v63 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      v64 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
      uint64_t v16 = [v11 length];
      v17 = [v66 contextBeforeInput];
      uint64_t v18 = [v17 length];

      v19 = [v66 contextAfterInput];
      uint64_t v65 = [v19 length];

      uint64_t v61 = v18;
      if (v18)
      {
        v20 = [v66 contextBeforeInput];
        unsigned __int16 v21 = [v20 _lastLongCharacter];

        if ([v14 characterIsMember:v21])
        {
          v22 = [v66 contextBeforeInput];
          unint64_t v60 = [(TISmartInsertDeleteController *)self _numberOfCharactersInSet:v64 atEndOfString:v22];

          BOOL v55 = 0;
          int v59 = 1;
        }
        else
        {
          unint64_t v60 = 0;
          int v59 = 0;
          BOOL v55 = 1;
          if ((v21 & 0xFF00) != 0xE00 && (unsigned __int16)(v21 - 4096) >= 0xA0u)
          {
            int v59 = 0;
            unint64_t v60 = 0;
            BOOL v55 = v21 >> 7 == 47;
          }
        }
      }
      else
      {
        int v59 = 0;
        BOOL v55 = 0;
        unint64_t v60 = 0;
      }
      v58 = v14;
      if (v65)
      {
        v23 = [v66 contextAfterInput];
        unsigned __int16 v24 = [v23 _firstLongCharacter];

        if ([v15 characterIsMember:v24])
        {
          v25 = [v66 contextAfterInput];
          unint64_t v26 = [(TISmartInsertDeleteController *)self _numberOfCharactersInSet:v64 atBeginningOfString:v25];

          BOOL v27 = 0;
          char v28 = 1;
        }
        else
        {
          unint64_t v26 = 0;
          char v28 = 0;
          BOOL v27 = 1;
          if ((v24 & 0xFF00) != 0xE00 && (unsigned __int16)(v24 - 4096) >= 0xA0u)
          {
            char v28 = 0;
            unint64_t v26 = 0;
            BOOL v27 = v24 >> 7 == 47;
          }
        }
      }
      else
      {
        char v28 = 0;
        BOOL v27 = 0;
        unint64_t v26 = 0;
      }
      unint64_t v57 = v26;
      v62 = v15;
      if (v16)
      {
        char v54 = v28;
        BOOL v29 = v27;
        uint64_t v30 = [v11 characterAtIndex:0];
        uint64_t v31 = [v11 characterAtIndex:v16 - 1];
        int v32 = [v63 characterIsMember:v30];
        char v33 = [v63 characterIsMember:v31];
        int v56 = [v64 characterIsMember:v30];
        LODWORD(v16) = [v64 characterIsMember:v31];
        BOOL v34 = 1;
        if ((v30 & 0xFF00) != 0xE00 && (unsigned __int16)(v30 - 4096) >= 0xA0u) {
          BOOL v34 = v30 >> 7 == 47;
        }
        BOOL v35 = 0;
        BOOL v27 = v29;
        if ((v31 & 0xFF00) == 0xE00)
        {
          int v36 = v59;
          char v28 = v54;
        }
        else
        {
          int v36 = v59;
          char v28 = v54;
          if ((unsigned __int16)(v31 - 4096) >= 0xA0u) {
            BOOL v35 = v31 >> 7 != 47;
          }
        }
      }
      else
      {
        int v32 = 0;
        char v33 = 0;
        BOOL v34 = 0;
        int v56 = 0;
        BOOL v35 = 1;
        int v36 = v59;
      }
      if (((v36 | v32) & 1) == 0 && v61)
      {
        if (v55)
        {
          if (!a5 || v34) {
            goto LABEL_41;
          }
        }
        else if (!a5)
        {
          goto LABEL_41;
        }
        *a5 = @" ";
      }
LABEL_41:
      char v37 = v28 | v33;
      v38 = v58;
      v39 = v62;
      if ((v37 & 1) != 0 || !v65) {
        goto LABEL_50;
      }
      if (v27)
      {
        if (!a6) {
          BOOL v35 = 0;
        }
        if (!v35)
        {
LABEL_50:
          if (TIGetFlexibleSmartWhitespaceEnabledValue_onceToken != -1) {
            dispatch_once(&TIGetFlexibleSmartWhitespaceEnabledValue_onceToken, &__block_literal_global_43);
          }
          uint64_t v40 = +[TIPreferencesController sharedPreferencesController];
          v41 = [(id)v40 valueForPreferenceKey:@"FlexibleSmartWhitespaceEnabled"];

          LOBYTE(v40) = [v41 BOOLValue];
          if ((v40 & 1) == 0)
          {
            int v46 = v56;
            if (v60 != 1) {
              int v46 = 1;
            }
            if (((v46 | v16) & 1) != 0 || v57 != 1) {
              goto LABEL_89;
            }
            if (a5) {
              *a5 = @"\n";
            }
            goto LABEL_87;
          }
          v42 = [v66 contextBeforeInput];
          uint64_t v43 = [v42 length];

          v44 = [v66 contextAfterInput];
          uint64_t v45 = [v44 length];

          if ((v56 & 1) != 0 || v60 != 1 || v43 == 1 || !v57)
          {
            if (v65) {
              BOOL v47 = 1;
            }
            else {
              BOOL v47 = v61 == 0;
            }
            int v48 = !v47;
            if (v60 != 1 || v43 == 1) {
              int v48 = 0;
            }
            if (!a5 || (v48 & ~v16 & (v56 ^ 1)) == 0 || *a5) {
              goto LABEL_80;
            }
          }
          else if (!a5)
          {
            goto LABEL_80;
          }
          *a5 = @"\n";
LABEL_80:
          if (v60) {
            char v50 = v16;
          }
          else {
            char v50 = 1;
          }
          v38 = v58;
          if ((v50 & 1) != 0 || v57 != 1 || v45 == 1)
          {
            v39 = v62;
            if (v61) {
              BOOL v51 = 1;
            }
            else {
              BOOL v51 = v65 == 0;
            }
            if (v51 || v57 == v45) {
              int v53 = 1;
            }
            else {
              int v53 = v56;
            }
            if (!a6 || v16 | v53 || *a6) {
              goto LABEL_89;
            }
            goto LABEL_88;
          }
          v39 = v62;
LABEL_87:
          if (!a6)
          {
LABEL_89:

            goto LABEL_90;
          }
LABEL_88:
          *a6 = @"\n";
          goto LABEL_89;
        }
      }
      else if (!a6)
      {
        goto LABEL_50;
      }
      *a6 = @" ";
      goto LABEL_50;
    }
  }
LABEL_91:
}

- (unint64_t)_numberOfCharactersInSet:(id)a3 atEndOfString:(id)a4
{
  id v5 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  id v6 = a4;
  uint64_t v7 = [v6 length];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__TISmartInsertDeleteController__numberOfCharactersInSet_atEndOfString___block_invoke;
  v11[3] = &unk_1E555A360;
  id v12 = v5;
  uint64_t v13 = &v14;
  id v8 = v5;
  objc_msgSend(v6, "_reverseEnumerateLongCharactersInRange:usingBlock:", 0, v7, v11);

  unint64_t v9 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v9;
}

uint64_t __72__TISmartInsertDeleteController__numberOfCharactersInSet_atEndOfString___block_invoke(uint64_t a1, unsigned __int16 a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) characterIsMember:a2];
  if (result) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  else {
    *a3 = 1;
  }
  return result;
}

- (unint64_t)_numberOfCharactersInSet:(id)a3 atBeginningOfString:(id)a4
{
  id v5 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  id v6 = a4;
  uint64_t v7 = [v6 length];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__TISmartInsertDeleteController__numberOfCharactersInSet_atBeginningOfString___block_invoke;
  v11[3] = &unk_1E555A360;
  id v12 = v5;
  uint64_t v13 = &v14;
  id v8 = v5;
  objc_msgSend(v6, "_enumerateLongCharactersInRange:usingBlock:", 0, v7, v11);

  unint64_t v9 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v9;
}

uint64_t __78__TISmartInsertDeleteController__numberOfCharactersInSet_atBeginningOfString___block_invoke(uint64_t a1, unsigned __int16 a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) characterIsMember:a2];
  if (result) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  else {
    *a3 = 1;
  }
  return result;
}

- (void)smartDeleteForDocumentState:(id)a3 outBeforeLength:(unint64_t *)a4 outAfterLength:(unint64_t *)a5
{
  id v8 = a3;
  if (a4) {
    *a4 = 0;
  }
  id v57 = v8;
  if (a5) {
    *a5 = 0;
  }
  if ([(TISmartInsertDeleteController *)self isEnabled])
  {
    id v9 = [(TISmartInsertDeleteController *)self textInputTraits];
    if (![v9 smartInsertDeleteEnabled])
    {
LABEL_53:

      goto LABEL_54;
    }
    id v10 = [(TISmartInsertDeleteController *)self textInputTraits];
    uint64_t v11 = [v10 smartInsertDeleteType];

    if (v57)
    {
      if (v11 != 1)
      {
        if (_getRegularWhiteSet_onceToken != -1) {
          dispatch_once(&_getRegularWhiteSet_onceToken, &__block_literal_global_12075);
        }
        id v9 = (id)_getRegularWhiteSet__regularWhiteSet;
        id v12 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
        uint64_t v13 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
        uint64_t v14 = [v57 contextBeforeInput];
        uint64_t v15 = [v14 length];

        uint64_t v16 = [v57 contextAfterInput];
        uint64_t v17 = [v16 length];

        if (v15)
        {
          uint64_t v18 = [v57 contextBeforeInput];
          unsigned __int16 v19 = [v18 _lastLongCharacter];

          if ([v12 characterIsMember:v19])
          {
            unsigned int v54 = [v9 characterIsMember:v19];
            v20 = [v57 contextBeforeInput];
            uint64_t v21 = [v20 length];

            if ([v13 characterIsMember:v19])
            {
              uint64_t v49 = v15;
              v22 = v12;
              int v23 = 0;
              int v56 = v21;
              uint64_t v24 = v21 - 2;
              while (1)
              {
                v25 = v57;
                if (v24 == -1) {
                  break;
                }
                ++v23;
                unint64_t v26 = [v57 contextBeforeInput];
                uint64_t v27 = [v26 characterAtIndex:v24];

                --v24;
                if (([v13 characterIsMember:v27] & 1) == 0)
                {
                  int v51 = 0;
                  int v28 = 1;
                  int v56 = v23;
                  v25 = v57;
                  goto LABEL_33;
                }
              }
              int v51 = 0;
              int v28 = 1;
LABEL_33:
              id v12 = v22;
              uint64_t v15 = v49;
            }
            else
            {
              int v51 = 0;
              int v56 = 0;
              int v28 = 1;
              v25 = v57;
            }
            unsigned int v29 = v54;
            if (!v17) {
              goto LABEL_35;
            }
            goto LABEL_21;
          }
          uint64_t v30 = _getPreSmartSet();
          int v51 = [v30 characterIsMember:v19];

          int v28 = 0;
          unsigned int v29 = 0;
        }
        else
        {
          int v28 = 0;
          unsigned int v29 = 0;
          int v51 = 0;
        }
        int v56 = 0;
        v25 = v57;
        if (!v17)
        {
LABEL_35:
          unsigned int v34 = 0;
          LODWORD(v36) = 0;
          int v40 = v56;
          goto LABEL_36;
        }
LABEL_21:
        int v52 = v28;
        unsigned int v55 = v29;
        uint64_t v31 = objc_msgSend(v25, "contextAfterInput", v49);
        unsigned __int16 v32 = [v31 _firstLongCharacter];

        uint64_t v33 = v32;
        int v53 = v12;
        if ([v12 characterIsMember:v33])
        {
          unsigned int v34 = [v9 characterIsMember:v32];
          BOOL v35 = [v57 contextAfterInput];
          uint64_t v36 = [v35 length];

          if ([v13 characterIsMember:v33])
          {
            uint64_t v50 = v15;
            uint64_t v37 = 1;
            while (v36 != v37)
            {
              v38 = [v57 contextAfterInput];
              uint64_t v39 = [v38 characterAtIndex:v37];

              ++v37;
              if (([v13 characterIsMember:v39] & 1) == 0)
              {
                LODWORD(v36) = v37 - 1;
                break;
              }
            }
            int v40 = v56;
            int v28 = v52;
            id v12 = v53;
            uint64_t v15 = v50;
            unsigned int v29 = v55;
LABEL_36:
            unint64_t v45 = 0;
            BOOL v43 = v17 != 0;
            LODWORD(v44) = v40 == 2;
            if (v40 == 2) {
              char v46 = 1;
            }
            else {
              char v46 = v29;
            }
            if (!v17 && (v46 & 1) != 0)
            {
LABEL_41:
              unint64_t v44 = 1;
              if (!a4) {
                goto LABEL_50;
              }
              goto LABEL_49;
            }
LABEL_43:
            if (v36 == 2) {
              char v47 = 1;
            }
            else {
              char v47 = v34;
            }
            if (v15 || (v47 & 1) == 0)
            {
              if ((v28 & v43) != 1)
              {
                if (v51 & v34 | v29 ^ 1) {
                  unint64_t v44 = 0;
                }
                else {
                  unint64_t v44 = v45;
                }
                unint64_t v45 = v51 & v34;
                if (!a4) {
                  goto LABEL_50;
                }
                goto LABEL_49;
              }
              if ((v29 | v34))
              {
                unint64_t v44 = v29;
                unint64_t v45 = v29 ^ 1;
                if (!a4) {
                  goto LABEL_50;
                }
                goto LABEL_49;
              }
              if (v36 == 1) {
                char v48 = v44;
              }
              else {
                char v48 = 0;
              }
              if (v48)
              {
                unint64_t v45 = 0;
                goto LABEL_41;
              }
              if (v40 != 1 || v36 != 2)
              {
                if (v36 == 2) {
                  unint64_t v44 = v44;
                }
                else {
                  unint64_t v44 = 0;
                }
                unint64_t v45 = v44;
                if (!a4) {
                  goto LABEL_50;
                }
                goto LABEL_49;
              }
            }
            unint64_t v44 = 0;
            unint64_t v45 = 1;
            if (!a4)
            {
LABEL_50:
              if (a5) {
                *a5 = v45;
              }

              goto LABEL_53;
            }
LABEL_49:
            *a4 = v44;
            goto LABEL_50;
          }
          LODWORD(v36) = 0;
          unint64_t v45 = 0;
          int v40 = v56;
          LODWORD(v44) = v56 == 2;
          BOOL v43 = 1;
        }
        else
        {
          v41 = _getPostSmartSet();
          unsigned int v42 = [v41 characterIsMember:v32];

          LODWORD(v36) = 0;
          unsigned int v34 = 0;
          BOOL v43 = 0;
          int v40 = v56;
          LODWORD(v44) = v56 == 2;
          unint64_t v45 = v42;
        }
        id v12 = v53;
        unsigned int v29 = v55;
        int v28 = v52;
        goto LABEL_43;
      }
    }
  }
LABEL_54:
}

- (TISmartInsertDeleteController)initWithTextInputTraits:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TISmartInsertDeleteController;
  id v6 = [(TISmartInsertDeleteController *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_enabled = 1;
    objc_storeStrong((id *)&v6->_textInputTraits, a3);
  }

  return v7;
}

@end