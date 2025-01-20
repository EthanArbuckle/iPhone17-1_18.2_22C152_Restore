uint64_t destroy for AST.CustomCharacterClass.Member(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  uint64_t vars8;

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 3:
    case 4:
      goto LABEL_33;
    case 1:
      type metadata accessor for AST.Atom.Kind(0);
      switch(swift_getEnumCaseMultiPayload())
      {
        case 0u:
        case 5u:
        case 6u:
        case 7u:
        case 8u:
        case 0xCu:
          goto LABEL_3;
        case 2u:
        case 0xDu:
LABEL_13:
          swift_bridgeObjectRelease();
LABEL_3:
          swift_bridgeObjectRelease();
          break;
        case 3u:
          type metadata accessor for AST.Atom.CharacterProperty.Kind(0);
          switch(swift_getEnumCaseMultiPayload())
          {
            case 4u:
            case 7u:
              goto LABEL_3;
            case 5u:
              v9 = type metadata accessor for Unicode.NumericType();
              goto LABEL_25;
            case 8u:
              v9 = type metadata accessor for Unicode.CanonicalCombiningClass();
LABEL_25:
              (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
              break;
            case 0xEu:
              goto LABEL_13;
            default:
              goto LABEL_4;
          }
          break;
        case 9u:
        case 0xAu:
          outlined consume of AST.Reference.Kind(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
          break;
        case 0xBu:
          outlined consume of AST.Atom.Callout(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
            *(unsigned char *)(a1 + 152));
          break;
        default:
          break;
      }
LABEL_4:
      v3 = a1 + *(int *)(type metadata accessor for AST.CustomCharacterClass.Range(0) + 24);
      switch(swift_getEnumCaseMultiPayload())
      {
        case 0u:
        case 5u:
        case 6u:
        case 7u:
        case 8u:
        case 0xCu:
          goto LABEL_5;
        case 2u:
        case 0xDu:
LABEL_17:
          swift_bridgeObjectRelease();
LABEL_5:
          swift_bridgeObjectRelease();
          break;
        case 3u:
          type metadata accessor for AST.Atom.CharacterProperty.Kind(0);
          switch(swift_getEnumCaseMultiPayload())
          {
            case 4u:
            case 7u:
              goto LABEL_5;
            case 5u:
              v10 = type metadata accessor for Unicode.NumericType();
              goto LABEL_27;
            case 8u:
              v10 = type metadata accessor for Unicode.CanonicalCombiningClass();
LABEL_27:
              (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v3, v10);
              break;
            case 0xEu:
              goto LABEL_17;
            default:
              goto LABEL_33;
          }
          break;
        case 9u:
        case 0xAu:
          outlined consume of AST.Reference.Kind(*(void *)v3, *(void *)(v3 + 8), *(void *)(v3 + 16), *(void *)(v3 + 24), *(unsigned char *)(v3 + 32));
          break;
        case 0xBu:
          outlined consume of AST.Atom.Callout(*(void *)v3, *(void *)(v3 + 8), *(void *)(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32), *(void *)(v3 + 40), *(void *)(v3 + 48), *(void *)(v3 + 56), *(void *)(v3 + 64), *(void *)(v3 + 72), *(void *)(v3 + 80), *(void *)(v3 + 88), *(void *)(v3 + 96), *(void *)(v3 + 104), *(void *)(v3 + 112), *(void *)(v3 + 120), *(void *)(v3 + 128), *(void *)(v3 + 136), *(void *)(v3 + 144),
            *(unsigned char *)(v3 + 152));
          break;
        default:
          goto LABEL_33;
      }
      goto LABEL_33;
    case 2:
      type metadata accessor for AST.Atom.Kind(0);
      result = swift_getEnumCaseMultiPayload();
      switch((int)result)
      {
        case 0:
        case 5:
        case 6:
        case 7:
        case 8:
        case 12:
          goto LABEL_33;
        case 2:
        case 13:
          goto LABEL_32;
        case 3:
          type metadata accessor for AST.Atom.CharacterProperty.Kind(0);
          result = swift_getEnumCaseMultiPayload();
          switch((int)result)
          {
            case 4:
            case 7:
              goto LABEL_33;
            case 5:
              v11 = type metadata accessor for Unicode.NumericType();
              goto LABEL_29;
            case 8:
              v11 = type metadata accessor for Unicode.CanonicalCombiningClass();
LABEL_29:
              v12 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);
              result = v12(a1, v11);
              break;
            case 14:
              goto LABEL_32;
            default:
              return result;
          }
          break;
        case 9:
        case 10:
          v4 = *(void *)a1;
          v5 = *(void *)(a1 + 8);
          v6 = *(void *)(a1 + 16);
          v7 = *(void *)(a1 + 24);
          v8 = *(unsigned char *)(a1 + 32);
          result = outlined consume of AST.Reference.Kind(v4, v5, v6, v7, v8);
          break;
        case 11:
          result = outlined consume of AST.Atom.Callout(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
                     *(unsigned char *)(a1 + 152));
          break;
        default:
          return result;
      }
      return result;
    case 5:
LABEL_32:
      swift_bridgeObjectRelease();
LABEL_33:
      result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

void *initializeWithCopy for AST.CustomCharacterClass.Member(void *a1, void *a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v6 = type metadata accessor for AST.Atom.Kind(0);
      switch(swift_getEnumCaseMultiPayload())
      {
        case 0u:
        case 5u:
        case 6u:
        case 7u:
        case 8u:
          uint64_t v7 = a2[1];
          *a1 = *a2;
          a1[1] = v7;
          swift_bridgeObjectRetain();
          goto LABEL_32;
        case 2u:
          uint64_t v24 = a2[1];
          *a1 = *a2;
          a1[1] = v24;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          goto LABEL_32;
        case 3u:
          uint64_t v12 = type metadata accessor for AST.Atom.CharacterProperty.Kind(0);
          switch(swift_getEnumCaseMultiPayload())
          {
            case 4u:
              uint64_t v13 = a2[1];
              *a1 = *a2;
              a1[1] = v13;
              swift_bridgeObjectRetain();
              goto LABEL_30;
            case 5u:
              uint64_t v43 = type metadata accessor for Unicode.NumericType();
              (*(void (**)(void *, void *, uint64_t))(*(void *)(v43 - 8) + 16))(a1, a2, v43);
              goto LABEL_30;
            case 7u:
              *(unsigned char *)a1 = *(unsigned char *)a2;
              uint64_t v44 = a2[2];
              a1[1] = a2[1];
              a1[2] = v44;
              swift_bridgeObjectRetain();
              goto LABEL_30;
            case 8u:
              uint64_t v45 = type metadata accessor for Unicode.CanonicalCombiningClass();
              (*(void (**)(void *, void *, uint64_t))(*(void *)(v45 - 8) + 16))(a1, a2, v45);
              goto LABEL_30;
            case 0xEu:
              uint64_t v46 = a2[1];
              *a1 = *a2;
              a1[1] = v46;
              uint64_t v47 = a2[3];
              a1[2] = a2[2];
              a1[3] = v47;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
LABEL_30:
              swift_storeEnumTagMultiPayload();
              break;
            default:
              memcpy(a1, a2, *(void *)(*(void *)(v12 - 8) + 64));
              break;
          }
          uint64_t v48 = type metadata accessor for AST.Atom.CharacterProperty(0);
          *((unsigned char *)a1 + *(int *)(v48 + 20)) = *((unsigned char *)a2 + *(int *)(v48 + 20));
          *((unsigned char *)a1 + *(int *)(v48 + 24)) = *((unsigned char *)a2 + *(int *)(v48 + 24));
          goto LABEL_32;
        case 9u:
        case 0xAu:
          uint64_t v25 = *a2;
          uint64_t v26 = a2[1];
          uint64_t v27 = a2[2];
          uint64_t v28 = a2[3];
          char v29 = *((unsigned char *)a2 + 32);
          outlined copy of AST.Reference.Kind(*a2, v26, v27, v28, v29);
          *a1 = v25;
          a1[1] = v26;
          a1[2] = v27;
          a1[3] = v28;
          *((unsigned char *)a1 + 32) = v29;
          *(_OWORD *)(a1 + 5) = *(_OWORD *)(a2 + 5);
          *(_OWORD *)(a1 + 7) = *(_OWORD *)(a2 + 7);
          *((unsigned char *)a1 + 72) = *((unsigned char *)a2 + 72);
          *((_OWORD *)a1 + 5) = *((_OWORD *)a2 + 5);
          goto LABEL_32;
        case 0xBu:
          uint64_t v30 = *a2;
          uint64_t v31 = a2[1];
          uint64_t v32 = a2[2];
          uint64_t v33 = a2[3];
          uint64_t v132 = v6;
          uint64_t v89 = a2[5];
          uint64_t v92 = a2[8];
          uint64_t v95 = a2[9];
          uint64_t v98 = a2[10];
          uint64_t v101 = a2[11];
          uint64_t v104 = a2[12];
          uint64_t v107 = a2[13];
          uint64_t v110 = a2[14];
          uint64_t v113 = a2[15];
          uint64_t v116 = a2[16];
          uint64_t v119 = a2[17];
          uint64_t v122 = a2[18];
          char v127 = *((unsigned char *)a2 + 152);
          uint64_t v34 = a2[4];
          uint64_t v35 = a2[6];
          uint64_t v36 = a2[7];
          outlined copy of AST.Atom.Callout(*a2, v31, v32, v33, v34, v89, v35, v36, v92, v95, v98, v101, v104, v107, v110, v113, v116, v119, v122,
            v127);
          *a1 = v30;
          a1[1] = v31;
          a1[2] = v32;
          a1[3] = v33;
          a1[4] = v34;
          a1[5] = v89;
          uint64_t v6 = v132;
          a1[6] = v35;
          a1[7] = v36;
          a1[8] = v92;
          a1[9] = v95;
          a1[10] = v98;
          a1[11] = v101;
          a1[12] = v104;
          a1[13] = v107;
          a1[14] = v110;
          a1[15] = v113;
          a1[16] = v116;
          a1[17] = v119;
          a1[18] = v122;
          *((unsigned char *)a1 + 152) = v127;
          goto LABEL_32;
        case 0xCu:
          *(_OWORD *)a1 = *(_OWORD *)a2;
          uint64_t v14 = a2[3];
          a1[2] = a2[2];
          a1[3] = v14;
          a1[4] = a2[4];
          *(_OWORD *)(a1 + 5) = *(_OWORD *)(a2 + 5);
          swift_bridgeObjectRetain();
          goto LABEL_32;
        case 0xDu:
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *((unsigned char *)a1 + 16) = *((unsigned char *)a2 + 16);
          a1[3] = a2[3];
          *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
          *((unsigned char *)a1 + 48) = *((unsigned char *)a2 + 48);
          a1[7] = a2[7];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
LABEL_32:
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
          break;
      }
      uint64_t v49 = type metadata accessor for AST.Atom(0);
      *(_OWORD *)((char *)a1 + *(int *)(v49 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(v49 + 20));
      v50 = (int *)type metadata accessor for AST.CustomCharacterClass.Range(0);
      *(_OWORD *)((char *)a1 + v50[5]) = *(_OWORD *)((char *)a2 + v50[5]);
      uint64_t v51 = v50[6];
      v52 = (void *)((char *)a1 + v51);
      v53 = (void *)((char *)a2 + v51);
      switch(swift_getEnumCaseMultiPayload())
      {
        case 0u:
        case 5u:
        case 6u:
        case 7u:
        case 8u:
          uint64_t v54 = v53[1];
          void *v52 = *v53;
          v52[1] = v54;
          swift_bridgeObjectRetain();
          goto LABEL_60;
        case 2u:
          uint64_t v58 = v53[1];
          void *v52 = *v53;
          v52[1] = v58;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          goto LABEL_60;
        case 3u:
          uint64_t v55 = type metadata accessor for AST.Atom.CharacterProperty.Kind(0);
          switch(swift_getEnumCaseMultiPayload())
          {
            case 4u:
              uint64_t v56 = v53[1];
              void *v52 = *v53;
              v52[1] = v56;
              swift_bridgeObjectRetain();
              goto LABEL_58;
            case 5u:
              uint64_t v78 = type metadata accessor for Unicode.NumericType();
              (*(void (**)(void *, void *, uint64_t))(*(void *)(v78 - 8) + 16))(v52, v53, v78);
              goto LABEL_58;
            case 7u:
              *(unsigned char *)v52 = *(unsigned char *)v53;
              uint64_t v79 = v53[2];
              v52[1] = v53[1];
              v52[2] = v79;
              swift_bridgeObjectRetain();
              goto LABEL_58;
            case 8u:
              uint64_t v80 = type metadata accessor for Unicode.CanonicalCombiningClass();
              (*(void (**)(void *, void *, uint64_t))(*(void *)(v80 - 8) + 16))(v52, v53, v80);
              goto LABEL_58;
            case 0xEu:
              uint64_t v81 = v53[1];
              void *v52 = *v53;
              v52[1] = v81;
              uint64_t v82 = v53[3];
              v52[2] = v53[2];
              v52[3] = v82;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
LABEL_58:
              swift_storeEnumTagMultiPayload();
              break;
            default:
              memcpy(v52, v53, *(void *)(*(void *)(v55 - 8) + 64));
              break;
          }
          uint64_t v83 = type metadata accessor for AST.Atom.CharacterProperty(0);
          *((unsigned char *)v52 + *(int *)(v83 + 20)) = *((unsigned char *)v53 + *(int *)(v83 + 20));
          *((unsigned char *)v52 + *(int *)(v83 + 24)) = *((unsigned char *)v53 + *(int *)(v83 + 24));
          goto LABEL_60;
        case 9u:
          uint64_t v129 = v49;
          uint64_t v59 = *v53;
          uint64_t v60 = v53[1];
          uint64_t v61 = v53[2];
          uint64_t v62 = v53[3];
          char v124 = *((unsigned char *)v53 + 32);
          outlined copy of AST.Reference.Kind(*v53, v60, v61, v62, v124);
          void *v52 = v59;
          v52[1] = v60;
          v52[2] = v61;
          v52[3] = v62;
          uint64_t v49 = v129;
          *((unsigned char *)v52 + 32) = v124;
          *(_OWORD *)(v52 + 5) = *(_OWORD *)(v53 + 5);
          *(_OWORD *)(v52 + 7) = *(_OWORD *)(v53 + 7);
          *((unsigned char *)v52 + 72) = *((unsigned char *)v53 + 72);
          *((_OWORD *)v52 + 5) = *((_OWORD *)v53 + 5);
          goto LABEL_60;
        case 0xAu:
          uint64_t v130 = v49;
          uint64_t v63 = *v53;
          uint64_t v64 = v53[1];
          uint64_t v65 = v53[2];
          uint64_t v66 = v53[3];
          char v125 = *((unsigned char *)v53 + 32);
          outlined copy of AST.Reference.Kind(*v53, v64, v65, v66, v125);
          void *v52 = v63;
          v52[1] = v64;
          uint64_t v49 = v130;
          v52[2] = v65;
          v52[3] = v66;
          *((unsigned char *)v52 + 32) = v125;
          *(_OWORD *)(v52 + 5) = *(_OWORD *)(v53 + 5);
          *(_OWORD *)(v52 + 7) = *(_OWORD *)(v53 + 7);
          *((unsigned char *)v52 + 72) = *((unsigned char *)v53 + 72);
          *((_OWORD *)v52 + 5) = *((_OWORD *)v53 + 5);
          goto LABEL_60;
        case 0xBu:
          uint64_t v67 = v53[1];
          uint64_t v131 = v49;
          uint64_t v87 = v53[5];
          uint64_t v88 = v53[3];
          uint64_t v85 = v53[7];
          uint64_t v86 = v53[6];
          uint64_t v91 = v53[8];
          uint64_t v94 = v53[9];
          uint64_t v97 = v53[10];
          uint64_t v100 = v53[11];
          uint64_t v103 = v53[12];
          uint64_t v106 = v53[13];
          uint64_t v109 = v53[14];
          uint64_t v112 = v53[15];
          uint64_t v115 = v53[16];
          uint64_t v118 = v53[17];
          uint64_t v121 = v53[18];
          char v126 = *((unsigned char *)v53 + 152);
          uint64_t v68 = *v53;
          uint64_t v69 = v53[2];
          uint64_t v70 = v53[4];
          outlined copy of AST.Atom.Callout(*v53, v67, v69, v88, v70, v87, v86, v85, v91, v94, v97, v100, v103, v106, v109, v112, v115, v118, v121,
            v126);
          void *v52 = v68;
          v52[1] = v67;
          uint64_t v49 = v131;
          v52[2] = v69;
          v52[3] = v88;
          v52[4] = v70;
          v52[5] = v87;
          v52[6] = v86;
          v52[7] = v85;
          v52[8] = v91;
          v52[9] = v94;
          v52[10] = v97;
          v52[11] = v100;
          v52[12] = v103;
          v52[13] = v106;
          v52[14] = v109;
          v52[15] = v112;
          v52[16] = v115;
          v52[17] = v118;
          v52[18] = v121;
          *((unsigned char *)v52 + 152) = v126;
          goto LABEL_60;
        case 0xCu:
          *(_OWORD *)v52 = *(_OWORD *)v53;
          uint64_t v57 = v53[3];
          v52[2] = v53[2];
          v52[3] = v57;
          v52[4] = v53[4];
          *(_OWORD *)(v52 + 5) = *(_OWORD *)(v53 + 5);
          swift_bridgeObjectRetain();
          goto LABEL_60;
        case 0xDu:
          *(_OWORD *)v52 = *(_OWORD *)v53;
          *((unsigned char *)v52 + 16) = *((unsigned char *)v53 + 16);
          v52[3] = v53[3];
          *((_OWORD *)v52 + 2) = *((_OWORD *)v53 + 2);
          *((unsigned char *)v52 + 48) = *((unsigned char *)v53 + 48);
          v52[7] = v53[7];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
LABEL_60:
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy(v52, v53, *(void *)(*(void *)(v6 - 8) + 64));
          break;
      }
      *(_OWORD *)((char *)v52 + *(int *)(v49 + 20)) = *(_OWORD *)((char *)v53 + *(int *)(v49 + 20));
      *(void *)((char *)a1 + v50[7]) = *(void *)((char *)a2 + v50[7]);
      swift_bridgeObjectRetain();
      break;
    case 2u:
      uint64_t v8 = type metadata accessor for AST.Atom.Kind(0);
      switch(swift_getEnumCaseMultiPayload())
      {
        case 0u:
        case 5u:
        case 6u:
        case 7u:
        case 8u:
          uint64_t v9 = a2[1];
          *a1 = *a2;
          a1[1] = v9;
          swift_bridgeObjectRetain();
          goto LABEL_51;
        case 2u:
          uint64_t v15 = a2[1];
          *a1 = *a2;
          a1[1] = v15;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          goto LABEL_51;
        case 3u:
          uint64_t v16 = type metadata accessor for AST.Atom.CharacterProperty.Kind(0);
          switch(swift_getEnumCaseMultiPayload())
          {
            case 4u:
              uint64_t v17 = a2[1];
              *a1 = *a2;
              a1[1] = v17;
              swift_bridgeObjectRetain();
              goto LABEL_49;
            case 5u:
              uint64_t v71 = type metadata accessor for Unicode.NumericType();
              (*(void (**)(void *, void *, uint64_t))(*(void *)(v71 - 8) + 16))(a1, a2, v71);
              goto LABEL_49;
            case 7u:
              *(unsigned char *)a1 = *(unsigned char *)a2;
              uint64_t v72 = a2[2];
              a1[1] = a2[1];
              a1[2] = v72;
              swift_bridgeObjectRetain();
              goto LABEL_49;
            case 8u:
              uint64_t v73 = type metadata accessor for Unicode.CanonicalCombiningClass();
              (*(void (**)(void *, void *, uint64_t))(*(void *)(v73 - 8) + 16))(a1, a2, v73);
              goto LABEL_49;
            case 0xEu:
              uint64_t v74 = a2[1];
              *a1 = *a2;
              a1[1] = v74;
              uint64_t v75 = a2[3];
              a1[2] = a2[2];
              a1[3] = v75;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
LABEL_49:
              swift_storeEnumTagMultiPayload();
              break;
            default:
              memcpy(a1, a2, *(void *)(*(void *)(v16 - 8) + 64));
              break;
          }
          uint64_t v76 = type metadata accessor for AST.Atom.CharacterProperty(0);
          *((unsigned char *)a1 + *(int *)(v76 + 20)) = *((unsigned char *)a2 + *(int *)(v76 + 20));
          *((unsigned char *)a1 + *(int *)(v76 + 24)) = *((unsigned char *)a2 + *(int *)(v76 + 24));
          goto LABEL_51;
        case 9u:
        case 0xAu:
          uint64_t v18 = *a2;
          uint64_t v19 = a2[1];
          uint64_t v20 = a2[2];
          uint64_t v21 = a2[3];
          char v22 = *((unsigned char *)a2 + 32);
          outlined copy of AST.Reference.Kind(*a2, v19, v20, v21, v22);
          *a1 = v18;
          a1[1] = v19;
          a1[2] = v20;
          a1[3] = v21;
          *((unsigned char *)a1 + 32) = v22;
          *(_OWORD *)(a1 + 5) = *(_OWORD *)(a2 + 5);
          *(_OWORD *)(a1 + 7) = *(_OWORD *)(a2 + 7);
          *((unsigned char *)a1 + 72) = *((unsigned char *)a2 + 72);
          *((_OWORD *)a1 + 5) = *((_OWORD *)a2 + 5);
          goto LABEL_51;
        case 0xBu:
          uint64_t v37 = a2[1];
          uint64_t v38 = a2[2];
          uint64_t v39 = a2[3];
          uint64_t v40 = a2[4];
          uint64_t v90 = a2[7];
          uint64_t v93 = a2[5];
          uint64_t v96 = a2[8];
          uint64_t v99 = a2[9];
          uint64_t v102 = a2[10];
          uint64_t v105 = a2[11];
          uint64_t v108 = a2[12];
          uint64_t v111 = a2[13];
          uint64_t v114 = a2[14];
          uint64_t v117 = a2[15];
          uint64_t v120 = a2[16];
          uint64_t v123 = a2[17];
          uint64_t v128 = a2[18];
          char v133 = *((unsigned char *)a2 + 152);
          uint64_t v41 = *a2;
          uint64_t v42 = a2[6];
          outlined copy of AST.Atom.Callout(*a2, v37, v38, v39, v40, v93, v42, v90, v96, v99, v102, v105, v108, v111, v114, v117, v120, v123, v128,
            v133);
          *a1 = v41;
          a1[1] = v37;
          a1[2] = v38;
          a1[3] = v39;
          a1[4] = v40;
          a1[5] = v93;
          a1[6] = v42;
          a1[7] = v90;
          a1[8] = v96;
          a1[9] = v99;
          a1[10] = v102;
          a1[11] = v105;
          a1[12] = v108;
          a1[13] = v111;
          a1[14] = v114;
          a1[15] = v117;
          a1[16] = v120;
          a1[17] = v123;
          a1[18] = v128;
          *((unsigned char *)a1 + 152) = v133;
          goto LABEL_51;
        case 0xCu:
          *(_OWORD *)a1 = *(_OWORD *)a2;
          uint64_t v23 = a2[3];
          a1[2] = a2[2];
          a1[3] = v23;
          a1[4] = a2[4];
          *(_OWORD *)(a1 + 5) = *(_OWORD *)(a2 + 5);
          swift_bridgeObjectRetain();
          goto LABEL_51;
        case 0xDu:
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *((unsigned char *)a1 + 16) = *((unsigned char *)a2 + 16);
          a1[3] = a2[3];
          *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
          *((unsigned char *)a1 + 48) = *((unsigned char *)a2 + 48);
          a1[7] = a2[7];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
LABEL_51:
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
          break;
      }
      uint64_t v77 = type metadata accessor for AST.Atom(0);
      *(_OWORD *)((char *)a1 + *(int *)(v77 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(v77 + 20));
      break;
    case 3u:
    case 4u:
      uint64_t v5 = a2[1];
      *a1 = *a2;
      a1[1] = v5;
      *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
      swift_bridgeObjectRetain();
      break;
    case 5u:
      *a1 = *a2;
      *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
      uint64_t v10 = a2[3];
      uint64_t v11 = a2[4];
      a1[3] = v10;
      a1[4] = v11;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      break;
    default:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      uint64_t v4 = a2[3];
      a1[2] = a2[2];
      a1[3] = v4;
      *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
      swift_bridgeObjectRetain();
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for AST.CustomCharacterClass.Member(void *a1, void *a2)
{
  if (a1 != a2)
  {
    outlined destroy of AST.Atom((uint64_t)a1, type metadata accessor for AST.CustomCharacterClass.Member);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v5 = type metadata accessor for AST.Atom.Kind(0);
        switch(swift_getEnumCaseMultiPayload())
        {
          case 0u:
          case 5u:
          case 6u:
          case 7u:
          case 8u:
            *a1 = *a2;
            a1[1] = a2[1];
            swift_bridgeObjectRetain();
            goto LABEL_33;
          case 2u:
            *a1 = *a2;
            a1[1] = a2[1];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            goto LABEL_33;
          case 3u:
            uint64_t v8 = type metadata accessor for AST.Atom.CharacterProperty.Kind(0);
            switch(swift_getEnumCaseMultiPayload())
            {
              case 4u:
                *a1 = *a2;
                a1[1] = a2[1];
                swift_bridgeObjectRetain();
                goto LABEL_31;
              case 5u:
                uint64_t v43 = type metadata accessor for Unicode.NumericType();
                (*(void (**)(void *, void *, uint64_t))(*(void *)(v43 - 8) + 16))(a1, a2, v43);
                goto LABEL_31;
              case 7u:
                *(unsigned char *)a1 = *(unsigned char *)a2;
                a1[1] = a2[1];
                a1[2] = a2[2];
                swift_bridgeObjectRetain();
                goto LABEL_31;
              case 8u:
                uint64_t v44 = type metadata accessor for Unicode.CanonicalCombiningClass();
                (*(void (**)(void *, void *, uint64_t))(*(void *)(v44 - 8) + 16))(a1, a2, v44);
                goto LABEL_31;
              case 0xEu:
                *a1 = *a2;
                a1[1] = a2[1];
                a1[2] = a2[2];
                a1[3] = a2[3];
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
LABEL_31:
                swift_storeEnumTagMultiPayload();
                break;
              default:
                memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
                break;
            }
            uint64_t v45 = type metadata accessor for AST.Atom.CharacterProperty(0);
            *((unsigned char *)a1 + *(int *)(v45 + 20)) = *((unsigned char *)a2 + *(int *)(v45 + 20));
            *((unsigned char *)a1 + *(int *)(v45 + 24)) = *((unsigned char *)a2 + *(int *)(v45 + 24));
            goto LABEL_33;
          case 9u:
          case 0xAu:
            uint64_t v23 = *a2;
            uint64_t v24 = a2[1];
            uint64_t v25 = a2[2];
            uint64_t v26 = a2[3];
            char v27 = *((unsigned char *)a2 + 32);
            outlined copy of AST.Reference.Kind(*a2, v24, v25, v26, v27);
            *a1 = v23;
            a1[1] = v24;
            a1[2] = v25;
            a1[3] = v26;
            *((unsigned char *)a1 + 32) = v27;
            long long v28 = *(_OWORD *)(a2 + 5);
            long long v29 = *(_OWORD *)(a2 + 7);
            *((unsigned char *)a1 + 72) = *((unsigned char *)a2 + 72);
            *(_OWORD *)(a1 + 7) = v29;
            *(_OWORD *)(a1 + 5) = v28;
            *((_OWORD *)a1 + 5) = *((_OWORD *)a2 + 5);
            goto LABEL_33;
          case 0xBu:
            uint64_t v30 = *a2;
            uint64_t v31 = a2[1];
            uint64_t v32 = a2[2];
            uint64_t v33 = a2[3];
            uint64_t v126 = v5;
            uint64_t v83 = a2[5];
            uint64_t v86 = a2[8];
            uint64_t v89 = a2[9];
            uint64_t v92 = a2[10];
            uint64_t v95 = a2[11];
            uint64_t v98 = a2[12];
            uint64_t v101 = a2[13];
            uint64_t v104 = a2[14];
            uint64_t v107 = a2[15];
            uint64_t v110 = a2[16];
            uint64_t v113 = a2[17];
            uint64_t v116 = a2[18];
            char v121 = *((unsigned char *)a2 + 152);
            uint64_t v34 = a2[4];
            uint64_t v35 = a2[6];
            uint64_t v36 = a2[7];
            outlined copy of AST.Atom.Callout(*a2, v31, v32, v33, v34, v83, v35, v36, v86, v89, v92, v95, v98, v101, v104, v107, v110, v113, v116,
              v121);
            *a1 = v30;
            a1[1] = v31;
            a1[2] = v32;
            a1[3] = v33;
            a1[4] = v34;
            a1[5] = v83;
            uint64_t v5 = v126;
            a1[6] = v35;
            a1[7] = v36;
            a1[8] = v86;
            a1[9] = v89;
            a1[10] = v92;
            a1[11] = v95;
            a1[12] = v98;
            a1[13] = v101;
            a1[14] = v104;
            a1[15] = v107;
            a1[16] = v110;
            a1[17] = v113;
            a1[18] = v116;
            *((unsigned char *)a1 + 152) = v121;
            goto LABEL_33;
          case 0xCu:
            long long v9 = *(_OWORD *)a2;
            a1[2] = a2[2];
            *(_OWORD *)a1 = v9;
            a1[3] = a2[3];
            a1[4] = a2[4];
            *(_OWORD *)(a1 + 5) = *(_OWORD *)(a2 + 5);
            swift_bridgeObjectRetain();
            goto LABEL_33;
          case 0xDu:
            long long v10 = *(_OWORD *)a2;
            *((unsigned char *)a1 + 16) = *((unsigned char *)a2 + 16);
            *(_OWORD *)a1 = v10;
            a1[3] = a2[3];
            long long v11 = *((_OWORD *)a2 + 2);
            *((unsigned char *)a1 + 48) = *((unsigned char *)a2 + 48);
            *((_OWORD *)a1 + 2) = v11;
            a1[7] = a2[7];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
LABEL_33:
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(a1, a2, *(void *)(*(void *)(v5 - 8) + 64));
            break;
        }
        uint64_t v46 = type metadata accessor for AST.Atom(0);
        *(_OWORD *)((char *)a1 + *(int *)(v46 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(v46 + 20));
        uint64_t v47 = (int *)type metadata accessor for AST.CustomCharacterClass.Range(0);
        *(_OWORD *)((char *)a1 + v47[5]) = *(_OWORD *)((char *)a2 + v47[5]);
        uint64_t v48 = v47[6];
        uint64_t v49 = (void *)((char *)a1 + v48);
        v50 = (void *)((char *)a2 + v48);
        switch(swift_getEnumCaseMultiPayload())
        {
          case 0u:
          case 5u:
          case 6u:
          case 7u:
          case 8u:
            *uint64_t v49 = *v50;
            v49[1] = v50[1];
            swift_bridgeObjectRetain();
            goto LABEL_61;
          case 2u:
            *uint64_t v49 = *v50;
            v49[1] = v50[1];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            goto LABEL_61;
          case 3u:
            uint64_t v51 = type metadata accessor for AST.Atom.CharacterProperty.Kind(0);
            switch(swift_getEnumCaseMultiPayload())
            {
              case 4u:
                *uint64_t v49 = *v50;
                v49[1] = v50[1];
                swift_bridgeObjectRetain();
                goto LABEL_59;
              case 5u:
                uint64_t v75 = type metadata accessor for Unicode.NumericType();
                (*(void (**)(void *, void *, uint64_t))(*(void *)(v75 - 8) + 16))(v49, v50, v75);
                goto LABEL_59;
              case 7u:
                *(unsigned char *)uint64_t v49 = *(unsigned char *)v50;
                v49[1] = v50[1];
                v49[2] = v50[2];
                swift_bridgeObjectRetain();
                goto LABEL_59;
              case 8u:
                uint64_t v76 = type metadata accessor for Unicode.CanonicalCombiningClass();
                (*(void (**)(void *, void *, uint64_t))(*(void *)(v76 - 8) + 16))(v49, v50, v76);
                goto LABEL_59;
              case 0xEu:
                *uint64_t v49 = *v50;
                v49[1] = v50[1];
                v49[2] = v50[2];
                v49[3] = v50[3];
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
LABEL_59:
                swift_storeEnumTagMultiPayload();
                break;
              default:
                memcpy(v49, v50, *(void *)(*(void *)(v51 - 8) + 64));
                break;
            }
            uint64_t v77 = type metadata accessor for AST.Atom.CharacterProperty(0);
            *((unsigned char *)v49 + *(int *)(v77 + 20)) = *((unsigned char *)v50 + *(int *)(v77 + 20));
            *((unsigned char *)v49 + *(int *)(v77 + 24)) = *((unsigned char *)v50 + *(int *)(v77 + 24));
            goto LABEL_61;
          case 9u:
            uint64_t v123 = v46;
            uint64_t v55 = *v50;
            uint64_t v56 = v50[1];
            uint64_t v57 = v50[2];
            uint64_t v58 = v50[3];
            char v118 = *((unsigned char *)v50 + 32);
            outlined copy of AST.Reference.Kind(*v50, v56, v57, v58, v118);
            *uint64_t v49 = v55;
            v49[1] = v56;
            v49[2] = v57;
            v49[3] = v58;
            uint64_t v46 = v123;
            *((unsigned char *)v49 + 32) = v118;
            long long v59 = *(_OWORD *)(v50 + 5);
            long long v60 = *(_OWORD *)(v50 + 7);
            *((unsigned char *)v49 + 72) = *((unsigned char *)v50 + 72);
            *(_OWORD *)(v49 + 7) = v60;
            *(_OWORD *)(v49 + 5) = v59;
            *((_OWORD *)v49 + 5) = *((_OWORD *)v50 + 5);
            goto LABEL_61;
          case 0xAu:
            uint64_t v124 = v46;
            uint64_t v61 = *v50;
            uint64_t v62 = v50[1];
            uint64_t v63 = v50[2];
            uint64_t v64 = v50[3];
            char v119 = *((unsigned char *)v50 + 32);
            outlined copy of AST.Reference.Kind(*v50, v62, v63, v64, v119);
            *uint64_t v49 = v61;
            v49[1] = v62;
            uint64_t v46 = v124;
            v49[2] = v63;
            v49[3] = v64;
            *((unsigned char *)v49 + 32) = v119;
            long long v65 = *(_OWORD *)(v50 + 5);
            long long v66 = *(_OWORD *)(v50 + 7);
            *((unsigned char *)v49 + 72) = *((unsigned char *)v50 + 72);
            *(_OWORD *)(v49 + 7) = v66;
            *(_OWORD *)(v49 + 5) = v65;
            *((_OWORD *)v49 + 5) = *((_OWORD *)v50 + 5);
            goto LABEL_61;
          case 0xBu:
            uint64_t v67 = v50[1];
            uint64_t v125 = v46;
            uint64_t v81 = v50[5];
            uint64_t v82 = v50[3];
            uint64_t v79 = v50[7];
            uint64_t v80 = v50[6];
            uint64_t v85 = v50[8];
            uint64_t v88 = v50[9];
            uint64_t v91 = v50[10];
            uint64_t v94 = v50[11];
            uint64_t v97 = v50[12];
            uint64_t v100 = v50[13];
            uint64_t v103 = v50[14];
            uint64_t v106 = v50[15];
            uint64_t v109 = v50[16];
            uint64_t v112 = v50[17];
            uint64_t v115 = v50[18];
            char v120 = *((unsigned char *)v50 + 152);
            uint64_t v68 = *v50;
            uint64_t v69 = v50[2];
            uint64_t v70 = v50[4];
            outlined copy of AST.Atom.Callout(*v50, v67, v69, v82, v70, v81, v80, v79, v85, v88, v91, v94, v97, v100, v103, v106, v109, v112, v115,
              v120);
            *uint64_t v49 = v68;
            v49[1] = v67;
            uint64_t v46 = v125;
            v49[2] = v69;
            v49[3] = v82;
            v49[4] = v70;
            v49[5] = v81;
            v49[6] = v80;
            v49[7] = v79;
            v49[8] = v85;
            v49[9] = v88;
            v49[10] = v91;
            v49[11] = v94;
            v49[12] = v97;
            v49[13] = v100;
            v49[14] = v103;
            v49[15] = v106;
            v49[16] = v109;
            v49[17] = v112;
            v49[18] = v115;
            *((unsigned char *)v49 + 152) = v120;
            goto LABEL_61;
          case 0xCu:
            long long v52 = *(_OWORD *)v50;
            v49[2] = v50[2];
            *(_OWORD *)uint64_t v49 = v52;
            v49[3] = v50[3];
            v49[4] = v50[4];
            *(_OWORD *)(v49 + 5) = *(_OWORD *)(v50 + 5);
            swift_bridgeObjectRetain();
            goto LABEL_61;
          case 0xDu:
            long long v53 = *(_OWORD *)v50;
            *((unsigned char *)v49 + 16) = *((unsigned char *)v50 + 16);
            *(_OWORD *)uint64_t v49 = v53;
            v49[3] = v50[3];
            long long v54 = *((_OWORD *)v50 + 2);
            *((unsigned char *)v49 + 48) = *((unsigned char *)v50 + 48);
            *((_OWORD *)v49 + 2) = v54;
            v49[7] = v50[7];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
LABEL_61:
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(v49, v50, *(void *)(*(void *)(v5 - 8) + 64));
            break;
        }
        *(_OWORD *)((char *)v49 + *(int *)(v46 + 20)) = *(_OWORD *)((char *)v50 + *(int *)(v46 + 20));
        *(void *)((char *)a1 + v47[7]) = *(void *)((char *)a2 + v47[7]);
        swift_bridgeObjectRetain();
        break;
      case 2u:
        uint64_t v6 = type metadata accessor for AST.Atom.Kind(0);
        switch(swift_getEnumCaseMultiPayload())
        {
          case 0u:
          case 5u:
          case 6u:
          case 7u:
          case 8u:
            *a1 = *a2;
            a1[1] = a2[1];
            swift_bridgeObjectRetain();
            goto LABEL_52;
          case 2u:
            *a1 = *a2;
            a1[1] = a2[1];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            goto LABEL_52;
          case 3u:
            uint64_t v12 = type metadata accessor for AST.Atom.CharacterProperty.Kind(0);
            switch(swift_getEnumCaseMultiPayload())
            {
              case 4u:
                *a1 = *a2;
                a1[1] = a2[1];
                swift_bridgeObjectRetain();
                goto LABEL_50;
              case 5u:
                uint64_t v71 = type metadata accessor for Unicode.NumericType();
                (*(void (**)(void *, void *, uint64_t))(*(void *)(v71 - 8) + 16))(a1, a2, v71);
                goto LABEL_50;
              case 7u:
                *(unsigned char *)a1 = *(unsigned char *)a2;
                a1[1] = a2[1];
                a1[2] = a2[2];
                swift_bridgeObjectRetain();
                goto LABEL_50;
              case 8u:
                uint64_t v72 = type metadata accessor for Unicode.CanonicalCombiningClass();
                (*(void (**)(void *, void *, uint64_t))(*(void *)(v72 - 8) + 16))(a1, a2, v72);
                goto LABEL_50;
              case 0xEu:
                *a1 = *a2;
                a1[1] = a2[1];
                a1[2] = a2[2];
                a1[3] = a2[3];
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
LABEL_50:
                swift_storeEnumTagMultiPayload();
                break;
              default:
                memcpy(a1, a2, *(void *)(*(void *)(v12 - 8) + 64));
                break;
            }
            uint64_t v73 = type metadata accessor for AST.Atom.CharacterProperty(0);
            *((unsigned char *)a1 + *(int *)(v73 + 20)) = *((unsigned char *)a2 + *(int *)(v73 + 20));
            *((unsigned char *)a1 + *(int *)(v73 + 24)) = *((unsigned char *)a2 + *(int *)(v73 + 24));
            goto LABEL_52;
          case 9u:
          case 0xAu:
            uint64_t v13 = *a2;
            uint64_t v14 = a2[1];
            uint64_t v15 = a2[2];
            uint64_t v16 = a2[3];
            char v17 = *((unsigned char *)a2 + 32);
            outlined copy of AST.Reference.Kind(*a2, v14, v15, v16, v17);
            *a1 = v13;
            a1[1] = v14;
            a1[2] = v15;
            a1[3] = v16;
            *((unsigned char *)a1 + 32) = v17;
            long long v18 = *(_OWORD *)(a2 + 5);
            long long v19 = *(_OWORD *)(a2 + 7);
            *((unsigned char *)a1 + 72) = *((unsigned char *)a2 + 72);
            *(_OWORD *)(a1 + 7) = v19;
            *(_OWORD *)(a1 + 5) = v18;
            *((_OWORD *)a1 + 5) = *((_OWORD *)a2 + 5);
            goto LABEL_52;
          case 0xBu:
            uint64_t v37 = a2[1];
            uint64_t v38 = a2[2];
            uint64_t v39 = a2[3];
            uint64_t v40 = a2[4];
            uint64_t v84 = a2[7];
            uint64_t v87 = a2[5];
            uint64_t v90 = a2[8];
            uint64_t v93 = a2[9];
            uint64_t v96 = a2[10];
            uint64_t v99 = a2[11];
            uint64_t v102 = a2[12];
            uint64_t v105 = a2[13];
            uint64_t v108 = a2[14];
            uint64_t v111 = a2[15];
            uint64_t v114 = a2[16];
            uint64_t v117 = a2[17];
            uint64_t v122 = a2[18];
            char v127 = *((unsigned char *)a2 + 152);
            uint64_t v41 = *a2;
            uint64_t v42 = a2[6];
            outlined copy of AST.Atom.Callout(*a2, v37, v38, v39, v40, v87, v42, v84, v90, v93, v96, v99, v102, v105, v108, v111, v114, v117, v122,
              v127);
            *a1 = v41;
            a1[1] = v37;
            a1[2] = v38;
            a1[3] = v39;
            a1[4] = v40;
            a1[5] = v87;
            a1[6] = v42;
            a1[7] = v84;
            a1[8] = v90;
            a1[9] = v93;
            a1[10] = v96;
            a1[11] = v99;
            a1[12] = v102;
            a1[13] = v105;
            a1[14] = v108;
            a1[15] = v111;
            a1[16] = v114;
            a1[17] = v117;
            a1[18] = v122;
            *((unsigned char *)a1 + 152) = v127;
            goto LABEL_52;
          case 0xCu:
            long long v20 = *(_OWORD *)a2;
            a1[2] = a2[2];
            *(_OWORD *)a1 = v20;
            a1[3] = a2[3];
            a1[4] = a2[4];
            *(_OWORD *)(a1 + 5) = *(_OWORD *)(a2 + 5);
            swift_bridgeObjectRetain();
            goto LABEL_52;
          case 0xDu:
            long long v21 = *(_OWORD *)a2;
            *((unsigned char *)a1 + 16) = *((unsigned char *)a2 + 16);
            *(_OWORD *)a1 = v21;
            a1[3] = a2[3];
            long long v22 = *((_OWORD *)a2 + 2);
            *((unsigned char *)a1 + 48) = *((unsigned char *)a2 + 48);
            *((_OWORD *)a1 + 2) = v22;
            a1[7] = a2[7];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
LABEL_52:
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
            break;
        }
        uint64_t v74 = type metadata accessor for AST.Atom(0);
        *(_OWORD *)((char *)a1 + *(int *)(v74 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(v74 + 20));
        break;
      case 3u:
      case 4u:
        *a1 = *a2;
        a1[1] = a2[1];
        *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
        swift_bridgeObjectRetain();
        break;
      case 5u:
        *a1 = *a2;
        long long v7 = *(_OWORD *)(a2 + 1);
        a1[3] = a2[3];
        *(_OWORD *)(a1 + 1) = v7;
        a1[4] = a2[4];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
      default:
        long long v4 = *(_OWORD *)a2;
        a1[2] = a2[2];
        *(_OWORD *)a1 = v4;
        a1[3] = a2[3];
        *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
        swift_bridgeObjectRetain();
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *initializeWithTake for AST.CustomCharacterClass.Member(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v11 = type metadata accessor for AST.Atom.Kind(0);
    if (swift_getEnumCaseMultiPayload() == 3)
    {
      uint64_t v12 = type metadata accessor for AST.Atom.CharacterProperty.Kind(0);
      int v13 = swift_getEnumCaseMultiPayload();
      if (v13 == 8)
      {
        uint64_t v25 = type metadata accessor for Unicode.CanonicalCombiningClass();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 32))(a1, a2, v25);
        swift_storeEnumTagMultiPayload();
      }
      else if (v13 == 5)
      {
        uint64_t v14 = type metadata accessor for Unicode.NumericType();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(a1, a2, v14);
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(a1, a2, *(void *)(*(void *)(v12 - 8) + 64));
      }
      uint64_t v28 = type metadata accessor for AST.Atom.CharacterProperty(0);
      a1[*(int *)(v28 + 20)] = a2[*(int *)(v28 + 20)];
      a1[*(int *)(v28 + 24)] = a2[*(int *)(v28 + 24)];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    }
    uint64_t v29 = type metadata accessor for AST.Atom(0);
    *(_OWORD *)&a1[*(int *)(v29 + 20)] = *(_OWORD *)&a2[*(int *)(v29 + 20)];
    goto LABEL_30;
  }
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v7 = type metadata accessor for AST.Atom.Kind(0);
    if (swift_getEnumCaseMultiPayload() == 3)
    {
      uint64_t v8 = type metadata accessor for AST.Atom.CharacterProperty.Kind(0);
      int v9 = swift_getEnumCaseMultiPayload();
      if (v9 == 8)
      {
        uint64_t v15 = type metadata accessor for Unicode.CanonicalCombiningClass();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(a1, a2, v15);
        swift_storeEnumTagMultiPayload();
      }
      else if (v9 == 5)
      {
        uint64_t v10 = type metadata accessor for Unicode.NumericType();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(a1, a2, v10);
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
      }
      uint64_t v16 = type metadata accessor for AST.Atom.CharacterProperty(0);
      a1[*(int *)(v16 + 20)] = a2[*(int *)(v16 + 20)];
      a1[*(int *)(v16 + 24)] = a2[*(int *)(v16 + 24)];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
    }
    uint64_t v17 = type metadata accessor for AST.Atom(0);
    *(_OWORD *)&a1[*(int *)(v17 + 20)] = *(_OWORD *)&a2[*(int *)(v17 + 20)];
    long long v18 = (int *)type metadata accessor for AST.CustomCharacterClass.Range(0);
    *(_OWORD *)&a1[v18[5]] = *(_OWORD *)&a2[v18[5]];
    uint64_t v19 = v18[6];
    long long v20 = &a1[v19];
    long long v21 = &a2[v19];
    if (swift_getEnumCaseMultiPayload() == 3)
    {
      uint64_t v22 = type metadata accessor for AST.Atom.CharacterProperty.Kind(0);
      int v23 = swift_getEnumCaseMultiPayload();
      if (v23 == 8)
      {
        uint64_t v26 = type metadata accessor for Unicode.CanonicalCombiningClass();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(v20, v21, v26);
        swift_storeEnumTagMultiPayload();
      }
      else if (v23 == 5)
      {
        uint64_t v24 = type metadata accessor for Unicode.NumericType();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v20, v21, v24);
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
      }
      uint64_t v27 = type metadata accessor for AST.Atom.CharacterProperty(0);
      v20[*(int *)(v27 + 20)] = v21[*(int *)(v27 + 20)];
      v20[*(int *)(v27 + 24)] = v21[*(int *)(v27 + 24)];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v20, v21, *(void *)(*(void *)(v7 - 8) + 64));
    }
    *(_OWORD *)&v20[*(int *)(v17 + 20)] = *(_OWORD *)&v21[*(int *)(v17 + 20)];
    *(void *)&a1[v18[7]] = *(void *)&a2[v18[7]];
LABEL_30:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

char *assignWithTake for AST.CustomCharacterClass.Member(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    outlined destroy of AST.Atom((uint64_t)a1, type metadata accessor for AST.CustomCharacterClass.Member);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v11 = type metadata accessor for AST.Atom.Kind(0);
      if (swift_getEnumCaseMultiPayload() == 3)
      {
        uint64_t v12 = type metadata accessor for AST.Atom.CharacterProperty.Kind(0);
        int v13 = swift_getEnumCaseMultiPayload();
        if (v13 == 8)
        {
          uint64_t v25 = type metadata accessor for Unicode.CanonicalCombiningClass();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 32))(a1, a2, v25);
          swift_storeEnumTagMultiPayload();
        }
        else if (v13 == 5)
        {
          uint64_t v14 = type metadata accessor for Unicode.NumericType();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(a1, a2, v14);
          swift_storeEnumTagMultiPayload();
        }
        else
        {
          memcpy(a1, a2, *(void *)(*(void *)(v12 - 8) + 64));
        }
        uint64_t v26 = type metadata accessor for AST.Atom.CharacterProperty(0);
        a1[*(int *)(v26 + 20)] = a2[*(int *)(v26 + 20)];
        a1[*(int *)(v26 + 24)] = a2[*(int *)(v26 + 24)];
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
      }
      uint64_t v27 = type metadata accessor for AST.Atom(0);
      *(_OWORD *)&a1[*(int *)(v27 + 20)] = *(_OWORD *)&a2[*(int *)(v27 + 20)];
      goto LABEL_31;
    }
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v7 = type metadata accessor for AST.Atom.Kind(0);
      if (swift_getEnumCaseMultiPayload() == 3)
      {
        uint64_t v8 = type metadata accessor for AST.Atom.CharacterProperty.Kind(0);
        int v9 = swift_getEnumCaseMultiPayload();
        if (v9 == 8)
        {
          uint64_t v15 = type metadata accessor for Unicode.CanonicalCombiningClass();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(a1, a2, v15);
          swift_storeEnumTagMultiPayload();
        }
        else if (v9 == 5)
        {
          uint64_t v10 = type metadata accessor for Unicode.NumericType();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(a1, a2, v10);
          swift_storeEnumTagMultiPayload();
        }
        else
        {
          memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
        }
        uint64_t v16 = type metadata accessor for AST.Atom.CharacterProperty(0);
        a1[*(int *)(v16 + 20)] = a2[*(int *)(v16 + 20)];
        a1[*(int *)(v16 + 24)] = a2[*(int *)(v16 + 24)];
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
      }
      uint64_t v17 = type metadata accessor for AST.Atom(0);
      *(_OWORD *)&a1[*(int *)(v17 + 20)] = *(_OWORD *)&a2[*(int *)(v17 + 20)];
      long long v18 = (int *)type metadata accessor for AST.CustomCharacterClass.Range(0);
      *(_OWORD *)&a1[v18[5]] = *(_OWORD *)&a2[v18[5]];
      uint64_t v19 = v18[6];
      long long v20 = &a1[v19];
      long long v21 = &a2[v19];
      if (swift_getEnumCaseMultiPayload() == 3)
      {
        uint64_t v22 = type metadata accessor for AST.Atom.CharacterProperty.Kind(0);
        int v23 = swift_getEnumCaseMultiPayload();
        if (v23 == 8)
        {
          uint64_t v28 = type metadata accessor for Unicode.CanonicalCombiningClass();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 32))(v20, v21, v28);
          swift_storeEnumTagMultiPayload();
        }
        else if (v23 == 5)
        {
          uint64_t v24 = type metadata accessor for Unicode.NumericType();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v20, v21, v24);
          swift_storeEnumTagMultiPayload();
        }
        else
        {
          memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
        }
        uint64_t v29 = type metadata accessor for AST.Atom.CharacterProperty(0);
        v20[*(int *)(v29 + 20)] = v21[*(int *)(v29 + 20)];
        v20[*(int *)(v29 + 24)] = v21[*(int *)(v29 + 24)];
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(v20, v21, *(void *)(*(void *)(v7 - 8) + 64));
      }
      *(_OWORD *)&v20[*(int *)(v17 + 20)] = *(_OWORD *)&v21[*(int *)(v17 + 20)];
      *(void *)&a1[v18[7]] = *(void *)&a2[v18[7]];
