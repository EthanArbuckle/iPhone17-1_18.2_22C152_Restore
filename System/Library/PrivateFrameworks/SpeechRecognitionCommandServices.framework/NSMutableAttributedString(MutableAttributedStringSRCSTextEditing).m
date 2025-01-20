@interface NSMutableAttributedString(MutableAttributedStringSRCSTextEditing)
- (void)adjustCapsAndSpacingUsingLeadingText:()MutableAttributedStringSRCSTextEditing localeIdentifier:vocabularyEntries:spellingGuessesBlock:;
@end

@implementation NSMutableAttributedString(MutableAttributedStringSRCSTextEditing)

- (void)adjustCapsAndSpacingUsingLeadingText:()MutableAttributedStringSRCSTextEditing localeIdentifier:vocabularyEntries:spellingGuessesBlock:
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  id v93 = a3;
  id v91 = a4;
  id v92 = a5;
  v90 = a6;
  if ([a1 length])
  {
    uint64_t v103 = 0;
    v104 = &v103;
    uint64_t v105 = 0x2020000000;
    char v106 = 0;
    if ([v93 length]
      && objc_msgSend(v93, "characterAtIndex:", objc_msgSend(v93, "length") - 1) == 46)
    {
      *((unsigned char *)v104 + 24) = 1;
    }
    else
    {
      id v10 = objc_alloc(MEMORY[0x263F08948]);
      uint64_t v11 = *MEMORY[0x263F082C8];
      v12 = [MEMORY[0x263EFF8C0] arrayWithObject:*MEMORY[0x263F082C8]];
      v13 = (void *)[v10 initWithTagSchemes:v12 options:0];

      if (v93)
      {
        v14 = NSString;
        v15 = [a1 string];
        v16 = [v14 stringWithFormat:@"%@%@", v93, v15];
      }
      else
      {
        v16 = [a1 string];
      }
      uint64_t v17 = [v93 length];
      uint64_t v18 = [a1 length];
      [v13 setString:v16];
      v98[0] = MEMORY[0x263EF8330];
      v98[1] = 3221225472;
      v98[2] = __162__NSMutableAttributedString_MutableAttributedStringSRCSTextEditing__adjustCapsAndSpacingUsingLeadingText_localeIdentifier_vocabularyEntries_spellingGuessesBlock___block_invoke;
      v98[3] = &unk_264DC99B0;
      uint64_t v101 = v17;
      uint64_t v102 = v18;
      v100 = &v103;
      id v19 = v16;
      id v99 = v19;
      objc_msgSend(v13, "enumerateTagsInRange:scheme:options:usingBlock:", v17, v18, v11, 0, v98);
    }
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id v20 = v92;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v94 objects:v107 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v95;
LABEL_11:
      uint64_t v23 = 0;
      while (1)
      {
        if (*(void *)v95 != v22) {
          objc_enumerationMutation(v20);
        }
        v24 = *(void **)(*((void *)&v94 + 1) + 8 * v23);
        v25 = [a1 string];
        v26 = [v25 lowercaseString];
        v27 = [v24 lowercaseString];
        int v28 = [v26 hasPrefix:v27];

        if (v28)
        {
          v29 = [a1 string];
          unint64_t v30 = [v29 length];
          LODWORD(v30) = v30 > [v24 length];

          if (!v30) {
            break;
          }
          v31 = [a1 string];
          uint64_t v32 = objc_msgSend(v31, "characterAtIndex:", objc_msgSend(v24, "length"));

          v33 = [MEMORY[0x263F089C0] whitespaceAndNewlineCharacterSet];
          v34 = [MEMORY[0x263F08708] punctuationCharacterSet];
          [v33 formUnionWithCharacterSet:v34];

          LODWORD(v32) = [v33 characterIsMember:v32];
          if (v32) {
            break;
          }
        }
        if (v21 == ++v23)
        {
          uint64_t v21 = [v20 countByEnumeratingWithState:&v94 objects:v107 count:16];
          if (v21) {
            goto LABEL_11;
          }
          goto LABEL_19;
        }
      }
      v36 = [MEMORY[0x263F089C0] lowercaseLetterCharacterSet];
      [v36 addCharactersInString:@"-' "];
      v37 = [v36 invertedSet];
      BOOL v38 = [v24 rangeOfCharacterFromSet:v37] == 0x7FFFFFFFFFFFFFFFLL;

      id v89 = v24;
      if (v38)
      {
        int v35 = 1;
        goto LABEL_22;
      }
      objc_msgSend(a1, "replaceCharactersInRange:withString:", 0, objc_msgSend(v89, "length"), v89);
LABEL_46:
      if (![v93 length])
      {
LABEL_72:

        _Block_object_dispose(&v103, 8);
        goto LABEL_73;
      }
      uint64_t v70 = objc_msgSend(v93, "characterAtIndex:", objc_msgSend(v93, "length") - 1);
      v71 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      v72 = [MEMORY[0x263F08708] punctuationCharacterSet];
      int v73 = [v71 characterIsMember:v70];
      int v74 = [v72 characterIsMember:v70];
      v75 = objc_msgSend(MEMORY[0x263F08708], "characterSetWithCharactersInString:", @"¡¿⸘“‘‟‛'­­­­­­­­–‑­­­-—@❛❝‹«<〈《（❨(❮{[〔【〖❪❴❲❬⎧⎡⎛⎨⎜⎢⎪⎣⎝⎩");
      v76 = [a1 string];
      uint64_t v77 = [v76 characterAtIndex:0];

      if (![v72 characterIsMember:v77])
      {
        int v80 = 0;
        goto LABEL_56;
      }
      if ([v91 hasPrefix:@"fr"])
      {
        v78 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@";:!?«»"];
        int v79 = [v78 characterIsMember:v77];
      }
      else
      {
        v78 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"&"];
        if ([v75 characterIsMember:v77])
        {
          int v81 = 1;
LABEL_55:

          int v80 = v81 ^ 1;
LABEL_56:
          if ((v73 | v80))
          {
            if (!v74) {
              goto LABEL_71;
            }
            v82 = v75;
            int v83 = 0;
          }
          else
          {
            int v84 = [v71 characterIsMember:v77];
            if ((v74 & 1) == 0)
            {
              if (v84) {
                goto LABEL_71;
              }
              goto LABEL_69;
            }
            v82 = v75;
            int v83 = v84 ^ 1;
          }
          v85 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"\""];
          v86 = v85;
          if (!v83
            || [v85 characterIsMember:v70]
            && ((unint64_t)[v93 length] < 2
             || (objc_msgSend(v71, "characterIsMember:", objc_msgSend(v93, "characterAtIndex:", objc_msgSend(v93, "length") - 2)) & 1) != 0))
          {
            v75 = v82;
LABEL_70:

            goto LABEL_71;
          }
          char v87 = [v82 characterIsMember:v70];

          v75 = v82;
          if ((v87 & 1) == 0)
          {
LABEL_69:
            v86 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@" "];
            [a1 insertAttributedString:v86 atIndex:0];
            goto LABEL_70;
          }