LABEL_31:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for AST.Atom.Kind(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for AST.Atom.Kind(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t type metadata completion function for AST.CustomCharacterClass.Member()
{
  uint64_t result = type metadata accessor for AST.CustomCharacterClass.Range(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for AST.Atom(319);
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for AST.CustomCharacterClass.Range(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for AST.Atom.Kind(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 5u:
      case 6u:
      case 7u:
      case 8u:
        uint64_t v8 = a2[1];
        *a1 = *a2;
        a1[1] = v8;
        swift_bridgeObjectRetain();
        goto LABEL_20;
      case 2u:
        uint64_t v13 = a2[1];
        *a1 = *a2;
        a1[1] = v13;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_20;
      case 3u:
        uint64_t v10 = type metadata accessor for AST.Atom.CharacterProperty.Kind(0);
        switch(swift_getEnumCaseMultiPayload())
        {
          case 4u:
            uint64_t v11 = a2[1];
            *a1 = *a2;
            a1[1] = v11;
            swift_bridgeObjectRetain();
            goto LABEL_18;
          case 5u:
            uint64_t v26 = type metadata accessor for Unicode.NumericType();
            (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v26 - 8) + 16))(a1, a2, v26);
            goto LABEL_18;
          case 7u:
            *(unsigned char *)a1 = *(unsigned char *)a2;
            uint64_t v27 = a2[2];
            a1[1] = a2[1];
            a1[2] = v27;
            swift_bridgeObjectRetain();
            goto LABEL_18;
          case 8u:
            uint64_t v28 = type metadata accessor for Unicode.CanonicalCombiningClass();
            (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v28 - 8) + 16))(a1, a2, v28);
            goto LABEL_18;
          case 0xEu:
            uint64_t v29 = a2[1];
            *a1 = *a2;
            a1[1] = v29;
            uint64_t v30 = a2[3];
            a1[2] = a2[2];
            a1[3] = v30;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
LABEL_18:
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
            break;
        }
        uint64_t v31 = type metadata accessor for AST.Atom.CharacterProperty(0);
        *((unsigned char *)a1 + *(int *)(v31 + 20)) = *((unsigned char *)a2 + *(int *)(v31 + 20));
        *((unsigned char *)a1 + *(int *)(v31 + 24)) = *((unsigned char *)a2 + *(int *)(v31 + 24));
        goto LABEL_20;
      case 9u:
      case 0xAu:
        uint64_t v14 = *a2;
        uint64_t v15 = a2[1];
        uint64_t v16 = a2[2];
        uint64_t v17 = a2[3];
        char v18 = *((unsigned char *)a2 + 32);
        outlined copy of AST.Reference.Kind(*a2, v15, v16, v17, v18);
        *a1 = v14;
        a1[1] = v15;
        a1[2] = v16;
        a1[3] = v17;
        *((unsigned char *)a1 + 32) = v18;
        *(_OWORD *)(a1 + 5) = *(_OWORD *)(a2 + 5);
        *(_OWORD *)(a1 + 7) = *(_OWORD *)(a2 + 7);
        *((unsigned char *)a1 + 72) = *((unsigned char *)a2 + 72);
        *((_OWORD *)a1 + 5) = *((_OWORD *)a2 + 5);
        goto LABEL_20;
      case 0xBu:
        uint64_t v19 = *a2;
        uint64_t v20 = a2[1];
        uint64_t v21 = a2[2];
        uint64_t v22 = a2[3];
        uint64_t v94 = v7;
        uint64_t v66 = a2[5];
        uint64_t v68 = a2[8];
        uint64_t v70 = a2[9];
        uint64_t v72 = a2[10];
        uint64_t v74 = a2[11];
        uint64_t v76 = a2[12];
        uint64_t v78 = a2[13];
        uint64_t v80 = a2[14];
        uint64_t v82 = a2[15];
        uint64_t v84 = a2[16];
        uint64_t v86 = a2[17];
        uint64_t v88 = a2[18];
        char v90 = *((unsigned char *)a2 + 152);
        uint64_t v23 = a2[4];
        uint64_t v24 = a2[6];
        uint64_t v25 = a2[7];
        outlined copy of AST.Atom.Callout(*a2, v20, v21, v22, v23, v66, v24, v25, v68, v70, v72, v74, v76, v78, v80, v82, v84, v86, v88,
          v90);
        *a1 = v19;
        a1[1] = v20;
        a1[2] = v21;
        a1[3] = v22;
        a1[4] = v23;
        a1[5] = v66;
        uint64_t v7 = v94;
        a1[6] = v24;
        a1[7] = v25;
        a1[8] = v68;
        a1[9] = v70;
        a1[10] = v72;
        a1[11] = v74;
        a1[12] = v76;
        a1[13] = v78;
        a1[14] = v80;
        a1[15] = v82;
        a1[16] = v84;
        a1[17] = v86;
        a1[18] = v88;
        *((unsigned char *)a1 + 152) = v90;
        goto LABEL_20;
      case 0xCu:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        uint64_t v12 = a2[3];
        a1[2] = a2[2];
        a1[3] = v12;
        a1[4] = a2[4];
        *(_OWORD *)(a1 + 5) = *(_OWORD *)(a2 + 5);
        swift_bridgeObjectRetain();
        goto LABEL_20;
      case 0xDu:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *((unsigned char *)a1 + 16) = *((unsigned char *)a2 + 16);
        a1[3] = a2[3];
        *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
        *((unsigned char *)a1 + 48) = *((unsigned char *)a2 + 48);
        a1[7] = a2[7];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
LABEL_20:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
        break;
    }
    uint64_t v32 = type metadata accessor for AST.Atom(0);
    *(_OWORD *)((char *)a1 + *(int *)(v32 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(v32 + 20));
    uint64_t v33 = a3[6];
    *(_OWORD *)((char *)a1 + a3[5]) = *(_OWORD *)((char *)a2 + a3[5]);
    uint64_t v34 = (uint64_t *)((char *)a1 + v33);
    uint64_t v35 = (uint64_t *)((char *)a2 + v33);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 5u:
      case 6u:
      case 7u:
      case 8u:
        uint64_t v36 = v35[1];
        *uint64_t v34 = *v35;
        v34[1] = v36;
        swift_bridgeObjectRetain();
        goto LABEL_39;
      case 2u:
        uint64_t v40 = v35[1];
        *uint64_t v34 = *v35;
        v34[1] = v40;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_39;
      case 3u:
        uint64_t v37 = type metadata accessor for AST.Atom.CharacterProperty.Kind(0);
        switch(swift_getEnumCaseMultiPayload())
        {
          case 4u:
            uint64_t v38 = v35[1];
            *uint64_t v34 = *v35;
            v34[1] = v38;
            swift_bridgeObjectRetain();
            goto LABEL_37;
          case 5u:
            uint64_t v56 = type metadata accessor for Unicode.NumericType();
            (*(void (**)(void *, void *, uint64_t))(*(void *)(v56 - 8) + 16))(v34, v35, v56);
            goto LABEL_37;
          case 7u:
            *(unsigned char *)uint64_t v34 = *(unsigned char *)v35;
            uint64_t v57 = v35[2];
            v34[1] = v35[1];
            v34[2] = v57;
            swift_bridgeObjectRetain();
            goto LABEL_37;
          case 8u:
            uint64_t v58 = type metadata accessor for Unicode.CanonicalCombiningClass();
            (*(void (**)(void *, void *, uint64_t))(*(void *)(v58 - 8) + 16))(v34, v35, v58);
            goto LABEL_37;
          case 0xEu:
            uint64_t v59 = v35[1];
            *uint64_t v34 = *v35;
            v34[1] = v59;
            uint64_t v60 = v35[3];
            v34[2] = v35[2];
            v34[3] = v60;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
LABEL_37:
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(v34, v35, *(void *)(*(void *)(v37 - 8) + 64));
            break;
        }
        uint64_t v61 = type metadata accessor for AST.Atom.CharacterProperty(0);
        *((unsigned char *)v34 + *(int *)(v61 + 20)) = *((unsigned char *)v35 + *(int *)(v61 + 20));
        *((unsigned char *)v34 + *(int *)(v61 + 24)) = *((unsigned char *)v35 + *(int *)(v61 + 24));
        goto LABEL_39;
      case 9u:
        uint64_t v41 = *v35;
        uint64_t v42 = v35[1];
        uint64_t v91 = v32;
        uint64_t v44 = v35[2];
        uint64_t v43 = v35[3];
        char v45 = *((unsigned char *)v35 + 32);
        outlined copy of AST.Reference.Kind(*v35, v42, v44, v43, v45);
        *uint64_t v34 = v41;
        v34[1] = v42;
        v34[2] = v44;
        v34[3] = v43;
        *((unsigned char *)v34 + 32) = v45;
        uint64_t v32 = v91;
        *(_OWORD *)(v34 + 5) = *(_OWORD *)(v35 + 5);
        *(_OWORD *)(v34 + 7) = *(_OWORD *)(v35 + 7);
        *((unsigned char *)v34 + 72) = *((unsigned char *)v35 + 72);
        *((_OWORD *)v34 + 5) = *((_OWORD *)v35 + 5);
        goto LABEL_39;
      case 0xAu:
        uint64_t v92 = v32;
        uint64_t v46 = *v35;
        uint64_t v47 = v35[1];
        uint64_t v48 = v35[2];
        uint64_t v49 = v35[3];
        char v50 = *((unsigned char *)v35 + 32);
        outlined copy of AST.Reference.Kind(*v35, v47, v48, v49, v50);
        *uint64_t v34 = v46;
        v34[1] = v47;
        uint64_t v32 = v92;
        v34[2] = v48;
        v34[3] = v49;
        *((unsigned char *)v34 + 32) = v50;
        *(_OWORD *)(v34 + 5) = *(_OWORD *)(v35 + 5);
        *(_OWORD *)(v34 + 7) = *(_OWORD *)(v35 + 7);
        *((unsigned char *)v34 + 72) = *((unsigned char *)v35 + 72);
        *((_OWORD *)v34 + 5) = *((_OWORD *)v35 + 5);
        goto LABEL_39;
      case 0xBu:
        uint64_t v51 = v35[1];
        uint64_t v93 = v32;
        uint64_t v52 = v35[2];
        uint64_t v64 = v35[6];
        uint64_t v65 = v35[4];
        uint64_t v63 = v35[7];
        uint64_t v67 = v35[8];
        uint64_t v69 = v35[9];
        uint64_t v71 = v35[10];
        uint64_t v73 = v35[11];
        uint64_t v75 = v35[12];
        uint64_t v77 = v35[13];
        uint64_t v79 = v35[14];
        uint64_t v81 = v35[15];
        uint64_t v83 = v35[16];
        uint64_t v85 = v35[17];
        uint64_t v87 = v35[18];
        char v89 = *((unsigned char *)v35 + 152);
        uint64_t v53 = *v35;
        uint64_t v54 = v35[3];
        uint64_t v55 = v35[5];
        outlined copy of AST.Atom.Callout(*v35, v51, v52, v54, v65, v55, v64, v63, v67, v69, v71, v73, v75, v77, v79, v81, v83, v85, v87,
          v89);
        *uint64_t v34 = v53;
        v34[1] = v51;
        uint64_t v32 = v93;
        v34[2] = v52;
        v34[3] = v54;
        v34[4] = v65;
        v34[5] = v55;
        v34[6] = v64;
        v34[7] = v63;
        v34[8] = v67;
        v34[9] = v69;
        v34[10] = v71;
        v34[11] = v73;
        v34[12] = v75;
        v34[13] = v77;
        v34[14] = v79;
        v34[15] = v81;
        v34[16] = v83;
        v34[17] = v85;
        v34[18] = v87;
        *((unsigned char *)v34 + 152) = v89;
        goto LABEL_39;
      case 0xCu:
        *(_OWORD *)uint64_t v34 = *(_OWORD *)v35;
        uint64_t v39 = v35[3];
        v34[2] = v35[2];
        v34[3] = v39;
        v34[4] = v35[4];
        *(_OWORD *)(v34 + 5) = *(_OWORD *)(v35 + 5);
        swift_bridgeObjectRetain();
        goto LABEL_39;
      case 0xDu:
        *(_OWORD *)uint64_t v34 = *(_OWORD *)v35;
        *((unsigned char *)v34 + 16) = *((unsigned char *)v35 + 16);
        v34[3] = v35[3];
        *((_OWORD *)v34 + 2) = *((_OWORD *)v35 + 2);
        *((unsigned char *)v34 + 48) = *((unsigned char *)v35 + 48);
        v34[7] = v35[7];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
LABEL_39:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v34, v35, *(void *)(*(void *)(v7 - 8) + 64));
        break;
    }
    *(_OWORD *)((char *)v34 + *(int *)(v32 + 20)) = *(_OWORD *)((char *)v35 + *(int *)(v32 + 20));
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for AST.CustomCharacterClass.Range(uint64_t a1, uint64_t a2)
{
  type metadata accessor for AST.Atom.Kind(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
    case 0xCu:
      goto LABEL_2;
    case 2u:
    case 0xDu:
LABEL_10:
      swift_bridgeObjectRelease();
LABEL_2:
      swift_bridgeObjectRelease();
      break;
    case 3u:
      type metadata accessor for AST.Atom.CharacterProperty.Kind(0);
      switch(swift_getEnumCaseMultiPayload())
      {
        case 4u:
        case 7u:
          goto LABEL_2;
        case 5u:
          uint64_t v6 = type metadata accessor for Unicode.NumericType();
          goto LABEL_19;
        case 8u:
          uint64_t v6 = type metadata accessor for Unicode.CanonicalCombiningClass();
LABEL_19:
          (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
          break;
        case 0xEu:
          goto LABEL_10;
        default:
          goto LABEL_3;
      }
      break;
    case 9u:
    case 0xAu:
      outlined consume of AST.Reference.Kind(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
      break;
    case 0xBu:
      outlined consume of AST.Atom.Callout(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
        *(unsigned char *)(a1 + 152));
      break;
    default:
      break;
  }
LABEL_3:
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
    case 0xCu:
      goto LABEL_4;
    case 2u:
    case 0xDu:
LABEL_14:
      swift_bridgeObjectRelease();
LABEL_4:
      swift_bridgeObjectRelease();
      break;
    case 3u:
      type metadata accessor for AST.Atom.CharacterProperty.Kind(0);
      switch(swift_getEnumCaseMultiPayload())
      {
        case 4u:
        case 7u:
          goto LABEL_4;
        case 5u:
          uint64_t v7 = type metadata accessor for Unicode.NumericType();
          goto LABEL_21;
        case 8u:
          uint64_t v7 = type metadata accessor for Unicode.CanonicalCombiningClass();
LABEL_21:
          (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v4, v7);
          break;
        case 0xEu:
          goto LABEL_14;
        default:
          goto LABEL_5;
      }
      break;
    case 9u:
    case 0xAu:
      outlined consume of AST.Reference.Kind(*(void *)v4, *(void *)(v4 + 8), *(void *)(v4 + 16), *(void *)(v4 + 24), *(unsigned char *)(v4 + 32));
      break;
    case 0xBu:
      outlined consume of AST.Atom.Callout(*(void *)v4, *(void *)(v4 + 8), *(void *)(v4 + 16), *(void *)(v4 + 24), *(void *)(v4 + 32), *(void *)(v4 + 40), *(void *)(v4 + 48), *(void *)(v4 + 56), *(void *)(v4 + 64), *(void *)(v4 + 72), *(void *)(v4 + 80), *(void *)(v4 + 88), *(void *)(v4 + 96), *(void *)(v4 + 104), *(void *)(v4 + 112), *(void *)(v4 + 120), *(void *)(v4 + 128), *(void *)(v4 + 136), *(void *)(v4 + 144),
        *(unsigned char *)(v4 + 152));
      break;
    default:
      break;
  }
LABEL_5:

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for AST.CustomCharacterClass.Range(void *a1, void *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for AST.Atom.Kind(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
      uint64_t v7 = a2[1];
      *a1 = *a2;
      a1[1] = v7;
      swift_bridgeObjectRetain();
      goto LABEL_18;
    case 2u:
      uint64_t v11 = a2[1];
      *a1 = *a2;
      a1[1] = v11;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_18;
    case 3u:
      uint64_t v8 = type metadata accessor for AST.Atom.CharacterProperty.Kind(0);
      switch(swift_getEnumCaseMultiPayload())
      {
        case 4u:
          uint64_t v9 = a2[1];
          *a1 = *a2;
          a1[1] = v9;
          swift_bridgeObjectRetain();
          goto LABEL_16;
        case 5u:
          uint64_t v25 = type metadata accessor for Unicode.NumericType();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v25 - 8) + 16))(a1, a2, v25);
          goto LABEL_16;
        case 7u:
          *(unsigned char *)a1 = *(unsigned char *)a2;
          uint64_t v26 = a2[2];
          a1[1] = a2[1];
          a1[2] = v26;
          swift_bridgeObjectRetain();
          goto LABEL_16;
        case 8u:
          uint64_t v27 = type metadata accessor for Unicode.CanonicalCombiningClass();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v27 - 8) + 16))(a1, a2, v27);
          goto LABEL_16;
        case 0xEu:
          uint64_t v28 = a2[1];
          *a1 = *a2;
          a1[1] = v28;
          uint64_t v29 = a2[3];
          a1[2] = a2[2];
          a1[3] = v29;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
LABEL_16:
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
          break;
      }
      uint64_t v30 = type metadata accessor for AST.Atom.CharacterProperty(0);
      *((unsigned char *)a1 + *(int *)(v30 + 20)) = *((unsigned char *)a2 + *(int *)(v30 + 20));
      *((unsigned char *)a1 + *(int *)(v30 + 24)) = *((unsigned char *)a2 + *(int *)(v30 + 24));
      goto LABEL_18;
    case 9u:
    case 0xAu:
      uint64_t v12 = *a2;
      uint64_t v13 = a2[1];
      uint64_t v14 = a2[2];
      uint64_t v15 = a2[3];
      char v16 = *((unsigned char *)a2 + 32);
      outlined copy of AST.Reference.Kind(*a2, v13, v14, v15, v16);
      *a1 = v12;
      a1[1] = v13;
      a1[2] = v14;
      a1[3] = v15;
      *((unsigned char *)a1 + 32) = v16;
      *(_OWORD *)(a1 + 5) = *(_OWORD *)(a2 + 5);
      *(_OWORD *)(a1 + 7) = *(_OWORD *)(a2 + 7);
      *((unsigned char *)a1 + 72) = *((unsigned char *)a2 + 72);
      *((_OWORD *)a1 + 5) = *((_OWORD *)a2 + 5);
      goto LABEL_18;
    case 0xBu:
      uint64_t v17 = *a2;
      uint64_t v18 = a2[1];
      uint64_t v19 = a2[2];
      uint64_t v20 = a2[3];
      uint64_t v21 = a2[5];
      uint64_t v89 = v6;
      uint64_t v65 = a2[8];
      char v90 = a3;
      uint64_t v67 = a2[9];
      uint64_t v69 = a2[10];
      uint64_t v71 = a2[11];
      uint64_t v73 = a2[12];
      uint64_t v75 = a2[13];
      uint64_t v77 = a2[14];
      uint64_t v79 = a2[15];
      uint64_t v81 = a2[16];
      uint64_t v83 = a2[17];
      uint64_t v85 = a2[18];
      char v87 = *((unsigned char *)a2 + 152);
      uint64_t v22 = a2[4];
      uint64_t v23 = a2[6];
      uint64_t v24 = a2[7];
      outlined copy of AST.Atom.Callout(*a2, v18, v19, v20, v22, v21, v23, v24, v65, v67, v69, v71, v73, v75, v77, v79, v81, v83, v85,
        v87);
      *a1 = v17;
      a1[1] = v18;
      a1[2] = v19;
      a1[3] = v20;
      a1[4] = v22;
      a1[5] = v21;
      a1[6] = v23;
      a1[7] = v24;
      a1[8] = v65;
      a1[9] = v67;
      uint64_t v6 = v89;
      a3 = v90;
      a1[10] = v69;
      a1[11] = v71;
      a1[12] = v73;
      a1[13] = v75;
      a1[14] = v77;
      a1[15] = v79;
      a1[16] = v81;
      a1[17] = v83;
      a1[18] = v85;
      *((unsigned char *)a1 + 152) = v87;
      goto LABEL_18;
    case 0xCu:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      uint64_t v10 = a2[3];
      a1[2] = a2[2];
      a1[3] = v10;
      a1[4] = a2[4];
      *(_OWORD *)(a1 + 5) = *(_OWORD *)(a2 + 5);
      swift_bridgeObjectRetain();
      goto LABEL_18;
    case 0xDu:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *((unsigned char *)a1 + 16) = *((unsigned char *)a2 + 16);
      a1[3] = a2[3];
      *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
      *((unsigned char *)a1 + 48) = *((unsigned char *)a2 + 48);
      a1[7] = a2[7];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_18:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
      break;
  }
  uint64_t v31 = type metadata accessor for AST.Atom(0);
  *(_OWORD *)((char *)a1 + *(int *)(v31 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(v31 + 20));
  uint64_t v32 = a3[6];
  *(_OWORD *)((char *)a1 + a3[5]) = *(_OWORD *)((char *)a2 + a3[5]);
  uint64_t v33 = (void *)((char *)a1 + v32);
  uint64_t v34 = (void *)((char *)a2 + v32);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
      uint64_t v35 = v34[1];
      *uint64_t v33 = *v34;
      v33[1] = v35;
      swift_bridgeObjectRetain();
      goto LABEL_37;
    case 2u:
      uint64_t v39 = v34[1];
      *uint64_t v33 = *v34;
      v33[1] = v39;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_37;
    case 3u:
      uint64_t v36 = type metadata accessor for AST.Atom.CharacterProperty.Kind(0);
      switch(swift_getEnumCaseMultiPayload())
      {
        case 4u:
          uint64_t v37 = v34[1];
          *uint64_t v33 = *v34;
          v33[1] = v37;
          swift_bridgeObjectRetain();
          goto LABEL_35;
        case 5u:
          uint64_t v55 = type metadata accessor for Unicode.NumericType();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v55 - 8) + 16))(v33, v34, v55);
          goto LABEL_35;
        case 7u:
          *(unsigned char *)uint64_t v33 = *(unsigned char *)v34;
          uint64_t v56 = v34[2];
          v33[1] = v34[1];
          v33[2] = v56;
          swift_bridgeObjectRetain();
          goto LABEL_35;
        case 8u:
          uint64_t v57 = type metadata accessor for Unicode.CanonicalCombiningClass();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v57 - 8) + 16))(v33, v34, v57);
          goto LABEL_35;
        case 0xEu:
          uint64_t v58 = v34[1];
          *uint64_t v33 = *v34;
          v33[1] = v58;
          uint64_t v59 = v34[3];
          v33[2] = v34[2];
          v33[3] = v59;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