LABEL_71:

          goto LABEL_72;
        }
        int v79 = [v78 characterIsMember:v77];
      }
      int v81 = v79;
      goto LABEL_55;
    }
LABEL_19:

    int v35 = 0;
    id v89 = 0;
LABEL_22:
    if (*((unsigned char *)v104 + 24)) {
      goto LABEL_46;
    }
    v39 = [a1 string];
    v40 = [v39 substringToIndex:1];
    v41 = [v40 lowercaseString];
    v42 = [a1 string];
    v43 = [v42 substringFromIndex:1];
    v88 = [v41 stringByAppendingString:v43];

    v44 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    uint64_t v45 = [v88 rangeOfCharacterFromSet:v44];
    uint64_t v47 = v46;

    if (v45 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v45 = [v88 length];
      uint64_t v48 = 0;
      goto LABEL_35;
    }
    uint64_t v48 = 0;
    if (v45 == 1 && v47 == 1)
    {
      v49 = [a1 string];
      v50 = [v49 substringToIndex:1];
      if ([v50 isEqualToString:@","])
      {
      }
      else
      {
        v51 = [a1 string];
        v52 = [v51 substringToIndex:1];
        int v53 = [v52 isEqualToString:@";"];

        if (!v53)
        {
          uint64_t v48 = 0;
          uint64_t v45 = 1;
          goto LABEL_35;
        }
      }
      v54 = [MEMORY[0x263F08708] whitespaceCharacterSet];
      uint64_t v55 = objc_msgSend(v88, "rangeOfCharacterFromSet:options:range:", v54, 0, 2, objc_msgSend(v88, "length") - 2);

      if (v55 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v55 = [v88 length];
      }
      v56 = [a1 string];
      v57 = [v56 substringToIndex:3];
      v58 = [v57 lowercaseString];
      v59 = [a1 string];
      v60 = [v59 substringFromIndex:3];
      uint64_t v61 = [v58 stringByAppendingString:v60];

      uint64_t v45 = v55 - 2;
      uint64_t v48 = 2;
      v88 = (void *)v61;
    }
LABEL_35:
    v62 = [a1 string];
    v63 = objc_msgSend(v62, "substringWithRange:", v48, v45);

    v64 = [v63 uppercaseString];
    v65 = [v63 lowercaseString];
    if (([v65 isEqualToString:v64] & 1) == 0)
    {
      if (![v63 isEqualToString:v64])
      {

LABEL_41:
        v65 = v90[2](v90, v48, v45, v88, v91);
        if (![v65 count] || (v35 | objc_msgSend(v65, "containsObject:", v63) ^ 1) == 1)
        {
          v67 = [a1 string];
          v68 = objc_msgSend(v67, "substringWithRange:", v48, 1);
          v69 = [v68 lowercaseString];
          objc_msgSend(a1, "replaceCharactersInRange:withString:", v48, 1, v69);
        }
        goto LABEL_44;
      }
      if ((unint64_t)[a1 length] >= 2)
      {
        char v66 = [v63 isEqualToString:@"A"];

        if ((v66 & 1) == 0) {
          goto LABEL_45;
        }
        goto LABEL_41;
      }
    }
LABEL_44:

LABEL_45:
    goto LABEL_46;
  }
LABEL_73:
}

@end