LABEL_35:
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy(v33, v34, *(void *)(*(void *)(v36 - 8) + 64));
          break;
      }
      uint64_t v60 = type metadata accessor for AST.Atom.CharacterProperty(0);
      *((unsigned char *)v33 + *(int *)(v60 + 20)) = *((unsigned char *)v34 + *(int *)(v60 + 20));
      *((unsigned char *)v33 + *(int *)(v60 + 24)) = *((unsigned char *)v34 + *(int *)(v60 + 24));
      goto LABEL_37;
    case 9u:
      uint64_t v40 = *v34;
      uint64_t v41 = v34[1];
      uint64_t v91 = a3;
      uint64_t v43 = v34[2];
      uint64_t v42 = v34[3];
      char v44 = *((unsigned char *)v34 + 32);
      outlined copy of AST.Reference.Kind(*v34, v41, v43, v42, v44);
      *uint64_t v33 = v40;
      v33[1] = v41;
      v33[2] = v43;
      v33[3] = v42;
      *((unsigned char *)v33 + 32) = v44;
      a3 = v91;
      *(_OWORD *)(v33 + 5) = *(_OWORD *)(v34 + 5);
      *(_OWORD *)(v33 + 7) = *(_OWORD *)(v34 + 7);
      *((unsigned char *)v33 + 72) = *((unsigned char *)v34 + 72);
      *((_OWORD *)v33 + 5) = *((_OWORD *)v34 + 5);
      goto LABEL_37;
    case 0xAu:
      uint64_t v92 = a3;
      uint64_t v45 = *v34;
      uint64_t v46 = v34[1];
      uint64_t v47 = v34[2];
      uint64_t v48 = v34[3];
      char v49 = *((unsigned char *)v34 + 32);
      outlined copy of AST.Reference.Kind(*v34, v46, v47, v48, v49);
      *uint64_t v33 = v45;
      v33[1] = v46;
      a3 = v92;
      v33[2] = v47;
      v33[3] = v48;
      *((unsigned char *)v33 + 32) = v49;
      *(_OWORD *)(v33 + 5) = *(_OWORD *)(v34 + 5);
      *(_OWORD *)(v33 + 7) = *(_OWORD *)(v34 + 7);
      *((unsigned char *)v33 + 72) = *((unsigned char *)v34 + 72);
      *((_OWORD *)v33 + 5) = *((_OWORD *)v34 + 5);
      goto LABEL_37;
    case 0xBu:
      uint64_t v50 = v34[1];
      uint64_t v93 = a3;
      uint64_t v51 = v34[2];
      uint64_t v63 = v34[6];
      uint64_t v64 = v34[4];
      uint64_t v62 = v34[7];
      uint64_t v66 = v34[8];
      uint64_t v68 = v34[9];
      uint64_t v70 = v34[10];
      uint64_t v72 = v34[11];
      uint64_t v74 = v34[12];
      uint64_t v76 = v34[13];
      uint64_t v78 = v34[14];
      uint64_t v80 = v34[15];
      uint64_t v82 = v34[16];
      uint64_t v84 = v34[17];
      uint64_t v86 = v34[18];
      char v88 = *((unsigned char *)v34 + 152);
      uint64_t v52 = *v34;
      uint64_t v53 = v34[3];
      uint64_t v54 = v34[5];
      outlined copy of AST.Atom.Callout(*v34, v50, v51, v53, v64, v54, v63, v62, v66, v68, v70, v72, v74, v76, v78, v80, v82, v84, v86,
        v88);
      *uint64_t v33 = v52;
      v33[1] = v50;
      a3 = v93;
      v33[2] = v51;
      v33[3] = v53;
      v33[4] = v64;
      v33[5] = v54;
      v33[6] = v63;
      v33[7] = v62;
      v33[8] = v66;
      v33[9] = v68;
      v33[10] = v70;
      v33[11] = v72;
      v33[12] = v74;
      v33[13] = v76;
      v33[14] = v78;
      v33[15] = v80;
      v33[16] = v82;
      v33[17] = v84;
      v33[18] = v86;
      *((unsigned char *)v33 + 152) = v88;
      goto LABEL_37;
    case 0xCu:
      *(_OWORD *)uint64_t v33 = *(_OWORD *)v34;
      uint64_t v38 = v34[3];
      v33[2] = v34[2];
      v33[3] = v38;
      v33[4] = v34[4];
      *(_OWORD *)(v33 + 5) = *(_OWORD *)(v34 + 5);
      swift_bridgeObjectRetain();
      goto LABEL_37;
    case 0xDu:
      *(_OWORD *)uint64_t v33 = *(_OWORD *)v34;
      *((unsigned char *)v33 + 16) = *((unsigned char *)v34 + 16);
      v33[3] = v34[3];
      *((_OWORD *)v33 + 2) = *((_OWORD *)v34 + 2);
      *((unsigned char *)v33 + 48) = *((unsigned char *)v34 + 48);
      v33[7] = v34[7];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_37:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(v33, v34, *(void *)(*(void *)(v6 - 8) + 64));
      break;
  }
  *(_OWORD *)((char *)v33 + *(int *)(v31 + 20)) = *(_OWORD *)((char *)v34 + *(int *)(v31 + 20));
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AST.CustomCharacterClass.Range(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    outlined destroy of AST.Atom((uint64_t)a1, type metadata accessor for AST.Atom.Kind);
    uint64_t v6 = type metadata accessor for AST.Atom.Kind(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 5u:
      case 6u:
      case 7u:
      case 8u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        goto LABEL_19;
      case 2u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_19;
      case 3u:
        uint64_t v7 = type metadata accessor for AST.Atom.CharacterProperty.Kind(0);
        switch(swift_getEnumCaseMultiPayload())
        {
          case 4u:
            *a1 = *a2;
            a1[1] = a2[1];
            swift_bridgeObjectRetain();
            goto LABEL_17;
          case 5u:
            uint64_t v25 = type metadata accessor for Unicode.NumericType();
            (*(void (**)(void *, void *, uint64_t))(*(void *)(v25 - 8) + 16))(a1, a2, v25);
            goto LABEL_17;
          case 7u:
            *(unsigned char *)a1 = *(unsigned char *)a2;
            a1[1] = a2[1];
            a1[2] = a2[2];
            swift_bridgeObjectRetain();
            goto LABEL_17;
          case 8u:
            uint64_t v26 = type metadata accessor for Unicode.CanonicalCombiningClass();
            (*(void (**)(void *, void *, uint64_t))(*(void *)(v26 - 8) + 16))(a1, a2, v26);
            goto LABEL_17;
          case 0xEu:
            *a1 = *a2;
            a1[1] = a2[1];
            a1[2] = a2[2];
            a1[3] = a2[3];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
LABEL_17:
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
            break;
        }
        uint64_t v27 = type metadata accessor for AST.Atom.CharacterProperty(0);
        *((unsigned char *)a1 + *(int *)(v27 + 20)) = *((unsigned char *)a2 + *(int *)(v27 + 20));
        *((unsigned char *)a1 + *(int *)(v27 + 24)) = *((unsigned char *)a2 + *(int *)(v27 + 24));
        goto LABEL_19;
      case 9u:
      case 0xAu:
        uint64_t v11 = *a2;
        uint64_t v12 = a2[1];
        uint64_t v13 = a2[2];
        uint64_t v14 = a2[3];
        char v15 = *((unsigned char *)a2 + 32);
        outlined copy of AST.Reference.Kind(*a2, v12, v13, v14, v15);
        *a1 = v11;
        a1[1] = v12;
        a1[2] = v13;
        a1[3] = v14;
        *((unsigned char *)a1 + 32) = v15;
        long long v16 = *(_OWORD *)(a2 + 5);
        long long v17 = *(_OWORD *)(a2 + 7);
        *((unsigned char *)a1 + 72) = *((unsigned char *)a2 + 72);
        *(_OWORD *)(a1 + 7) = v17;
        *(_OWORD *)(a1 + 5) = v16;
        *((_OWORD *)a1 + 5) = *((_OWORD *)a2 + 5);
        goto LABEL_19;
      case 0xBu:
        uint64_t v18 = *a2;
        uint64_t v19 = a2[1];
        uint64_t v20 = a2[2];
        uint64_t v21 = a2[3];
        uint64_t v97 = a3;
        uint64_t v69 = a2[5];
        uint64_t v71 = a2[8];
        uint64_t v73 = a2[9];
        uint64_t v75 = a2[10];
        uint64_t v77 = a2[11];
        uint64_t v79 = a2[12];
        uint64_t v81 = a2[13];
        uint64_t v83 = a2[14];
        uint64_t v85 = a2[15];
        uint64_t v87 = a2[16];
        uint64_t v89 = a2[17];
        uint64_t v91 = a2[18];
        char v93 = *((unsigned char *)a2 + 152);
        uint64_t v22 = a2[4];
        uint64_t v23 = a2[6];
        uint64_t v24 = a2[7];
        outlined copy of AST.Atom.Callout(*a2, v19, v20, v21, v22, v69, v23, v24, v71, v73, v75, v77, v79, v81, v83, v85, v87, v89, v91,
          v93);
        *a1 = v18;
        a1[1] = v19;
        a1[2] = v20;
        a1[3] = v21;
        a1[4] = v22;
        a1[5] = v69;
        a3 = v97;
        a1[6] = v23;
        a1[7] = v24;
        a1[8] = v71;
        a1[9] = v73;
        a1[10] = v75;
        a1[11] = v77;
        a1[12] = v79;
        a1[13] = v81;
        a1[14] = v83;
        a1[15] = v85;
        a1[16] = v87;
        a1[17] = v89;
        a1[18] = v91;
        *((unsigned char *)a1 + 152) = v93;
        goto LABEL_19;
      case 0xCu:
        long long v8 = *(_OWORD *)a2;
        a1[2] = a2[2];
        *(_OWORD *)a1 = v8;
        a1[3] = a2[3];
        a1[4] = a2[4];
        *(_OWORD *)(a1 + 5) = *(_OWORD *)(a2 + 5);
        swift_bridgeObjectRetain();
        goto LABEL_19;
      case 0xDu:
        long long v9 = *(_OWORD *)a2;
        *((unsigned char *)a1 + 16) = *((unsigned char *)a2 + 16);
        *(_OWORD *)a1 = v9;
        a1[3] = a2[3];
        long long v10 = *((_OWORD *)a2 + 2);
        *((unsigned char *)a1 + 48) = *((unsigned char *)a2 + 48);
        *((_OWORD *)a1 + 2) = v10;
        a1[7] = a2[7];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
LABEL_19:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
        break;
    }
  }
  uint64_t v28 = type metadata accessor for AST.Atom(0);
  uint64_t v29 = *(int *)(v28 + 20);
  uint64_t v30 = (void *)((char *)a1 + v29);
  uint64_t v31 = (void *)((char *)a2 + v29);
  *uint64_t v30 = *v31;
  v30[1] = v31[1];
  uint64_t v32 = a3[5];
  uint64_t v33 = (void *)((char *)a1 + v32);
  uint64_t v34 = (void *)((char *)a2 + v32);
  *uint64_t v33 = *v34;
  v33[1] = v34[1];
  uint64_t v35 = a3[6];
  uint64_t v36 = (void *)((char *)a1 + v35);
  uint64_t v37 = (void *)((char *)a2 + v35);
  if (a1 != a2)
  {
    outlined destroy of AST.Atom((uint64_t)a1 + v35, type metadata accessor for AST.Atom.Kind);
    uint64_t v38 = type metadata accessor for AST.Atom.Kind(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 5u:
      case 6u:
      case 7u:
      case 8u:
        *uint64_t v36 = *v37;
        v36[1] = v37[1];
        swift_bridgeObjectRetain();
        goto LABEL_39;
      case 2u:
        *uint64_t v36 = *v37;
        v36[1] = v37[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_39;
      case 3u:
        uint64_t v39 = type metadata accessor for AST.Atom.CharacterProperty.Kind(0);
        switch(swift_getEnumCaseMultiPayload())
        {
          case 4u:
            *uint64_t v36 = *v37;
            v36[1] = v37[1];
            swift_bridgeObjectRetain();
            goto LABEL_37;
          case 5u:
            uint64_t v59 = type metadata accessor for Unicode.NumericType();
            (*(void (**)(void *, void *, uint64_t))(*(void *)(v59 - 8) + 16))(v36, v37, v59);
            goto LABEL_37;
          case 7u:
            *(unsigned char *)uint64_t v36 = *(unsigned char *)v37;
            v36[1] = v37[1];
            v36[2] = v37[2];
            swift_bridgeObjectRetain();
            goto LABEL_37;
          case 8u:
            uint64_t v60 = type metadata accessor for Unicode.CanonicalCombiningClass();
            (*(void (**)(void *, void *, uint64_t))(*(void *)(v60 - 8) + 16))(v36, v37, v60);
            goto LABEL_37;
          case 0xEu:
            *uint64_t v36 = *v37;
            v36[1] = v37[1];
            v36[2] = v37[2];
            v36[3] = v37[3];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
LABEL_37:
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(v36, v37, *(void *)(*(void *)(v39 - 8) + 64));
            break;
        }
        uint64_t v61 = type metadata accessor for AST.Atom.CharacterProperty(0);
        *((unsigned char *)v36 + *(int *)(v61 + 20)) = *((unsigned char *)v37 + *(int *)(v61 + 20));
        *((unsigned char *)v36 + *(int *)(v61 + 24)) = *((unsigned char *)v37 + *(int *)(v61 + 24));
        goto LABEL_39;
      case 9u:
        uint64_t v43 = *v37;
        uint64_t v44 = v37[1];
        uint64_t v98 = a3;
        uint64_t v46 = v37[2];
        uint64_t v45 = v37[3];
        char v94 = *((unsigned char *)v37 + 32);
        outlined copy of AST.Reference.Kind(*v37, v44, v46, v45, v94);
        *uint64_t v36 = v43;
        v36[1] = v44;
        v36[2] = v46;
        v36[3] = v45;
        a3 = v98;
        *((unsigned char *)v36 + 32) = v94;
        long long v47 = *(_OWORD *)(v37 + 5);
        long long v48 = *(_OWORD *)(v37 + 7);
        *((unsigned char *)v36 + 72) = *((unsigned char *)v37 + 72);
        *(_OWORD *)(v36 + 7) = v48;
        *(_OWORD *)(v36 + 5) = v47;
        *((_OWORD *)v36 + 5) = *((_OWORD *)v37 + 5);
        goto LABEL_39;
      case 0xAu:
        uint64_t v49 = *v37;
        uint64_t v50 = v37[1];
        uint64_t v99 = a3;
        uint64_t v51 = v37[2];
        uint64_t v52 = v37[3];
        char v95 = *((unsigned char *)v37 + 32);
        outlined copy of AST.Reference.Kind(*v37, v50, v51, v52, v95);
        *uint64_t v36 = v49;
        v36[1] = v50;
        v36[2] = v51;
        v36[3] = v52;
        a3 = v99;
        *((unsigned char *)v36 + 32) = v95;
        long long v53 = *(_OWORD *)(v37 + 5);
        long long v54 = *(_OWORD *)(v37 + 7);
        *((unsigned char *)v36 + 72) = *((unsigned char *)v37 + 72);
        *(_OWORD *)(v36 + 7) = v54;
        *(_OWORD *)(v36 + 5) = v53;
        *((_OWORD *)v36 + 5) = *((_OWORD *)v37 + 5);
        goto LABEL_39;
      case 0xBu:
        uint64_t v55 = v37[1];
        uint64_t v100 = a3;
        uint64_t v68 = v37[5];
        uint64_t v70 = v37[3];
        uint64_t v66 = v37[7];
        uint64_t v67 = v37[6];
        uint64_t v72 = v37[8];
        uint64_t v74 = v37[9];
        uint64_t v76 = v37[10];
        uint64_t v78 = v37[11];
        uint64_t v80 = v37[12];
        uint64_t v82 = v37[13];
        uint64_t v84 = v37[14];
        uint64_t v86 = v37[15];
        uint64_t v88 = v37[16];
        uint64_t v90 = v37[17];
        uint64_t v92 = v37[18];
        char v96 = *((unsigned char *)v37 + 152);
        uint64_t v56 = *v37;
        uint64_t v57 = v37[2];
        uint64_t v58 = v37[4];
        outlined copy of AST.Atom.Callout(*v37, v55, v57, v70, v58, v68, v67, v66, v72, v74, v76, v78, v80, v82, v84, v86, v88, v90, v92,
          v96);
        *uint64_t v36 = v56;
        v36[1] = v55;
        v36[2] = v57;
        v36[3] = v70;
        a3 = v100;
        v36[4] = v58;
        v36[5] = v68;
        v36[6] = v67;
        v36[7] = v66;
        v36[8] = v72;
        v36[9] = v74;
        v36[10] = v76;
        v36[11] = v78;
        v36[12] = v80;
        v36[13] = v82;
        v36[14] = v84;
        v36[15] = v86;
        v36[16] = v88;
        v36[17] = v90;
        v36[18] = v92;
        *((unsigned char *)v36 + 152) = v96;
        goto LABEL_39;
      case 0xCu:
        long long v40 = *(_OWORD *)v37;
        v36[2] = v37[2];
        *(_OWORD *)uint64_t v36 = v40;
        v36[3] = v37[3];
        v36[4] = v37[4];
        *(_OWORD *)(v36 + 5) = *(_OWORD *)(v37 + 5);
        swift_bridgeObjectRetain();
        goto LABEL_39;
      case 0xDu:
        long long v41 = *(_OWORD *)v37;
        *((unsigned char *)v36 + 16) = *((unsigned char *)v37 + 16);
        *(_OWORD *)uint64_t v36 = v41;
        v36[3] = v37[3];
        long long v42 = *((_OWORD *)v37 + 2);
        *((unsigned char *)v36 + 48) = *((unsigned char *)v37 + 48);
        *((_OWORD *)v36 + 2) = v42;
        v36[7] = v37[7];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
LABEL_39:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v36, v37, *(void *)(*(void *)(v38 - 8) + 64));
        break;
    }
  }
  uint64_t v62 = *(int *)(v28 + 20);
  uint64_t v63 = (void *)((char *)v36 + v62);
  uint64_t v64 = (void *)((char *)v37 + v62);
  *uint64_t v63 = *v64;
  v63[1] = v64[1];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *initializeWithTake for AST.CustomCharacterClass.Range(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for AST.Atom.Kind(0);
  if (swift_getEnumCaseMultiPayload() == 3)
  {
    uint64_t v7 = type metadata accessor for AST.Atom.CharacterProperty.Kind(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 8)
    {
      uint64_t v10 = type metadata accessor for Unicode.CanonicalCombiningClass();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(a1, a2, v10);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 5)
    {
      uint64_t v9 = type metadata accessor for Unicode.NumericType();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
    }
    uint64_t v11 = type metadata accessor for AST.Atom.CharacterProperty(0);
    a1[*(int *)(v11 + 20)] = a2[*(int *)(v11 + 20)];
    a1[*(int *)(v11 + 24)] = a2[*(int *)(v11 + 24)];
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v12 = type metadata accessor for AST.Atom(0);
  *(_OWORD *)&a1[*(int *)(v12 + 20)] = *(_OWORD *)&a2[*(int *)(v12 + 20)];
  uint64_t v13 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  uint64_t v14 = &a1[v13];
  char v15 = &a2[v13];
  if (swift_getEnumCaseMultiPayload() == 3)
  {
    uint64_t v16 = type metadata accessor for AST.Atom.CharacterProperty.Kind(0);
    int v17 = swift_getEnumCaseMultiPayload();
    if (v17 == 8)
    {
      uint64_t v19 = type metadata accessor for Unicode.CanonicalCombiningClass();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v14, v15, v19);
      swift_storeEnumTagMultiPayload();
    }
    else if (v17 == 5)
    {
      uint64_t v18 = type metadata accessor for Unicode.NumericType();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v14, v15, v18);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
    }
    uint64_t v20 = type metadata accessor for AST.Atom.CharacterProperty(0);
    v14[*(int *)(v20 + 20)] = v15[*(int *)(v20 + 20)];
    v14[*(int *)(v20 + 24)] = v15[*(int *)(v20 + 24)];
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v14, v15, *(void *)(*(void *)(v6 - 8) + 64));
  }
  *(_OWORD *)&v14[*(int *)(v12 + 20)] = *(_OWORD *)&v15[*(int *)(v12 + 20)];
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  return a1;
}

char *assignWithTake for AST.CustomCharacterClass.Range(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    outlined destroy of AST.Atom((uint64_t)a1, type metadata accessor for AST.Atom.Kind);
    uint64_t v6 = type metadata accessor for AST.Atom.Kind(0);
    if (swift_getEnumCaseMultiPayload() == 3)
    {
      uint64_t v7 = type metadata accessor for AST.Atom.CharacterProperty.Kind(0);
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 8)
      {
        uint64_t v10 = type metadata accessor for Unicode.CanonicalCombiningClass();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(a1, a2, v10);
        swift_storeEnumTagMultiPayload();
      }
      else if (EnumCaseMultiPayload == 5)
      {
        uint64_t v9 = type metadata accessor for Unicode.NumericType();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
      }
      uint64_t v11 = type metadata accessor for AST.Atom.CharacterProperty(0);
      a1[*(int *)(v11 + 20)] = a2[*(int *)(v11 + 20)];
      a1[*(int *)(v11 + 24)] = a2[*(int *)(v11 + 24)];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v12 = type metadata accessor for AST.Atom(0);
  *(_OWORD *)&a1[*(int *)(v12 + 20)] = *(_OWORD *)&a2[*(int *)(v12 + 20)];
  uint64_t v13 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  uint64_t v14 = &a1[v13];
  char v15 = &a2[v13];
  if (a1 != a2)
  {
    outlined destroy of AST.Atom((uint64_t)&a1[v13], type metadata accessor for AST.Atom.Kind);
    uint64_t v16 = type metadata accessor for AST.Atom.Kind(0);
    if (swift_getEnumCaseMultiPayload() == 3)
    {
      uint64_t v17 = type metadata accessor for AST.Atom.CharacterProperty.Kind(0);
      int v18 = swift_getEnumCaseMultiPayload();
      if (v18 == 8)
      {
        uint64_t v20 = type metadata accessor for Unicode.CanonicalCombiningClass();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v14, v15, v20);
        swift_storeEnumTagMultiPayload();
      }
      else if (v18 == 5)
      {
        uint64_t v19 = type metadata accessor for Unicode.NumericType();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v14, v15, v19);
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
      }
      uint64_t v21 = type metadata accessor for AST.Atom.CharacterProperty(0);
      v14[*(int *)(v21 + 20)] = v15[*(int *)(v21 + 20)];
      v14[*(int *)(v21 + 24)] = v15[*(int *)(v21 + 24)];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
    }
  }
  *(_OWORD *)&v14[*(int *)(v12 + 20)] = *(_OWORD *)&v15[*(int *)(v12 + 20)];
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AST.CustomCharacterClass.Range(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20D9CFEB0);
}

uint64_t sub_20D9CFEB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for AST.Atom(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    long long v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 28));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for AST.CustomCharacterClass.Range(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20D9CFF84);
}

uint64_t sub_20D9CFF84(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for AST.Atom(0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata completion function for AST.CustomCharacterClass.Range()
{
  uint64_t result = type metadata accessor for AST.Atom(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for AST.CustomCharacterClass.SetOp()
{
  return &type metadata for AST.CustomCharacterClass.SetOp;
}

ValueMetadata *type metadata accessor for AST.CustomCharacterClass.Start()
{
  return &type metadata for AST.CustomCharacterClass.Start;
}

uint64_t destroy for AST.Group(uint64_t a1)
{
  outlined consume of AST.Group.Kind(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(unsigned char *)(a1 + 80));

  return swift_release();
}

uint64_t initializeWithCopy for AST.Group(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  uint64_t v10 = *(void *)(a2 + 48);
  uint64_t v11 = *(void *)(a2 + 56);
  uint64_t v13 = *(void *)(a2 + 64);
  uint64_t v14 = *(void *)(a2 + 72);
  char v15 = *(unsigned char *)(a2 + 80);
  outlined copy of AST.Group.Kind(*(void *)a2, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = v10;
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v13;
  *(void *)(a1 + 72) = v14;
  *(unsigned char *)(a1 + 80) = v15;
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for AST.Group(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  uint64_t v10 = *(void *)(a2 + 48);
  uint64_t v11 = *(void *)(a2 + 56);
  uint64_t v24 = *(void *)(a2 + 64);
  uint64_t v25 = *(void *)(a2 + 72);
  char v26 = *(unsigned char *)(a2 + 80);
  outlined copy of AST.Group.Kind(*(void *)a2, v5, v6, v7, v8, v9, v10, v11, v24, v25, v26);
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  uint64_t v20 = *(void *)(a1 + 64);
  uint64_t v21 = *(void *)(a1 + 72);
  char v22 = *(unsigned char *)(a1 + 80);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = v10;
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v24;
  *(void *)(a1 + 72) = v25;
  *(unsigned char *)(a1 + 80) = v26;
  outlined consume of AST.Group.Kind(v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_retain();
  swift_release();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  return a1;
}

uint64_t assignWithTake for AST.Group(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 80);
  uint64_t v5 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 64);
  uint64_t v14 = *(void *)(a1 + 72);
  char v15 = *(unsigned char *)(a1 + 80);
  long long v16 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v16;
  long long v17 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v17;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = v4;
  outlined consume of AST.Group.Kind(v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_release();
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  return a1;
}

uint64_t getEnumTagSinglePayload for AST.Group(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 128)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 80);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AST.Group(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 128) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 128) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 80) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AST.Group()
{
  return &type metadata for AST.Group;
}

uint64_t destroy for AST.Group.Kind(uint64_t a1)
{
  return outlined consume of AST.Group.Kind(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(unsigned char *)(a1 + 80));
}

uint64_t initializeWithCopy for AST.Group.Kind(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v13 = *(void *)(a2 + 72);
  char v14 = *(unsigned char *)(a2 + 80);
  outlined copy of AST.Group.Kind(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v13;
  *(unsigned char *)(a1 + 80) = v14;
  return a1;
}

uint64_t assignWithCopy for AST.Group.Kind(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v24 = *(void *)(a2 + 72);
  char v25 = *(unsigned char *)(a2 + 80);
  outlined copy of AST.Group.Kind(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v24, v25);
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  uint64_t v20 = *(void *)(a1 + 64);
  uint64_t v21 = *(void *)(a1 + 72);
  char v22 = *(unsigned char *)(a1 + 80);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v24;
  *(unsigned char *)(a1 + 80) = v25;
  outlined consume of AST.Group.Kind(v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
  return a1;
}

__n128 __swift_memcpy81_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for AST.Group.Kind(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 80);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 72);
  char v14 = *(unsigned char *)(a1 + 80);
  long long v15 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v15;
  long long v16 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v16;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = v3;
  outlined consume of AST.Group.Kind(v4, v6, v5, v7, v8, v9, v10, v11, v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for AST.Group.Kind(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 81)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 80);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AST.Group.Kind(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 80) = 0;
    *(void *)__n128 result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 81) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 81) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 80) = -(char)a2;
    }
  }
  return result;
}

uint64_t getEnumTag for AST.Group.Kind(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 80) <= 2u) {
    return *(unsigned __int8 *)(a1 + 80);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t destructiveInjectEnumTag for AST.Group.Kind(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)__n128 result = a2 - 3;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)(result + 72) = 0;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 80) = a2;
  return result;
}

ValueMetadata *type metadata accessor for AST.Group.Kind()
{
  return &type metadata for AST.Group.Kind;
}

uint64_t destroy for AST.Group.BalancedCapture()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AST.Group.BalancedCapture(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AST.Group.BalancedCapture(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  return a1;
}

uint64_t assignWithTake for AST.Group.BalancedCapture(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for AST.Group.BalancedCapture(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 56);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AST.Group.BalancedCapture(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 56) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AST.Group.BalancedCapture()
{
  return &type metadata for AST.Group.BalancedCapture;
}

uint64_t getEnumTagSinglePayload for AST.MatchingOption(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xED && a1[24]) {
    return (*(_DWORD *)a1 + 237);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 0x14;
  int v5 = v3 - 20;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for AST.MatchingOption(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xEC)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 237;
    if (a3 >= 0xED) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0xED) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 19;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AST.MatchingOption()
{
  return &type metadata for AST.MatchingOption;
}

uint64_t getEnumTagSinglePayload for AST.MatchingOption.Kind(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xED) {
    goto LABEL_17;
  }
  if (a2 + 19 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 19) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 19;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 19;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 19;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x14;
  int v8 = v6 - 20;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AST.MatchingOption.Kind(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 19 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 19) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xED) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEC)
  {
    unsigned int v6 = ((a2 - 237) >> 8) + 1;
    *__n128 result = a2 + 19;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x20D9D0C60);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 19;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AST.MatchingOption.Kind()
{
  return &type metadata for AST.MatchingOption.Kind;
}

uint64_t destroy for AST.MatchingOptionSequence()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AST.MatchingOptionSequence(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AST.MatchingOptionSequence(uint64_t a1, long long *a2)
{
  long long v4 = *a2;
  *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
  *(_OWORD *)a1 = v4;
  *(void *)(a1 + 24) = *((void *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v5 = a2[2];
  *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
  *(_OWORD *)(a1 + 32) = v5;
  *(void *)(a1 + 56) = *((void *)a2 + 7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for AST.MatchingOptionSequence(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AST.Atom.Callout.OnigurumaTag(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AST.Atom.Callout.OnigurumaTag(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AST.MatchingOptionSequence()
{
  return &type metadata for AST.MatchingOptionSequence;
}

uint64_t getEnumTagSinglePayload for AST.GlobalMatchingOption(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *(void *)(a1 + 8) >> 1;
  if (v2 > 0x80000000) {
    int v3 = ~v2;
  }
  else {
    int v3 = -1;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for AST.GlobalMatchingOption(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = 2 * -a2;
      *(void *)(result + 16) = 0;
      *(void *)(result + 24) = 0;
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AST.GlobalMatchingOption()
{
  return &type metadata for AST.GlobalMatchingOption;
}

ValueMetadata *type metadata accessor for AST.GlobalMatchingOption.NewlineMatching()
{
  return &type metadata for AST.GlobalMatchingOption.NewlineMatching;
}

ValueMetadata *type metadata accessor for AST.GlobalMatchingOption.NewlineSequenceMatching()
{
  return &type metadata for AST.GlobalMatchingOption.NewlineSequenceMatching;
}

uint64_t getEnumTagSinglePayload for AST.GlobalMatchingOption.Kind(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *(void *)(a1 + 8) >> 1;
  if (v2 > 0x80000000) {
    int v3 = ~v2;
  }
  else {
    int v3 = -1;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for AST.GlobalMatchingOption.Kind(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = 2 * -a2;
      *(void *)(result + 16) = 0;
      *(void *)(result + 24) = 0;
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t getEnumTag for AST.GlobalMatchingOption.Kind(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8) >> 61;
  if (v1 <= 4) {
    return v1;
  }
  else {
    return (*(_DWORD *)a1 + 5);
  }
}

uint64_t destructiveProjectEnumData for AST.GlobalMatchingOption.Kind(uint64_t result)
{
  *(void *)(result + 8) &= 0x1FFFFFFFFFFFFFFFuLL;
  return result;
}

void *destructiveInjectEnumTag for AST.GlobalMatchingOption.Kind(void *result, uint64_t a2)
{
  if (a2 < 5)
  {
    result[1] = result[1] & 1 | (a2 << 61);
  }
  else
  {
    *__n128 result = (a2 - 5);
    result[1] = 0xA000000000000000;
    result[2] = 0;
    result[3] = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for AST.GlobalMatchingOption.Kind()
{
  return &type metadata for AST.GlobalMatchingOption.Kind;
}

uint64_t destroy for AST.Quantification()
{
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AST.Quantification(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v3;
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  uint64_t v6 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v6;
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AST.Quantification(uint64_t a1, long long *a2)
{
  long long v4 = *a2;
  long long v5 = a2[1];
  long long v6 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v6;
  *(_OWORD *)a1 = v4;
  *(_OWORD *)(a1 + 16) = v5;
  *(void *)(a1 + 64) = *((void *)a2 + 8);
  *(void *)(a1 + 72) = *((void *)a2 + 9);
  *(unsigned char *)(a1 + 80) = *((unsigned char *)a2 + 80);
  *(void *)(a1 + 88) = *((void *)a2 + 11);
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *(void *)(a1 + 104) = *((void *)a2 + 13);
  swift_retain();
  swift_release();
  *(void *)(a1 + 112) = *((void *)a2 + 14);
  *(void *)(a1 + 120) = *((void *)a2 + 15);
  *(void *)(a1 + 128) = *((void *)a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for AST.Quantification(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_release();
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  uint64_t v6 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AST.Quantification(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 136)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *(void *)(a1 + 8) >> 1;
  if (v2 > 0x80000000) {
    int v3 = ~v2;
  }
  else {
    int v3 = -1;
  }
  return (v3 + 1);
}

double storeEnumTagSinglePayload for AST.Quantification(uint64_t a1, int a2, int a3)
{
  if (a2 < 0)
  {
    double result = 0.0;
    *(_OWORD *)(a1 + 104) = 0u;
    *(_OWORD *)(a1 + 88) = 0u;
    *(_OWORD *)(a1 + 72) = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_OWORD *)(a1 + 120) = 0u;
    *(void *)a1 = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(a1 + 136) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = 2 * -a2;
      double result = 0.0;
      *(_OWORD *)(a1 + 16) = 0u;
      *(_OWORD *)(a1 + 32) = 0u;
      *(_OWORD *)(a1 + 48) = 0u;
      return result;
    }
    *(unsigned char *)(a1 + 136) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AST.Quantification()
{
  return &type metadata for AST.Quantification;
}

uint64_t getEnumTagSinglePayload for AST.Quantification.Amount(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *(void *)(a1 + 8) >> 1;
  if (v2 > 0x80000000) {
    int v3 = ~v2;
  }
  else {
    int v3 = -1;
  }
  return (v3 + 1);
}

double storeEnumTagSinglePayload for AST.Quantification.Amount(uint64_t a1, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(a1 + 56) = 0;
    double result = 0.0;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(void *)a1 = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(a1 + 64) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = 2 * -a2;
      double result = 0.0;
      *(_OWORD *)(a1 + 16) = 0u;
      *(_OWORD *)(a1 + 32) = 0u;
      *(_OWORD *)(a1 + 48) = 0u;
      return result;
    }
    *(unsigned char *)(a1 + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t getEnumTag for AST.Quantification.Amount(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40) >> 61;
  if (v1 <= 3) {
    return v1;
  }
  else {
    return (*(_DWORD *)a1 + 4);
  }
}

uint64_t destructiveProjectEnumData for AST.Quantification.Amount(uint64_t result)
{
  *(void *)(result + 40) &= 0x1FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t destructiveInjectEnumTag for AST.Quantification.Amount(uint64_t result, uint64_t a2)
{
  if (a2 < 4)
  {
    uint64_t v2 = *(void *)(result + 40) & 1 | (a2 << 61);
    *(void *)(result + 8) &= 1uLL;
    *(void *)(result + 40) = v2;
  }
  else
  {
    *(void *)double result = (a2 - 4);
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)(result + 48) = 0;
    *(void *)(result + 56) = 0;
    *(void *)(result + 40) = 0x8000000000000000;
  }
  return result;
}

ValueMetadata *type metadata accessor for AST.Quantification.Amount()
{
  return &type metadata for AST.Quantification.Amount;
}

ValueMetadata *type metadata accessor for AST.Quantification.Kind()
{
  return &type metadata for AST.Quantification.Kind;
}

ValueMetadata *type metadata accessor for CaptureList()
{
  return &type metadata for CaptureList;
}

uint64_t destroy for CaptureList.Capture()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CaptureList.Capture(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CaptureList.Capture(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for CaptureList.Capture(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for CaptureList.Capture(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 49)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CaptureList.Capture(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 49) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 49) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CaptureList.Capture()
{
  return &type metadata for CaptureList.Capture;
}

ValueMetadata *type metadata accessor for CaptureList.Builder()
{
  return &type metadata for CaptureList.Builder;
}

uint64_t getEnumTagSinglePayload for CaptureList.Builder.OptionalNesting(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for CaptureList.Builder.OptionalNesting(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CaptureList.Builder.OptionalNesting()
{
  return &type metadata for CaptureList.Builder.OptionalNesting;
}

uint64_t destroy for CompilerLexError()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CompilerLexError(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CompilerLexError(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for CompilerLexError(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for CompilerLexError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 25)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CompilerLexError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 25) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CompilerLexError()
{
  return &type metadata for CompilerLexError;
}

uint64_t initializeWithCopy for CompilerParseError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CompilerParseError(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  return a1;
}

uint64_t assignWithTake for CompilerParseError(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for CompilerParseError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 25)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CompilerParseError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 25) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CompilerParseError()
{
  return &type metadata for CompilerParseError;
}

uint64_t getEnumTagSinglePayload for Delimiter(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[16]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = v3 - 2;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for Delimiter(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Delimiter()
{
  return &type metadata for Delimiter;
}

uint64_t getEnumTagSinglePayload for DelimiterLexError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFC && a1[16]) {
    return (*(_DWORD *)a1 + 252);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 5;
  int v5 = v3 - 5;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DelimiterLexError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(void *)__n128 result = a2 - 252;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 4;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DelimiterLexError()
{
  return &type metadata for DelimiterLexError;
}

uint64_t getEnumTagSinglePayload for AST.Atom.CharacterProperty.PCRESpecialCategory(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AST.Atom.CharacterProperty.PCRESpecialCategory(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *__n128 result = a2 + 4;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x20D9D1CDCLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DelimiterLexError.Kind()
{
  return &type metadata for DelimiterLexError.Kind;
}

uint64_t initializeBufferWithCopyOfBuffer for Diagnostic(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t outlined consume of ParseError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 <= 0x23u)
  {
    if (((1 << a5) & 0x363FBFF5FLL) == 0)
    {
      if (a5 != 18 && a5 != 35) {
        return result;
      }
      swift_bridgeObjectRelease();
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t outlined destroy of ParseError(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy73_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

ValueMetadata *type metadata accessor for Diagnostic()
{
  return &type metadata for Diagnostic;
}

unsigned char *destructiveInjectEnumTag for Diagnostic.Behavior(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Diagnostic.Behavior()
{
  return &type metadata for Diagnostic.Behavior;
}

ValueMetadata *type metadata accessor for Diagnostics()
{
  return &type metadata for Diagnostics;
}

uint64_t initializeWithCopy for AST.Quote(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AST.Quote(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

uint64_t assignWithTake for AST.Quote(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for AST.Quote(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AST.Quote(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Source()
{
  return &type metadata for Source;
}

ValueMetadata *type metadata accessor for Source.Location()
{
  return &type metadata for Source.Location;
}

uint64_t dispatch thunk of LocatedErrorProtocol.location.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of LocatedErrorProtocol._typeErasedError.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t type metadata instantiation function for Source.LocatedError(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t type metadata completion function for Source.LocatedError()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t type metadata instantiation function for Source.Located(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t type metadata completion function for Source.Located()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Source.LocatedError(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    *(_OWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  return v4;
}

uint64_t destroy for Source.LocatedError(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

uint64_t initializeWithCopy for Source.LocatedError(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  *(_OWORD *)((*(void *)(v5 + 48) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(void *)(v5 + 48) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t assignWithCopy for Source.LocatedError(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  int v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  v7[1] = v8[1];
  return a1;
}

uint64_t initializeWithTake for Source.LocatedError(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  *(_OWORD *)((*(void *)(v5 + 32) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(void *)(v5 + 32) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t assignWithTake for Source.LocatedError(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  int v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  v7[1] = v8[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for Source.LocatedError(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (!a2) {
    return 0;
  }
  if (v5 < a2)
  {
    unint64_t v6 = ((*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
    unsigned int v7 = a2 - v5;
    uint64_t v8 = v6 & 0xFFFFFFF8;
    if ((v6 & 0xFFFFFFF8) != 0) {
      unsigned int v9 = 2;
    }
    else {
      unsigned int v9 = v7 + 1;
    }
    if (v9 >= 0x10000) {
      unsigned int v10 = 4;
    }
    else {
      unsigned int v10 = 2;
    }
    if (v9 < 0x100) {
      unsigned int v10 = 1;
    }
    if (v9 >= 2) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    switch(v11)
    {
      case 1:
        int v12 = *((unsigned __int8 *)a1 + v6);
        if (!v12) {
          break;
        }
        goto LABEL_18;
      case 2:
        int v12 = *(unsigned __int16 *)((char *)a1 + v6);
        if (v12) {
          goto LABEL_18;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x20D9D25C8);
      case 4:
        int v12 = *(_DWORD *)((char *)a1 + v6);
        if (!v12) {
          break;
        }
LABEL_18:
        int v13 = v12 - 1;
        if (v8)
        {
          int v13 = 0;
          LODWORD(v8) = *a1;
        }
        return v5 + (v8 | v13) + 1;
      default:
        break;
    }
  }
  if (v5) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  else {
    return 0;
  }
}

void storeEnumTagSinglePayload for Source.LocatedError(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = ((*(void *)(v6 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v7 >= a3)
  {
    int v12 = 0;
    int v13 = a2 - v7;
    if (a2 <= v7)
    {
LABEL_14:
      switch(v12)
      {
        case 1:
          a1[v8] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_27;
        case 2:
          *(_WORD *)&a1[v8] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_27;
        case 3:
          goto LABEL_34;
        case 4:
          *(_DWORD *)&a1[v8] = 0;
          goto LABEL_26;
        default:
LABEL_26:
          if (a2)
          {
LABEL_27:
            long long v16 = *(void (**)(void))(v6 + 56);
            v16();
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v9 = a3 - v7;
    if (((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      unsigned int v10 = v9 + 1;
    }
    else {
      unsigned int v10 = 2;
    }
    if (v10 >= 0x10000) {
      int v11 = 4;
    }
    else {
      int v11 = 2;
    }
    if (v10 < 0x100) {
      int v11 = 1;
    }
    if (v10 >= 2) {
      int v12 = v11;
    }
    else {
      int v12 = 0;
    }
    int v13 = a2 - v7;
    if (a2 <= v7) {
      goto LABEL_14;
    }
  }
  if (((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
    int v14 = v13;
  }
  else {
    int v14 = 1;
  }
  if (((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    unsigned int v15 = ~v7 + a2;
    bzero(a1, v8);
    *(_DWORD *)a1 = v15;
  }
  switch(v12)
  {
    case 1:
      a1[v8] = v14;
      break;
    case 2:
      *(_WORD *)&a1[v8] = v14;
      break;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x20D9D2788);
    case 4:
      *(_DWORD *)&a1[v8] = v14;
      break;
    default:
      return;
  }
}

ValueMetadata *type metadata accessor for SyntaxOptions()
{
  return &type metadata for SyntaxOptions;
}

uint64_t dispatch thunk of _ASTPrintable._dumpBase.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t destroy for PrettyPrinter()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PrettyPrinter(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PrettyPrinter(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v4;
  uint64_t v5 = a2[2];
  *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 32) = a2[4];
  *(void *)(a1 + 40) = a2[5];
  *(void *)(a1 + 48) = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *((unsigned char *)a2 + 56);
  *(void *)(a1 + 64) = a2[8];
  *(unsigned char *)(a1 + 72) = *((unsigned char *)a2 + 72);
  *(void *)(a1 + 80) = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for PrettyPrinter(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PrettyPrinter(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PrettyPrinter(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 48) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrettyPrinter()
{
  return &type metadata for PrettyPrinter;
}

uint64_t dispatch thunk of _TreeNode.children.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

ValueMetadata *type metadata accessor for Unicode.Scalar.AllScalars()
{
  return &type metadata for Unicode.Scalar.AllScalars;
}

ValueMetadata *type metadata accessor for Unsupported()
{
  return &type metadata for Unsupported;
}

uint64_t destroy for Unsupported()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for Unsupported(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for Unsupported(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  return a1;
}

void *assignWithTake for Unsupported(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  return a1;
}

uint64_t getEnumTagSinglePayload for Unsupported(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Unsupported(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Unreachable()
{
  return &type metadata for Unreachable;
}

uint64_t getEnumTagSinglePayload for AnyType(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 8)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AnyType(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnyType()
{
  return &type metadata for AnyType;
}

uint64_t getEnumTagSinglePayload for Unicode.Script(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0x5E) {
    goto LABEL_17;
  }
  if (a2 + 162 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 162) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 162;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 162;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 162;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA3;
  int v8 = v6 - 163;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for Unicode.Script(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 162 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 162) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0x5E) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0x5D)
  {
    unsigned int v6 = ((a2 - 94) >> 8) + 1;
    *__n128 result = a2 - 94;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x20D9D2EB8);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 - 94;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Unicode.Script()
{
  return &type metadata for Unicode.Script;
}

uint64_t getEnumTagSinglePayload for AST.GlobalMatchingOption.NewlineMatching(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AST.GlobalMatchingOption.NewlineMatching(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *__n128 result = a2 + 5;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x20D9D3054);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Unicode.POSIXProperty()
{
  return &type metadata for Unicode.POSIXProperty;
}

uint64_t getEnumTagSinglePayload for Unicode.ExtendedGeneralCategory(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xDB) {
    goto LABEL_17;
  }
  if (a2 + 37 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 37) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 37;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 37;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 37;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x26;
  int v8 = v6 - 38;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for Unicode.ExtendedGeneralCategory(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 37 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 37) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xDB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xDA)
  {
    unsigned int v6 = ((a2 - 219) >> 8) + 1;
    *__n128 result = a2 + 37;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x20D9D31E8);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 37;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Unicode.ExtendedGeneralCategory()
{
  return &type metadata for Unicode.ExtendedGeneralCategory;
}

uint64_t getEnumTagSinglePayload for Unicode.BinaryProperty(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xBE) {
    goto LABEL_17;
  }
  if (a2 + 66 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 66) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 66;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 66;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 66;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x43;
  int v8 = v6 - 67;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for Unicode.BinaryProperty(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 66 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 66) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xBE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xBD)
  {
    unsigned int v6 = ((a2 - 190) >> 8) + 1;
    *__n128 result = a2 + 66;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x20D9D337CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 66;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Unicode.BinaryProperty()
{
  return &type metadata for Unicode.BinaryProperty;
}

_WORD *__swift_memcpy2_2(_WORD *result, _WORD *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Unicode.Block(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >> 6 < 0x3FB) {
    goto LABEL_17;
  }
  if (a2 + 320 <= 0xFFFEFFFF) {
    int v2 = 2;
  }
  else {
    int v2 = 4;
  }
  if (a2 + 320 < 0xFF0000) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 16)) - 320;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 16)) - 320;
    }
    int v4 = *((unsigned __int8 *)a1 + 2);
    if (*((unsigned char *)a1 + 2)) {
      return (*a1 | (v4 << 16)) - 320;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x141;
  int v8 = v6 - 321;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for Unicode.Block(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 320 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 320 < 0xFF0000) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >> 6 >= 0x3FB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 >> 6 > 0x3FA)
  {
    unsigned int v6 = ((a2 - 65216) >> 16) + 1;
    *(_WORD *)__n128 result = a2 + 320;
    switch(v5)
    {
      case 1:
        *(unsigned char *)(result + 2) = v6;
        break;
      case 2:
        *(_WORD *)(result + 2) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x20D9D3524);
      case 4:
        *(_DWORD *)(result + 2) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        *(unsigned char *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 2) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *(_WORD *)__n128 result = a2 + 320;
        break;
    }
  }
  return result;
}

uint64_t getEnumTag for Unicode.Block(unsigned __int16 *a1)
{
  return *a1;
}

_WORD *destructiveInjectEnumTag for Unicode.Block(_WORD *result, __int16 a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Unicode.Block()
{
  return &type metadata for Unicode.Block;
}

ValueMetadata *type metadata accessor for TypeConstruction()
{
  return &type metadata for TypeConstruction;
}

uint64_t destroy for ParseError(uint64_t a1, uint64_t a2)
{
  return destroy for AST.Reference(a1, a2, (uint64_t (*)(void, void, void, void, void))outlined consume of ParseError);
}

uint64_t destroy for AST.Reference(uint64_t a1, uint64_t a2, uint64_t (*a3)(void, void, void, void, void))
{
  return a3(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned __int8 *)(a1 + 32));
}

uint64_t initializeWithCopy for ParseError(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return initializeWithCopy for AST.Reference.Kind(a1, a2, a3, (void (*)(void, uint64_t, uint64_t, uint64_t, uint64_t))outlined copy of ParseError);
}

uint64_t initializeWithCopy for AST.Reference.Kind(uint64_t a1, uint64_t *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = a2[2];
  uint64_t v8 = a2[3];
  uint64_t v9 = *((unsigned __int8 *)a2 + 32);
  a4(*a2, v6, v7, v8, v9);
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v8;
  *(unsigned char *)(a1 + 32) = v9;
  return a1;
}

uint64_t *assignWithCopy for ParseError(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return assignWithCopy for AST.Reference.Kind(a1, a2, a3, (void (*)(void, uint64_t, uint64_t, uint64_t, uint64_t))outlined copy of ParseError, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))outlined consume of ParseError);
}

uint64_t *assignWithCopy for AST.Reference.Kind(uint64_t *a1, uint64_t *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t, uint64_t, uint64_t), void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *a2;
  uint64_t v8 = a2[1];
  uint64_t v9 = a2[2];
  uint64_t v10 = a2[3];
  uint64_t v11 = *((unsigned __int8 *)a2 + 32);
  a4(*a2, v8, v9, v10, v11);
  uint64_t v12 = *a1;
  uint64_t v13 = a1[1];
  uint64_t v14 = a1[2];
  uint64_t v15 = a1[3];
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v9;
  a1[3] = v10;
  uint64_t v16 = *((unsigned __int8 *)a1 + 32);
  *((unsigned char *)a1 + 32) = v11;
  a5(v12, v13, v14, v15, v16);
  return a1;
}

uint64_t *assignWithTake for ParseError(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return assignWithTake for AST.Reference.Kind(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))outlined consume of ParseError);
}

uint64_t *assignWithTake for AST.Reference.Kind(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  char v6 = *(unsigned char *)(a2 + 32);
  uint64_t v7 = *a1;
  uint64_t v9 = a1[1];
  uint64_t v8 = a1[2];
  uint64_t v10 = a1[3];
  long long v11 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v11;
  uint64_t v12 = *((unsigned __int8 *)a1 + 32);
  *((unsigned char *)a1 + 32) = v6;
  a4(v7, v9, v8, v10, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for ParseError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xDC && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 220);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 0x24) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ParseError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xDB)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 220;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xDC) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xDC) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t getEnumTag for ParseError(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 32) <= 0x23u) {
    return *(unsigned __int8 *)(a1 + 32);
  }
  else {
    return (*(_DWORD *)a1 + 36);
  }
}

uint64_t destructiveInjectEnumTag for ParseError(uint64_t result, unsigned int a2)
{
  if (a2 >= 0x24)
  {
    *(void *)__n128 result = a2 - 36;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 36;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
  }
  *(unsigned char *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ParseError()
{
  return &type metadata for ParseError;
}

uint64_t getEnumTagSinglePayload for AST.AbsentFunction.Start(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AST.AbsentFunction.Start(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *__n128 result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x20D9D3988);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Delimiter.Kind()
{
  return &type metadata for Delimiter.Kind;
}

uint64_t getEnumTagSinglePayload for UnsafeSourceLocation(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)a1) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for UnsafeSourceLocation(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)__n128 result = a2 - 2;
    if (a3 >= 2) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)__n128 result = 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UnsafeSourceLocation()
{
  return &type metadata for UnsafeSourceLocation;
}

uint64_t destroy for Diagnostic(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  int v3 = *(unsigned __int8 *)(a1 + 72);
  if (v3 != 255)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    return outlined consume of ParseError(v4, v5, v6, v7, v3);
  }
  return result;
}

uint64_t initializeWithCopy for Diagnostic(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  int v5 = *(unsigned __int8 *)(a2 + 72);
  swift_bridgeObjectRetain();
  if (v5 == 255)
  {
    long long v10 = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 56) = v10;
    *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  }
  else
  {
    uint64_t v6 = *(void *)(a2 + 40);
    uint64_t v7 = *(void *)(a2 + 48);
    uint64_t v9 = *(void *)(a2 + 56);
    uint64_t v8 = *(void *)(a2 + 64);
    outlined copy of ParseError(v6, v7, v9, v8, v5);
    *(void *)(a1 + 40) = v6;
    *(void *)(a1 + 48) = v7;
    *(void *)(a1 + 56) = v9;
    *(void *)(a1 + 64) = v8;
    *(unsigned char *)(a1 + 72) = v5;
  }
  return a1;
}

uint64_t assignWithCopy for Diagnostic(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v4 = (long long *)(a1 + 40);
  int v5 = (long long *)(a2 + 40);
  int v6 = *(unsigned __int8 *)(a2 + 72);
  if (*(unsigned __int8 *)(a1 + 72) == 255)
  {
    if (v6 == 255)
    {
      long long v22 = *v5;
      long long v23 = *(_OWORD *)(a2 + 56);
      *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
      *uint64_t v4 = v22;
      *(_OWORD *)(a1 + 56) = v23;
    }
    else
    {
      uint64_t v16 = *(void *)(a2 + 40);
      uint64_t v17 = *(void *)(a2 + 48);
      uint64_t v19 = *(void *)(a2 + 56);
      uint64_t v18 = *(void *)(a2 + 64);
      outlined copy of ParseError(v16, v17, v19, v18, v6);
      *(void *)(a1 + 40) = v16;
      *(void *)(a1 + 48) = v17;
      *(void *)(a1 + 56) = v19;
      *(void *)(a1 + 64) = v18;
      *(unsigned char *)(a1 + 72) = v6;
    }
  }
  else if (v6 == 255)
  {
    outlined destroy of ParseError(a1 + 40);
    char v20 = *(unsigned char *)(a2 + 72);
    long long v21 = *(_OWORD *)(a2 + 56);
    *uint64_t v4 = *v5;
    *(_OWORD *)(a1 + 56) = v21;
    *(unsigned char *)(a1 + 72) = v20;
  }
  else
  {
    uint64_t v7 = *(void *)(a2 + 40);
    uint64_t v8 = *(void *)(a2 + 48);
    uint64_t v10 = *(void *)(a2 + 56);
    uint64_t v9 = *(void *)(a2 + 64);
    outlined copy of ParseError(v7, v8, v10, v9, v6);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 56);
    uint64_t v14 = *(void *)(a1 + 64);
    *(void *)(a1 + 40) = v7;
    *(void *)(a1 + 48) = v8;
    *(void *)(a1 + 56) = v10;
    *(void *)(a1 + 64) = v9;
    unsigned __int8 v15 = *(unsigned char *)(a1 + 72);
    *(unsigned char *)(a1 + 72) = v6;
    outlined consume of ParseError(v11, v12, v13, v14, v15);
  }
  return a1;
}

uint64_t assignWithTake for Diagnostic(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  int v5 = *(unsigned __int8 *)(a1 + 72);
  if (v5 == 255) {
    goto LABEL_5;
  }
  int v6 = *(unsigned __int8 *)(a2 + 72);
  if (v6 == 255)
  {
    outlined destroy of ParseError(a1 + 40);
LABEL_5:
    long long v11 = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 56) = v11;
    *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
    return a1;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 64);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(unsigned char *)(a1 + 72) = v6;
  outlined consume of ParseError(v7, v8, v9, v10, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for Diagnostic(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 73)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Diagnostic(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 72) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 73) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 73) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void *type metadata accessor for ErrorDiagnostic #1 in Diagnostics.throwAnyError()()
{
  return &unk_26C23BF10;
}

uint64_t *initializeBufferWithCopyOfBuffer for Range(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(_DWORD *)(v6 + 80);
  uint64_t v9 = ~v8;
  uint64_t v10 = v7 + v8;
  unint64_t v11 = ((v7 + v8) & ~v8) + v7;
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v11 > 0x18)
  {
    uint64_t v14 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v14 + ((v8 + 16) & v9));
    swift_retain();
  }
  else
  {
    unsigned __int8 v15 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16);
    v15(a1, a2, v5);
    v15((uint64_t *)(((unint64_t)v4 + v10) & v9), (uint64_t *)(((unint64_t)a2 + v10) & v9), v5);
  }
  return v4;
}

uint64_t destroy for Range(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(v3 - 8) + 8;
  uint64_t v7 = *(uint64_t (**)(unint64_t, uint64_t))v6;
  (*(void (**)(uint64_t, uint64_t))v6)(a1, v3);
  unint64_t v4 = (*(void *)(v6 + 56) + a1 + *(unsigned __int8 *)(v6 + 72)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 72);

  return v7(v4, v3);
}

unint64_t initializeWithCopy for Range(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16);
  uint64_t v8 = v6 + 16;
  v7(a1, a2, v5);
  v7((*(void *)(v8 + 48) + *(unsigned __int8 *)(v8 + 64) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 64), (*(void *)(v8 + 48) + *(unsigned __int8 *)(v8 + 64) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 64), v5);
  return a1;
}

unint64_t assignWithCopy for Range(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 24);
  uint64_t v8 = v6 + 24;
  v7(a1, a2, v5);
  v7((*(void *)(v8 + 40) + *(unsigned __int8 *)(v8 + 56) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 56), (*(void *)(v8 + 40) + *(unsigned __int8 *)(v8 + 56) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 56), v5);
  return a1;
}

unint64_t initializeWithTake for Range(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 32);
  uint64_t v8 = v6 + 32;
  v7(a1, a2, v5);
  v7((*(void *)(v8 + 32) + *(unsigned __int8 *)(v8 + 48) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 48), (*(void *)(v8 + 32) + *(unsigned __int8 *)(v8 + 48) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 48), v5);
  return a1;
}

unint64_t assignWithTake for Range(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 40);
  uint64_t v8 = v6 + 40;
  v7(a1, a2, v5);
  v7((*(void *)(v8 + 24) + *(unsigned __int8 *)(v8 + 40) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 40), (*(void *)(v8 + 24) + *(unsigned __int8 *)(v8 + 40) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 40), v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for Range(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (!a2) {
    return 0;
  }
  unsigned int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  uint64_t v8 = ((v6 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)) + v6;
  char v9 = 8 * v8;
  if (v8 <= 3)
  {
    unsigned int v11 = ((v7 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      int v10 = *(_DWORD *)((char *)a1 + v8);
      if (!v10) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v11 > 0xFF)
    {
      int v10 = *(unsigned __int16 *)((char *)a1 + v8);
      if (!*(unsigned __int16 *)((char *)a1 + v8)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v11 < 2)
    {
LABEL_19:
      if (v5) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      return 0;
    }
  }
  int v10 = *((unsigned __int8 *)a1 + v8);
  if (!*((unsigned char *)a1 + v8)) {
    goto LABEL_19;
  }
LABEL_11:
  int v12 = (v10 - 1) << v9;
  if (v8 > 3) {
    int v12 = 0;
  }
  if (v8)
  {
    if (v8 > 3) {
      LODWORD(v8) = 4;
    }
    switch((int)v8)
    {
      case 2:
        LODWORD(v8) = *a1;
        break;
      case 3:
        LODWORD(v8) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v8) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v8) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v8 | v12) + 1;
}

void storeEnumTagSinglePayload for Range(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = ((*(void *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
     + *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v14 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v14))
      {
        int v11 = 4;
      }
      else if (v14 >= 0x100)
      {
        int v11 = 2;
      }
      else
      {
        int v11 = v14 > 1;
      }
    }
    else
    {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      int v13 = (v12 >> (8 * v8)) + 1;
      if (v8)
      {
        int v15 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v15;
          a1[2] = BYTE2(v15);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v15;
        }
        else
        {
          *a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v12;
      int v13 = 1;
    }
    switch(v11)
    {
      case 1:
        a1[v8] = v13;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v13;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v13;
        return;
      default:
        return;
    }
  }
  switch(v11)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x20D9D456CLL);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        uint64_t v16 = *(void (**)(void))(v6 + 56);
        v16();
      }
      return;
  }
}

uint64_t associated type witness table accessor for CaseIterable.AllCases : Collection in Delimiter.Kind()
{
  return lazy protocol witness table accessor for type [String] and conformance [A](&lazy protocol witness table cache variable for type [Delimiter.Kind] and conformance [A]);
}

uint64_t lazy protocol witness table accessor for type [String] and conformance [A](unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    swift_getCanonicalSpecializedMetadata();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Delimiter.Kind and conformance Delimiter.Kind()
{
  unint64_t result = lazy protocol witness table cache variable for type Delimiter.Kind and conformance Delimiter.Kind;
  if (!lazy protocol witness table cache variable for type Delimiter.Kind and conformance Delimiter.Kind)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Delimiter.Kind and conformance Delimiter.Kind);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ParseError and conformance ParseError()
{
  unint64_t result = lazy protocol witness table cache variable for type ParseError and conformance ParseError;
  if (!lazy protocol witness table cache variable for type ParseError and conformance ParseError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ParseError and conformance ParseError);
  }
  return result;
}

uint64_t outlined init with take of ParseError(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(unsigned char *)(a2 + 32) = *((unsigned char *)a1 + 32);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *outlined init with take of AST.Node(void *a1, void *a2)
{
  *a2 = *a1;
  return a2;
}

uint64_t outlined retain of AST.Node(uint64_t a1)
{
  return a1;
}

_OWORD *outlined init with take of AST.AbsentFunction.Kind(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t *outlined release of AST.AbsentFunction(uint64_t *a1)
{
  return a1;
}

uint64_t *outlined retain of AST.AbsentFunction(uint64_t *a1)
{
  return a1;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1Tm(uint64_t *a1)
{
  unint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

void *__swift_project_boxed_opaque_existential_1Tm(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t partial apply for closure #1 in closure #1 in static TypeConstruction.tupleType<A>(of:labels:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = swift_getTupleTypeMetadata();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_20D9D4930()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_20D9D4970()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_20D9D4980()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t objectdestroy_55Tm()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 152, 7);
}

uint64_t sub_20D9D4A00()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t outlined retain of ParseError(uint64_t a1)
{
  return a1;
}

uint64_t sub_20D9D4A70()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t outlined consume of Source.Located<AST.Group.Kind>?(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  if (a11 != -1) {
    return outlined consume of AST.Group.Kind(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
  }
  return result;
}

uint64_t objectdestroy_40Tm()
{
  outlined consume of AST.AbsentFunction.Kind(v0[4], v0[5], v0[6], v0[7]);

  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t _s12_RegexParser3ASTV11ConditionalV9ConditionV4KindOWOi2_(uint64_t result)
{
  *(void *)(result + 104) = *(void *)(result + 104) & 0xFFFFFFFFFFFFFFF8 | 3;
  return result;
}

uint64_t outlined release of AST.Group(uint64_t a1)
{
  return a1;
}

uint64_t outlined release of AST.Conditional.Condition?(uint64_t a1)
{
  return a1;
}

uint64_t outlined consume of AST.Conditional.Condition?(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, char a14)
{
  if ((~a14 & 7) != 0) {
    return outlined consume of AST.Conditional.Condition.Kind(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
  }
  return result;
}

uint64_t objectdestroy_58Tm()
{
  outlined consume of AST.Conditional.Condition.Kind(*(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), *(void *)(v0 + 80), *(void *)(v0 + 88), *(void *)(v0 + 96), *(void *)(v0 + 104), *(_OWORD *)(v0 + 112), *(void *)(v0 + 120), *(void *)(v0 + 128), *(void *)(v0 + 136));
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 216, 7);
}

BOOL partial apply for closure #1 in mapOption #2 (_:_:) in Parser.applySyntaxOptions(of:isScoped:)(unsigned __int8 *a1)
{
  return *a1 == *(unsigned __int8 *)(v1 + 16);
}

uint64_t partial apply for specialized closure #1 in Sequence<>.contains(_:)(void *a1)
{
  uint64_t v2 = *(void **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1]) {
    return 1;
  }
  else {
    return _stringCompareWithSmolCheck(_:_:expecting:)() & 1;
  }
}

double _s12_RegexParser6SourceV7LocatedVy_AEy_AA3ASTV14QuantificationV6AmountOG_AEy_AI4KindOGSayAG6TriviaVGtGSgWOi0_(_OWORD *a1)
{
  double result = 0.0;
  *a1 = xmmword_20D9D74C0;
  a1[1] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[7] = 0u;
  return result;
}

uint64_t _s12_RegexParser6SourceV7LocatedVy_AEy_AA3ASTV14QuantificationV6AmountOG_AEy_AI4KindOGSayAG6TriviaVGtGSgWOg(uint64_t a1)
{
  if ((*(void *)(a1 + 8) >> 1) > 0x80000000) {
    return -(*(void *)(a1 + 8) >> 1);
  }
  else {
    return 0;
  }
}

void *outlined retain of AST.Conditional.Condition(void *a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))
{
  return a1;
}

uint64_t outlined consume of Source.Located<(Source.Located<AST.Quantification.Amount>, Source.Located<AST.Quantification.Kind>, [AST.Trivia])>?(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (a2 >> 1 != 0xFFFFFFFF || a6 >= 2) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s12_RegexParser3ASTV4AtomV7CalloutOSgWOg(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 152);
  if (v1 > 2) {
    return (v1 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

double _s12_RegexParser3ASTV4AtomV7CalloutOSgWOi0_(uint64_t a1)
{
  *(void *)(a1 + 144) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(unsigned char *)(a1 + 152) = -1;
  return result;
}

uint64_t _s12_RegexParser3ASTV4AtomV7CalloutOWOi1_(uint64_t result)
{
  *(unsigned char *)(result + 152) = 2;
  return result;
}

uint64_t _s12_RegexParser3ASTV4AtomV7CalloutOWOi0_(uint64_t result)
{
  *(unsigned char *)(result + 152) = 1;
  return result;
}

uint64_t _s12_RegexParser3ASTV4AtomV7CalloutOWOi_(uint64_t result)
{
  *(unsigned char *)(result + 152) = 0;
  return result;
}

unint64_t lazy protocol witness table accessor for type UInt32 and conformance UInt32()
{
  unint64_t result = lazy protocol witness table cache variable for type UInt32 and conformance UInt32;
  if (!lazy protocol witness table cache variable for type UInt32 and conformance UInt32)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt32 and conformance UInt32);
  }
  return result;
}

uint64_t outlined init with take of Source.Located<AST.Atom.Kind>?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t lazy protocol witness table accessor for type Substring and conformance Substring()
{
  unint64_t result = lazy protocol witness table cache variable for type Substring and conformance Substring;
  if (!lazy protocol witness table cache variable for type Substring and conformance Substring)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Substring and conformance Substring);
  }
  return result;
}

unsigned char *partial apply for closure #1 in closure #1 in Double.init<A>(_:)@<X0>(unsigned char *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3 = *result;
  BOOL v4 = v3 > 0x20;
  uint64_t v5 = (1 << v3) & 0x100003E01;
  BOOL v6 = v4 || v5 == 0;
  BOOL v7 = v6 && (result = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

uint64_t outlined consume of AST.MatchingOptionSequence?(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

double _s12_RegexParser3ASTV11ConditionalV9ConditionVSgWOi0_(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 7;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  return result;
}

uint64_t _s12_RegexParser3ASTV11ConditionalV9ConditionV4KindOSgWOg(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 104) & 7;
  unsigned int v2 = v1 ^ 7;
  unsigned int v3 = 8 - v1;
  if (v2 >= 3) {
    return 0;
  }
  else {
    return v3;
  }
}

uint64_t outlined init with take of AST.Conditional.Condition?(uint64_t a1, uint64_t a2)
{
  uint64_t CanonicalSpecializedMetadata = swift_getCanonicalSpecializedMetadata();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(CanonicalSpecializedMetadata - 8) + 32))(a2, a1, CanonicalSpecializedMetadata);
  return a2;
}

double _s12_RegexParser3ASTV11ConditionalV9ConditionV4KindOSgWOi0_(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 7;
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 120) = 0;
  return result;
}

double _s12_RegexParser3ASTV11ConditionalV9ConditionV4KindOWOi4_(uint64_t a1)
{
  *(void *)a1 = 1;
  double result = 0.0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 120) = 0;
  *(void *)(a1 + 104) = 4;
  return result;
}

double _s12_RegexParser3ASTV11ConditionalV9ConditionV4KindOWOi3_(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 4;
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 120) = 0;
  return result;
}

uint64_t _s12_RegexParser3ASTV11ConditionalV9ConditionV4KindOWOi0_(uint64_t result)
{
  *(void *)(result + 104) = *(void *)(result + 104) & 0xFFFFFFFFFFFFFFF8 | 1;
  return result;
}

uint64_t _s12_RegexParser3ASTV11ConditionalV9ConditionV4KindOWOi1_(uint64_t result)
{
  *(void *)(result + 104) = *(void *)(result + 104) & 0xFFFFFFFFFFFFFFF8 | 2;
  return result;
}

uint64_t outlined consume of ParseError?(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 != 0xFF) {
    return outlined consume of ParseError(a1, a2, a3, a4, a5);
  }
  return a1;
}

uint64_t sub_20D9D5130()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t outlined copy of CaptureStructure(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4 == 2 || a4 == 1) {
    return swift_retain();
  }
  if (!a4) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_20D9D5168()
{
  outlined consume of CaptureStructure(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(unsigned char *)(v0 + 40));

  return MEMORY[0x270FA0238](v0, 41, 7);
}

uint64_t sub_20D9D51A8()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

unint64_t lazy protocol witness table accessor for type DelimiterLexError and conformance DelimiterLexError()
{
  unint64_t result = lazy protocol witness table cache variable for type DelimiterLexError and conformance DelimiterLexError;
  if (!lazy protocol witness table cache variable for type DelimiterLexError and conformance DelimiterLexError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DelimiterLexError and conformance DelimiterLexError);
  }
  return result;
}

uint64_t outlined release of (AST.Group.Kind, AST.Group.Kind)(uint64_t a1)
{
  uint64_t v13 = *(void *)(a1 + 88);
  uint64_t v2 = *(void *)(a1 + 104);
  uint64_t v12 = *(void *)(a1 + 96);
  uint64_t v3 = *(void *)(a1 + 112);
  uint64_t v4 = *(void *)(a1 + 120);
  uint64_t v5 = *(void *)(a1 + 128);
  uint64_t v6 = *(void *)(a1 + 136);
  uint64_t v7 = *(void *)(a1 + 144);
  uint64_t v8 = *(void *)(a1 + 152);
  uint64_t v9 = *(void *)(a1 + 160);
  char v10 = *(unsigned char *)(a1 + 168);
  outlined consume of AST.Group.Kind(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(unsigned char *)(a1 + 80));
  outlined consume of AST.Group.Kind(v13, v12, v2, v3, v4, v5, v6, v7, v8, v9, v10);
  return a1;
}

uint64_t outlined release of (AST.Conditional.Condition.Kind, AST.Conditional.Condition.Kind)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 136);
  uint64_t v13 = *(void *)(a1 + 128);
  uint64_t v3 = *(void *)(a1 + 144);
  uint64_t v4 = *(void *)(a1 + 152);
  uint64_t v5 = *(void *)(a1 + 160);
  uint64_t v6 = *(void *)(a1 + 168);
  uint64_t v7 = *(void *)(a1 + 176);
  uint64_t v8 = *(void *)(a1 + 184);
  long long v11 = *(_OWORD *)(a1 + 208);
  long long v12 = *(_OWORD *)(a1 + 192);
  long long v10 = *(_OWORD *)(a1 + 224);
  outlined consume of AST.Conditional.Condition.Kind(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(_OWORD *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104));
  outlined consume of AST.Conditional.Condition.Kind(v13, v2, v3, v4, v5, v6, v7, v8, v12, *((uint64_t *)&v12 + 1), v11, *((uint64_t *)&v11 + 1), v10, SBYTE8(v10));
  return a1;
}

uint64_t outlined release of (AST.Atom.Callout.OnigurumaTag?, AST.Atom.Callout.OnigurumaTag?)(uint64_t a1)
{
  return a1;
}

uint64_t outlined retain of Source.Located<AST.Atom.Callout.PCRE.Argument>(uint64_t a1)
{
  return a1;
}

uint64_t outlined release of AST.Atom.Callout(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 152);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    v4);
  return a1;
}

uint64_t outlined release of (AST.Atom.Callout, AST.Atom.Callout)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 168);
  uint64_t v17 = *(void *)(a1 + 160);
  uint64_t v3 = *(void *)(a1 + 176);
  uint64_t v4 = *(void *)(a1 + 184);
  uint64_t v5 = *(void *)(a1 + 192);
  uint64_t v6 = *(void *)(a1 + 200);
  uint64_t v7 = *(void *)(a1 + 208);
  uint64_t v8 = *(void *)(a1 + 216);
  long long v15 = *(_OWORD *)(a1 + 240);
  long long v16 = *(_OWORD *)(a1 + 224);
  long long v13 = *(_OWORD *)(a1 + 272);
  long long v14 = *(_OWORD *)(a1 + 256);
  long long v12 = *(_OWORD *)(a1 + 288);
  uint64_t v9 = *(void *)(a1 + 304);
  char v10 = *(unsigned char *)(a1 + 312);
  outlined consume of AST.Atom.Callout(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(unsigned char *)(a1 + 152));
  outlined consume of AST.Atom.Callout(v17, v2, v3, v4, v5, v6, v7, v8, v16, *((uint64_t *)&v16 + 1), v15, *((uint64_t *)&v15 + 1), v14, *((uint64_t *)&v14 + 1), v13, *((uint64_t *)&v13 + 1), v12, *((uint64_t *)&v12 + 1), v9,
    v10);
  return a1;
}

uint64_t outlined destroy of _ASTParent?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t __swift_instantiateCanonicalPrespecializedGenericMetadata()
{
  return swift_getCanonicalPrespecializedGenericMetadata();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t destroy for CaptureStructure(uint64_t a1)
{
  return outlined consume of CaptureStructure(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
}

uint64_t initializeWithCopy for CaptureStructure(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  outlined copy of CaptureStructure(*(void *)a2, v4, v5, v6);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for CaptureStructure(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  outlined copy of CaptureStructure(*(void *)a2, v4, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  char v10 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v6;
  outlined consume of CaptureStructure(v7, v8, v9, v10);
  return a1;
}

uint64_t assignWithTake for CaptureStructure(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  char v8 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v4;
  outlined consume of CaptureStructure(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for CaptureStructure(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CaptureStructure(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)unint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

uint64_t getEnumTag for CaptureStructure(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t destructiveInjectEnumTag for CaptureStructure(uint64_t result, char a2)
{
  *(unsigned char *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for CaptureStructure()
{
  return &type metadata for CaptureStructure;
}

void *initializeBufferWithCopyOfBuffer for FatalParseError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for FatalParseError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for FatalParseError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FatalParseError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FatalParseError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FatalParseError()
{
  return &type metadata for FatalParseError;
}

ValueMetadata *type metadata accessor for IdentifierKind()
{
  return &type metadata for IdentifierKind;
}

uint64_t getEnumTagSinglePayload for AST.Atom.CharacterProperty.Kind.MapKind(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AST.Atom.CharacterProperty.Kind.MapKind(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x20D9D5B20);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RadixKind()
{
  return &type metadata for RadixKind;
}

uint64_t *initializeBufferWithCopyOfBuffer for Optional(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if (*(_DWORD *)(v6 + 84)) {
    size_t v7 = *(void *)(v6 + 64);
  }
  else {
    size_t v7 = *(void *)(v6 + 64) + 1;
  }
  uint64_t v8 = *(_DWORD *)(v6 + 80);
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v7 > 0x18)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v8 + 16) & ~v8));
    swift_retain();
  }
  else if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

uint64_t destroy for Optional(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v3);
  if (!result)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
    return v5(a1, v3);
  }
  return result;
}

void *initializeWithCopy for Optional(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84)) {
      size_t v7 = *(void *)(v6 + 64);
    }
    else {
      size_t v7 = *(void *)(v6 + 64) + 1;
    }
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *assignWithCopy for Optional(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  size_t v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1, v5);
  int v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
      return a1;
    }
    long long v13 = *(void (**)(void *, uint64_t))(v6 + 8);
    uint64_t v12 = v6 + 8;
    v13(a1, v5);
    int v10 = *(_DWORD *)(v12 + 76);
    size_t v11 = *(void *)(v12 + 56);
  }
  if (v10) {
    size_t v14 = v11;
  }
  else {
    size_t v14 = v11 + 1;
  }
  memcpy(a1, a2, v14);
  return a1;
}

void *initializeWithTake for Optional(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84)) {
      size_t v7 = *(void *)(v6 + 64);
    }
    else {
      size_t v7 = *(void *)(v6 + 64) + 1;
    }
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *assignWithTake for Optional(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  size_t v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1, v5);
  int v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
      return a1;
    }
    long long v13 = *(void (**)(void *, uint64_t))(v6 + 8);
    uint64_t v12 = v6 + 8;
    v13(a1, v5);
    int v10 = *(_DWORD *)(v12 + 76);
    size_t v11 = *(void *)(v12 + 56);
  }
  if (v10) {
    size_t v14 = v11;
  }
  else {
    size_t v14 = v11 + 1;
  }
  memcpy(a1, a2, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for Optional(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  unsigned int v6 = v5 - 1;
  if (!v5) {
    unsigned int v6 = 0;
  }
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (!v5) {
    ++v7;
  }
  if (!a2) {
    return 0;
  }
  int v8 = a2 - v6;
  if (a2 > v6)
  {
    char v9 = 8 * v7;
    if (v7 > 3) {
      goto LABEL_8;
    }
    unsigned int v11 = ((v8 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      int v10 = *(_DWORD *)((char *)a1 + v7);
      if (v10) {
        goto LABEL_15;
      }
    }
    else
    {
      if (v11 <= 0xFF)
      {
        if (v11 < 2) {
          goto LABEL_25;
        }
LABEL_8:
        int v10 = *((unsigned __int8 *)a1 + v7);
        if (!*((unsigned char *)a1 + v7)) {
          goto LABEL_25;
        }
LABEL_15:
        int v12 = (v10 - 1) << v9;
        if (v7 > 3) {
          int v12 = 0;
        }
        if (v7)
        {
          if (v7 <= 3) {
            int v13 = v7;
          }
          else {
            int v13 = 4;
          }
          switch(v13)
          {
            case 2:
              int v14 = *a1;
              break;
            case 3:
              int v14 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
              break;
            case 4:
              int v14 = *(_DWORD *)a1;
              break;
            default:
              int v14 = *(unsigned __int8 *)a1;
              break;
          }
        }
        else
        {
          int v14 = 0;
        }
        return v6 + (v14 | v12) + 1;
      }
      int v10 = *(unsigned __int16 *)((char *)a1 + v7);
      if (*(unsigned __int16 *)((char *)a1 + v7)) {
        goto LABEL_15;
      }
    }
  }
LABEL_25:
  if (v5 < 2) {
    return 0;
  }
  unsigned int v16 = (*(uint64_t (**)(void))(v4 + 48))();
  if (v16 >= 2) {
    return v16 - 1;
  }
  else {
    return 0;
  }
}

void storeEnumTagSinglePayload for Optional(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  unsigned int v9 = v8 - 1;
  if (v8)
  {
    size_t v10 = *(void *)(v7 + 64);
  }
  else
  {
    unsigned int v9 = 0;
    size_t v10 = *(void *)(v7 + 64) + 1;
  }
  BOOL v11 = a3 >= v9;
  unsigned int v12 = a3 - v9;
  if (v12 == 0 || !v11)
  {
LABEL_13:
    if (v9 < a2) {
      goto LABEL_14;
    }
    goto LABEL_21;
  }
  if (v10 > 3)
  {
    int v6 = 1;
    if (v9 < a2) {
      goto LABEL_14;
    }
    goto LABEL_21;
  }
  unsigned int v13 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
  if (!HIWORD(v13))
  {
    if (v13 >= 0x100) {
      int v6 = 2;
    }
    else {
      int v6 = v13 > 1;
    }
    goto LABEL_13;
  }
  int v6 = 4;
  if (v9 < a2)
  {
LABEL_14:
    unsigned int v14 = ~v9 + a2;
    if (v10 < 4)
    {
      int v15 = (v14 >> (8 * v10)) + 1;
      if (v10)
      {
        int v16 = v14 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v16;
          a1[2] = BYTE2(v16);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v16;
        }
        else
        {
          *a1 = v16;
        }
      }
    }
    else
    {
      bzero(a1, v10);
      *(_DWORD *)a1 = v14;
      int v15 = 1;
    }
    switch(v6)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_39;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
LABEL_21:
  switch(v6)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 3:
LABEL_39:
      __break(1u);
      JUMPOUT(0x20D9D65FCLL);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_25;
    default:
LABEL_25:
      if (a2)
      {
LABEL_26:
        if (v8 >= 2)
        {
          uint64_t v17 = *(void (**)(void))(v7 + 56);
          v17();
        }
      }
      return;
  }
}

uint64_t getEnumTag for Optional(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 48))(a1, 1);
}

uint64_t destructiveInjectEnumTag for Optional(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 56))(a1, a2, 1);
}

unint64_t lazy protocol witness table accessor for type RadixKind and conformance RadixKind()
{
  unint64_t result = lazy protocol witness table cache variable for type RadixKind and conformance RadixKind;
  if (!lazy protocol witness table cache variable for type RadixKind and conformance RadixKind)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type RadixKind and conformance RadixKind);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type IdentifierKind and conformance IdentifierKind()
{
  unint64_t result = lazy protocol witness table cache variable for type IdentifierKind and conformance IdentifierKind;
  if (!lazy protocol witness table cache variable for type IdentifierKind and conformance IdentifierKind)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type IdentifierKind and conformance IdentifierKind);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type FatalParseError and conformance FatalParseError()
{
  unint64_t result = lazy protocol witness table cache variable for type FatalParseError and conformance FatalParseError;
  if (!lazy protocol witness table cache variable for type FatalParseError and conformance FatalParseError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FatalParseError and conformance FatalParseError);
  }
  return result;
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x270F9D320]();
}

uint64_t Character.asciiValue.getter()
{
  return MEMORY[0x270F9D358]();
}

uint64_t Character.isWhitespace.getter()
{
  return MEMORY[0x270F9D380]();
}

uint64_t Character.hexDigitValue.getter()
{
  return MEMORY[0x270F9D398]();
}

uint64_t Character.hash(into:)()
{
  return MEMORY[0x270F9D3C0]();
}

uint64_t Character.write<A>(to:)()
{
  return MEMORY[0x270F9D3C8]();
}

uint64_t Character.isLetter.getter()
{
  return MEMORY[0x270F9D3D8]();
}

uint64_t Character.isNumber.getter()
{
  return MEMORY[0x270F9D3E0]();
}

uint64_t dispatch thunk of BidirectionalCollection.index(_:offsetBy:)()
{
  return MEMORY[0x270F9D408]();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return MEMORY[0x270F9D478]();
}

uint64_t dispatch thunk of static Comparable.<= infix(_:_:)()
{
  return MEMORY[0x270F9D498]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x270F9D598]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x270F9D5E0]();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = MEMORY[0x270F9D5F8]();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x270F9D620]();
}

uint64_t String._nfcCodeUnits.getter()
{
  return MEMORY[0x270F9D638]();
}

uint64_t static String._fromCodeUnits<A, B>(_:encoding:repair:)()
{
  return MEMORY[0x270F9D640]();
}

uint64_t static String._fromSubstring(_:)()
{
  return MEMORY[0x270F9D648]();
}

uint64_t String.replaceSubrange<A>(_:with:)()
{
  return MEMORY[0x270F9D660]();
}

uint64_t String.UnicodeScalarView._foreignIndex(after:)()
{
  return MEMORY[0x270F9D678]();
}

uint64_t String.UnicodeScalarView._foreignIndex(before:)()
{
  return MEMORY[0x270F9D680]();
}

uint64_t static String._fromUTF8Repairing(_:)()
{
  return MEMORY[0x270F9D6B0]();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

uint64_t String.Index.init(_:within:)()
{
  return MEMORY[0x270F9D738]();
}

uint64_t String.count.getter()
{
  return MEMORY[0x270F9D740]();
}

uint64_t String.index(after:)()
{
  return MEMORY[0x270F9D748]();
}

uint64_t String.index(_:offsetBy:limitedBy:)()
{
  return MEMORY[0x270F9D758]();
}

uint64_t String.index(_:offsetBy:)()
{
  return MEMORY[0x270F9D760]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

{
  MEMORY[0x270F9D798](a1._countAndFlagsBits, a1._object);
}

Swift::String_optional __swiftcall String.Iterator.next()()
{
  uint64_t v0 = MEMORY[0x270F9D7D8]();
  result.value._object = v1;
  result.value._countAndFlagsBits = v0;
  return result;
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:limitedBy:)()
{
  return MEMORY[0x270F9D7F8]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return MEMORY[0x270F9D800]();
}

uint64_t String.UTF8View._foreignDistance(from:to:)()
{
  return MEMORY[0x270F9D808]();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return MEMORY[0x270F9D810]();
}

uint64_t String.distance(from:to:)()
{
  return MEMORY[0x270F9D820]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x270F9D860]();
}

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return MEMORY[0x270F9D878](a1._countAndFlagsBits, a1._object);
}

Swift::String __swiftcall String.init(repeating:count:)(Swift::String repeating, Swift::Int count)
{
  uint64_t v2 = MEMORY[0x270F9D898](repeating._countAndFlagsBits, repeating._object, count);
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

uint64_t String.init<A>(_:radix:uppercase:)()
{
  return MEMORY[0x270F9D8A8]();
}

uint64_t String.init<A>(_:)()
{
  return MEMORY[0x270F9D8D8]();
}

{
  return MEMORY[0x270F9D8E0]();
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t dispatch thunk of Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x270F9D920]();
}

uint64_t Sequence.enumerated()()
{
  return MEMORY[0x270F9D940]();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x270F9D968]();
}

uint64_t Sequence.lazy.getter()
{
  return MEMORY[0x270F9D980]();
}

uint64_t Sequence<>.max()()
{
  return MEMORY[0x270F9D9F0]();
}

uint64_t Sequence<>.elementsEqual<A>(_:)()
{
  return MEMORY[0x270F9DA08]();
}

uint64_t dispatch thunk of RangeExpression.relative<A>(to:)()
{
  return MEMORY[0x270F9DA60]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t Array.init<A>(_:)()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return MEMORY[0x270F9E080]();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t dispatch thunk of Collection.index(_:offsetBy:)()
{
  return MEMORY[0x270F9E0B8]();
}

uint64_t dispatch thunk of Collection.distance(from:to:)()
{
  return MEMORY[0x270F9E0D0]();
}

uint64_t dispatch thunk of Collection.endIndex.getter()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t Collection.subscript.getter()
{
  return MEMORY[0x270F9E1A8]();
}

uint64_t dispatch thunk of Collection.subscript.getter()
{
  return MEMORY[0x270F9E1D8]();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t type metadata accessor for Range()
{
  return MEMORY[0x270F9E330]();
}

Swift::Void __swiftcall UnsafeMutablePointer.deallocate()()
{
}

uint64_t UnsafeMutablePointer.move()()
{
  return MEMORY[0x270F9E388]();
}

uint64_t static UnsafeMutablePointer.allocate(capacity:)()
{
  return MEMORY[0x270F9E398]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t Substring.index(after:)()
{
  return MEMORY[0x270F9E4A0]();
}

uint64_t Substring.index(_:offsetBy:limitedBy:)()
{
  return MEMORY[0x270F9E4B0]();
}

uint64_t Substring.UTF8View.index(_:offsetBy:limitedBy:)()
{
  return MEMORY[0x270F9E4C8]();
}

uint64_t Substring.UTF8View.subscript.getter()
{
  return MEMORY[0x270F9E4E0]();
}

uint64_t Substring.distance(from:to:)()
{
  return MEMORY[0x270F9E4E8]();
}

uint64_t Substring.subscript.getter()
{
  return MEMORY[0x270F9E4F8]();
}

{
  return MEMORY[0x270F9E508]();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return MEMORY[0x270F9E518]();
}

uint64_t dispatch thunk of AnyKeyPath._storedInlineOffset.getter()
{
  return MEMORY[0x270F9E698]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x270F9E958]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x270F9E960]();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return MEMORY[0x270F9E988]();
}

uint64_t _StringGuts.foreignErrorCorrectedScalar(startingAt:)()
{
  return MEMORY[0x270F9E9A0]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t type metadata accessor for LazySequence()
{
  return MEMORY[0x270F9E9E0]();
}

uint64_t StaticString.description.getter()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t _decodeScalar(_:startingAt:)()
{
  return MEMORY[0x270F9EB30]();
}

Swift::Void __swiftcall ContiguousArray.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t ContiguousArray.append(_:)()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t ContiguousArray.init()()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t type metadata accessor for ContiguousArray()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t type metadata accessor for LazyMapSequence()
{
  return MEMORY[0x270F9ED00]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t type metadata accessor for PartialRangeFrom()
{
  return MEMORY[0x270F9EDA8]();
}

uint64_t type metadata accessor for PartialRangeUpTo()
{
  return MEMORY[0x270F9EDB0]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t EnumeratedSequence.makeIterator()()
{
  return MEMORY[0x270F9F038]();
}

uint64_t EnumeratedSequence.Iterator.next()()
{
  return MEMORY[0x270F9F040]();
}

uint64_t type metadata accessor for EnumeratedSequence.Iterator()
{
  return MEMORY[0x270F9F048]();
}

uint64_t type metadata accessor for EnumeratedSequence()
{
  return MEMORY[0x270F9F050]();
}

uint64_t dispatch thunk of _HasContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x270F9F0D8]();
}

uint64_t dispatch thunk of _HasContiguousBytes._providesContiguousBytesNoCopy.getter()
{
  return MEMORY[0x270F9F0E0]();
}

uint64_t LazySequenceProtocol.map<A>(_:)()
{
  return MEMORY[0x270F9F148]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x270F9F230](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x270F9F770]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t _findStringSwitchCaseWithCache(cases:string:cache:)()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t static Unicode.NumericType.== infix(_:_:)()
{
  return MEMORY[0x270F9FDD8]();
}

uint64_t type metadata accessor for Unicode.NumericType()
{
  return MEMORY[0x270F9FDE0]();
}

uint64_t static Unicode.CanonicalCombiningClass.== infix(_:_:)()
{
  return MEMORY[0x270F9FE20]();
}

uint64_t Unicode.CanonicalCombiningClass.init(rawValue:)()
{
  return MEMORY[0x270F9FE28]();
}

uint64_t type metadata accessor for Unicode.CanonicalCombiningClass()
{
  return MEMORY[0x270F9FE30]();
}

uint64_t Unicode.Scalar.Properties.isPatternWhitespace.getter()
{
  return MEMORY[0x270F9FED8]();
}

uint64_t type metadata accessor for Unicode.Scalar.Properties()
{
  return MEMORY[0x270F9FF30]();
}

uint64_t Unicode.Scalar.properties.getter()
{
  return MEMORY[0x270F9FF38]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x270FA0170]();
}

void bzero(void *a1, size_t a2)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getCanonicalPrespecializedGenericMetadata()
{
  return MEMORY[0x270FA0320]();
}

uint64_t swift_getCanonicalSpecializedMetadata()
{
  return MEMORY[0x270FA0328]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}