uint64_t initializeWithCopy for HandshakeState.EncryptedExtensionsState(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  int *v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  void (*v62)(char *, char *, uint64_t);
  uint64_t v63;
  int *v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  void (*v69)(char *, char *, uint64_t);
  uint64_t v70;
  int *v71;
  uint64_t v72;
  char *v73;
  char *v74;
  uint64_t v75;
  void (*v76)(char *, char *, uint64_t);
  uint64_t v77;
  void (*v78)(char *, char *, uint64_t);
  int *v79;

  v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  v7 = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  }
  else
  {
    v8 = *(void *)(a2 + 24);
    outlined copy of Data._Representation(v8, v7);
    *(void *)(a1 + 24) = v8;
    *(void *)(a1 + 32) = v7;
  }
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  v9 = *(void *)(a2 + 56);
  if (v9 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  }
  else
  {
    v10 = *(void *)(a2 + 48);
    outlined copy of Data._Representation(v10, *(void *)(a2 + 56));
    *(void *)(a1 + 48) = v10;
    *(void *)(a1 + 56) = v9;
  }
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  v11 = a3[5];
  v12 = a1 + v11;
  v13 = a2 + v11;
  type metadata accessor for HandshakeState.EncryptedExtensionsState.SessionData(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = type metadata accessor for Date();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
    v15 = (int *)type metadata accessor for SessionTicket();
    *(_DWORD *)(v12 + v15[5]) = *(_DWORD *)(v13 + v15[5]);
    *(_DWORD *)(v12 + v15[6]) = *(_DWORD *)(v13 + v15[6]);
    v16 = v15[7];
    v17 = (uint64_t *)(v12 + v16);
    v18 = v13 + v16;
    v19 = *(void *)(v13 + v16);
    v20 = *(void *)(v13 + v16 + 8);
    outlined copy of Data._Representation(v19, v20);
    *v17 = v19;
    v17[1] = v20;
    v17[2] = *(void *)(v18 + 16);
    v21 = v15[8];
    v22 = (uint64_t *)(v12 + v21);
    v23 = v13 + v21;
    v24 = *(void *)(v13 + v21);
    v25 = *(void *)(v13 + v21 + 8);
    outlined copy of Data._Representation(v24, v25);
    *v22 = v24;
    v22[1] = v25;
    v22[2] = *(void *)(v23 + 16);
    v26 = v15[9];
    v27 = v12 + v26;
    v28 = v13 + v26;
    v29 = type metadata accessor for SymmetricKey();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 16))(v27, v28, v29);
    *(_DWORD *)(v12 + v15[10]) = *(_DWORD *)(v13 + v15[10]);
    *(_WORD *)(v12 + v15[11]) = *(_WORD *)(v13 + v15[11]);
    *(_WORD *)(v12 + v15[12]) = *(_WORD *)(v13 + v15[12]);
    v30 = v15[13];
    v31 = v12 + v30;
    v32 = (uint64_t *)(v13 + v30);
    v33 = *(void *)(v13 + v30 + 8);
    if (v33 >> 60 == 15)
    {
      *(_OWORD *)v31 = *(_OWORD *)v32;
    }
    else
    {
      v35 = *v32;
      outlined copy of Data._Representation(*v32, v33);
      *(void *)v31 = v35;
      *(void *)(v31 + 8) = v33;
    }
    *(void *)(v31 + 16) = v32[2];
    v36 = v15[14];
    v37 = (void *)(v12 + v36);
    v38 = (const void *)(v13 + v36);
    v39 = type metadata accessor for P256.Signing.PublicKey();
    v40 = *(void *)(v39 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v40 + 48))(v38, 1, v39))
    {
      v41 = type metadata accessor for PeerCertificateBundle.Bundle(0);
      memcpy(v37, v38, *(void *)(*(void *)(v41 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v40 + 16))(v37, v38, v39);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
    }
  }
  else
  {
    *(_DWORD *)v12 = *(_DWORD *)v13;
    *(unsigned char *)(v12 + 4) = *(unsigned char *)(v13 + 4);
    v34 = *(void *)(v13 + 16);
    *(void *)(v12 + 8) = *(void *)(v13 + 8);
    *(void *)(v12 + 16) = v34;
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  v42 = a3[6];
  v43 = a1 + v42;
  v44 = (uint64_t *)(a2 + v42);
  v45 = *(void *)(a2 + v42 + 8);
  if (v45 >> 60 == 15)
  {
    *(_OWORD *)v43 = *(_OWORD *)v44;
  }
  else
  {
    v46 = *v44;
    outlined copy of Data._Representation(*v44, v45);
    *(void *)v43 = v46;
    *(void *)(v43 + 8) = v45;
  }
  *(void *)(v43 + 16) = v44[2];
  v47 = a3[7];
  v48 = a1 + v47;
  v49 = (uint64_t *)(a2 + v47);
  v50 = *(void *)(a2 + v47 + 8);
  if (v50 >> 60 == 15)
  {
    *(_OWORD *)v48 = *(_OWORD *)v49;
  }
  else
  {
    v51 = *v49;
    outlined copy of Data._Representation(*v49, v50);
    *(void *)v48 = v51;
    *(void *)(v48 + 8) = v50;
  }
  *(void *)(v48 + 16) = v49[2];
  v52 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  v53 = (char *)(a1 + v52);
  v54 = (char *)(a2 + v52);
  v55 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      v56 = type metadata accessor for SHA384();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v56 - 8) + 16))(v53, v54, v56);
      v57 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.EarlySecret);
      v58 = v57[9];
      v59 = &v53[v58];
      v60 = &v54[v58];
      v61 = type metadata accessor for SymmetricKey();
      v62 = *(void (**)(char *, char *, uint64_t))(*(void *)(v61 - 8) + 16);
      v62(v59, v60, v61);
      v62(&v53[v57[10]], &v54[v57[10]], v61);
      v62(&v53[v57[11]], &v54[v57[11]], v61);
      v62(&v53[v57[12]], &v54[v57[12]], v61);
      goto LABEL_27;
    case 1u:
      v63 = type metadata accessor for SHA384();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v63 - 8) + 16))(v53, v54, v63);
      v64 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.HandshakeSecret);
      v65 = v64[9];
      v66 = &v53[v65];
      v67 = &v54[v65];
      v68 = type metadata accessor for SymmetricKey();
      v69 = *(void (**)(char *, char *, uint64_t))(*(void *)(v68 - 8) + 16);
      v69(v66, v67, v68);
      v69(&v53[v64[10]], &v54[v64[10]], v68);
      v69(&v53[v64[11]], &v54[v64[11]], v68);
      goto LABEL_27;
    case 2u:
      v70 = type metadata accessor for SHA384();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v70 - 8) + 16))(v53, v54, v70);
      v71 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.MasterSecret);
      v72 = v71[9];
      v73 = &v53[v72];
      v74 = &v54[v72];
      v75 = type metadata accessor for SymmetricKey();
      v76 = *(void (**)(char *, char *, uint64_t))(*(void *)(v75 - 8) + 16);
      v76(v73, v74, v75);
      v76(&v53[v71[10]], &v54[v71[10]], v75);
      v76(&v53[v71[11]], &v54[v71[11]], v75);
      v76(&v53[v71[12]], &v54[v71[12]], v75);
      v76(&v53[v71[13]], &v54[v71[13]], v75);
      v76(&v53[v71[14]], &v54[v71[14]], v75);
      goto LABEL_27;
    case 3u:
      v77 = type metadata accessor for SymmetricKey();
      v78 = *(void (**)(char *, char *, uint64_t))(*(void *)(v77 - 8) + 16);
      v78(v53, v54, v77);
      v79 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.AllSecrets);
      v78(&v53[v79[9]], &v54[v79[9]], v77);
      v78(&v53[v79[10]], &v54[v79[10]], v77);
      v78(&v53[v79[11]], &v54[v79[11]], v77);
LABEL_27:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(v53, v54, *(void *)(*(void *)(v55 - 8) + 64));
      break;
  }
  return a1;
}

uint64_t assignWithCopy for HandshakeState.EncryptedExtensionsState(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = (long long *)(a1 + 24);
  v7 = (long long *)(a2 + 24);
  unint64_t v8 = *(void *)(a2 + 32);
  if (*(void *)(a1 + 32) >> 60 == 15)
  {
    if (v8 >> 60 == 15)
    {
      long long v9 = *v7;
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      long long *v6 = v9;
      goto LABEL_9;
    }
    uint64_t v11 = *(void *)(a2 + 24);
    outlined copy of Data._Representation(v11, *(void *)(a2 + 32));
    *(void *)(a1 + 24) = v11;
    *(void *)(a1 + 32) = v8;
  }
  else
  {
    if (v8 >> 60 == 15)
    {
      outlined destroy of ByteBuffer(a1 + 24);
      uint64_t v10 = *(void *)(a2 + 40);
      long long *v6 = *v7;
      *(void *)(a1 + 40) = v10;
      goto LABEL_9;
    }
    uint64_t v12 = *(void *)(a2 + 24);
    outlined copy of Data._Representation(v12, *(void *)(a2 + 32));
    uint64_t v13 = *(void *)(a1 + 24);
    unint64_t v14 = *(void *)(a1 + 32);
    *(void *)(a1 + 24) = v12;
    *(void *)(a1 + 32) = v8;
    outlined consume of Data._Representation(v13, v14);
  }
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
LABEL_9:
  v15 = (long long *)(a1 + 48);
  v16 = (long long *)(a2 + 48);
  unint64_t v17 = *(void *)(a2 + 56);
  if (*(void *)(a1 + 56) >> 60 == 15)
  {
    if (v17 >> 60 == 15)
    {
      long long v18 = *v16;
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      long long *v15 = v18;
      goto LABEL_17;
    }
    uint64_t v20 = *(void *)(a2 + 48);
    outlined copy of Data._Representation(v20, *(void *)(a2 + 56));
    *(void *)(a1 + 48) = v20;
    *(void *)(a1 + 56) = v17;
  }
  else
  {
    if (v17 >> 60 == 15)
    {
      outlined destroy of ByteBuffer(a1 + 48);
      uint64_t v19 = *(void *)(a2 + 64);
      long long *v15 = *v16;
      *(void *)(a1 + 64) = v19;
      goto LABEL_17;
    }
    uint64_t v21 = *(void *)(a2 + 48);
    outlined copy of Data._Representation(v21, *(void *)(a2 + 56));
    uint64_t v22 = *(void *)(a1 + 48);
    unint64_t v23 = *(void *)(a1 + 56);
    *(void *)(a1 + 48) = v21;
    *(void *)(a1 + 56) = v17;
    outlined consume of Data._Representation(v22, v23);
  }
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
LABEL_17:
  __int16 v24 = *(_WORD *)(a2 + 72);
  *(unsigned char *)(a1 + 74) = *(unsigned char *)(a2 + 74);
  *(_WORD *)(a1 + 72) = v24;
  *(unsigned char *)(a1 + 75) = *(unsigned char *)(a2 + 75);
  if (a1 != a2)
  {
    uint64_t v25 = a3[5];
    uint64_t v26 = a1 + v25;
    uint64_t v27 = a2 + v25;
    _s8SwiftTLS14HandshakeStateOWOhTm_1(a1 + v25, type metadata accessor for HandshakeState.EncryptedExtensionsState.SessionData);
    type metadata accessor for HandshakeState.EncryptedExtensionsState.SessionData(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v28 = type metadata accessor for Date();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
      v29 = (int *)type metadata accessor for SessionTicket();
      *(_DWORD *)(v26 + v29[5]) = *(_DWORD *)(v27 + v29[5]);
      *(_DWORD *)(v26 + v29[6]) = *(_DWORD *)(v27 + v29[6]);
      uint64_t v30 = v29[7];
      v31 = (uint64_t *)(v26 + v30);
      uint64_t v32 = v27 + v30;
      uint64_t v33 = *(void *)(v27 + v30);
      unint64_t v34 = *(void *)(v27 + v30 + 8);
      outlined copy of Data._Representation(v33, v34);
      uint64_t *v31 = v33;
      v31[1] = v34;
      v31[2] = *(void *)(v32 + 16);
      uint64_t v35 = v29[8];
      v36 = (uint64_t *)(v26 + v35);
      uint64_t v37 = v27 + v35;
      uint64_t v38 = *(void *)(v27 + v35);
      unint64_t v39 = *(void *)(v27 + v35 + 8);
      outlined copy of Data._Representation(v38, v39);
      uint64_t *v36 = v38;
      v36[1] = v39;
      v36[2] = *(void *)(v37 + 16);
      uint64_t v40 = v29[9];
      uint64_t v41 = v26 + v40;
      uint64_t v42 = v27 + v40;
      uint64_t v43 = type metadata accessor for SymmetricKey();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 16))(v41, v42, v43);
      *(_DWORD *)(v26 + v29[10]) = *(_DWORD *)(v27 + v29[10]);
      *(_WORD *)(v26 + v29[11]) = *(_WORD *)(v27 + v29[11]);
      *(_WORD *)(v26 + v29[12]) = *(_WORD *)(v27 + v29[12]);
      uint64_t v44 = v29[13];
      uint64_t v45 = v26 + v44;
      v46 = (uint64_t *)(v27 + v44);
      unint64_t v47 = *(void *)(v27 + v44 + 8);
      if (v47 >> 60 == 15)
      {
        long long v48 = *(_OWORD *)v46;
        *(void *)(v45 + 16) = v46[2];
        *(_OWORD *)uint64_t v45 = v48;
      }
      else
      {
        uint64_t v49 = *v46;
        outlined copy of Data._Representation(*v46, v47);
        *(void *)uint64_t v45 = v49;
        *(void *)(v45 + 8) = v47;
        *(void *)(v45 + 16) = v46[2];
      }
      uint64_t v50 = v29[14];
      v51 = (void *)(v26 + v50);
      v52 = (const void *)(v27 + v50);
      uint64_t v53 = type metadata accessor for P256.Signing.PublicKey();
      uint64_t v54 = *(void *)(v53 - 8);
      if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v54 + 48))(v52, 1, v53))
      {
        uint64_t v55 = type metadata accessor for PeerCertificateBundle.Bundle(0);
        memcpy(v51, v52, *(void *)(*(void *)(v55 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v54 + 16))(v51, v52, v53);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v54 + 56))(v51, 0, 1, v53);
      }
    }
    else
    {
      *(_WORD *)uint64_t v26 = *(_WORD *)v27;
      *(_WORD *)(v26 + 2) = *(_WORD *)(v27 + 2);
      *(unsigned char *)(v26 + 4) = *(unsigned char *)(v27 + 4);
      *(void *)(v26 + 8) = *(void *)(v27 + 8);
      *(void *)(v26 + 16) = *(void *)(v27 + 16);
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v56 = a3[6];
  uint64_t v57 = a1 + v56;
  v58 = (uint64_t *)(a2 + v56);
  unint64_t v59 = *(void *)(a2 + v56 + 8);
  if (*(void *)(a1 + v56 + 8) >> 60 == 15)
  {
    if (v59 >> 60 == 15)
    {
      long long v60 = *(_OWORD *)v58;
      *(void *)(v57 + 16) = v58[2];
      *(_OWORD *)uint64_t v57 = v60;
      goto LABEL_36;
    }
    uint64_t v62 = *v58;
    outlined copy of Data._Representation(*v58, v59);
    *(void *)uint64_t v57 = v62;
    *(void *)(v57 + 8) = v59;
    goto LABEL_34;
  }
  if (v59 >> 60 != 15)
  {
    uint64_t v63 = *v58;
    outlined copy of Data._Representation(*v58, v59);
    uint64_t v64 = *(void *)v57;
    unint64_t v65 = *(void *)(v57 + 8);
    *(void *)uint64_t v57 = v63;
    *(void *)(v57 + 8) = v59;
    outlined consume of Data._Representation(v64, v65);
LABEL_34:
    uint64_t v61 = v58[2];
    goto LABEL_35;
  }
  outlined destroy of ByteBuffer(v57);
  uint64_t v61 = v58[2];
  *(_OWORD *)uint64_t v57 = *(_OWORD *)v58;
LABEL_35:
  *(void *)(v57 + 16) = v61;
LABEL_36:
  uint64_t v66 = a3[7];
  uint64_t v67 = a1 + v66;
  v68 = (uint64_t *)(a2 + v66);
  unint64_t v69 = *(void *)(a2 + v66 + 8);
  if (*(void *)(a1 + v66 + 8) >> 60 == 15)
  {
    if (v69 >> 60 == 15)
    {
      long long v70 = *(_OWORD *)v68;
      *(void *)(v67 + 16) = v68[2];
      *(_OWORD *)uint64_t v67 = v70;
      goto LABEL_45;
    }
    uint64_t v72 = *v68;
    outlined copy of Data._Representation(*v68, v69);
    *(void *)uint64_t v67 = v72;
    *(void *)(v67 + 8) = v69;
    goto LABEL_43;
  }
  if (v69 >> 60 != 15)
  {
    uint64_t v73 = *v68;
    outlined copy of Data._Representation(*v68, v69);
    uint64_t v74 = *(void *)v67;
    unint64_t v75 = *(void *)(v67 + 8);
    *(void *)uint64_t v67 = v73;
    *(void *)(v67 + 8) = v69;
    outlined consume of Data._Representation(v74, v75);
LABEL_43:
    uint64_t v71 = v68[2];
    goto LABEL_44;
  }
  outlined destroy of ByteBuffer(v67);
  uint64_t v71 = v68[2];
  *(_OWORD *)uint64_t v67 = *(_OWORD *)v68;
LABEL_44:
  *(void *)(v67 + 16) = v71;
LABEL_45:
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  if (a1 != a2)
  {
    uint64_t v76 = a3[9];
    v77 = (char *)(a1 + v76);
    v78 = (char *)(a2 + v76);
    outlined destroy of HandshakeStateMachine?(a1 + v76, &demangling cache variable for type metadata for SessionKeyManager<SHA384>.State);
    uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v80 = type metadata accessor for SHA384();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v80 - 8) + 16))(v77, v78, v80);
        v81 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.EarlySecret);
        uint64_t v82 = v81[9];
        v83 = &v77[v82];
        v84 = &v78[v82];
        uint64_t v85 = type metadata accessor for SymmetricKey();
        v86 = *(void (**)(char *, char *, uint64_t))(*(void *)(v85 - 8) + 16);
        v86(v83, v84, v85);
        v86(&v77[v81[10]], &v78[v81[10]], v85);
        v86(&v77[v81[11]], &v78[v81[11]], v85);
        v86(&v77[v81[12]], &v78[v81[12]], v85);
        goto LABEL_52;
      case 1u:
        uint64_t v87 = type metadata accessor for SHA384();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v87 - 8) + 16))(v77, v78, v87);
        v88 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.HandshakeSecret);
        uint64_t v89 = v88[9];
        v90 = &v77[v89];
        v91 = &v78[v89];
        uint64_t v92 = type metadata accessor for SymmetricKey();
        v93 = *(void (**)(char *, char *, uint64_t))(*(void *)(v92 - 8) + 16);
        v93(v90, v91, v92);
        v93(&v77[v88[10]], &v78[v88[10]], v92);
        v93(&v77[v88[11]], &v78[v88[11]], v92);
        goto LABEL_52;
      case 2u:
        uint64_t v94 = type metadata accessor for SHA384();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v94 - 8) + 16))(v77, v78, v94);
        v95 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.MasterSecret);
        uint64_t v96 = v95[9];
        v97 = &v77[v96];
        v98 = &v78[v96];
        uint64_t v99 = type metadata accessor for SymmetricKey();
        v100 = *(void (**)(char *, char *, uint64_t))(*(void *)(v99 - 8) + 16);
        v100(v97, v98, v99);
        v100(&v77[v95[10]], &v78[v95[10]], v99);
        v100(&v77[v95[11]], &v78[v95[11]], v99);
        v100(&v77[v95[12]], &v78[v95[12]], v99);
        v100(&v77[v95[13]], &v78[v95[13]], v99);
        v100(&v77[v95[14]], &v78[v95[14]], v99);
        goto LABEL_52;
      case 3u:
        uint64_t v101 = type metadata accessor for SymmetricKey();
        v102 = *(void (**)(char *, char *, uint64_t))(*(void *)(v101 - 8) + 16);
        v102(v77, v78, v101);
        v103 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.AllSecrets);
        v102(&v77[v103[9]], &v78[v103[9]], v101);
        v102(&v77[v103[10]], &v78[v103[10]], v101);
        v102(&v77[v103[11]], &v78[v103[11]], v101);
LABEL_52:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v77, v78, *(void *)(*(void *)(v79 - 8) + 64));
        break;
    }
  }
  return a1;
}

_OWORD *initializeWithTake for HandshakeState.EncryptedExtensionsState(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  *(_OWORD *)((char *)a1 + 60) = *(_OWORD *)((char *)a2 + 60);
  long long v7 = a2[1];
  *a1 = *a2;
  a1[1] = v7;
  uint64_t v8 = a3[5];
  long long v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for HandshakeState.EncryptedExtensionsState.SessionData(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = type metadata accessor for Date();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
    uint64_t v13 = (int *)type metadata accessor for SessionTicket();
    *(_DWORD *)&v9[v13[5]] = *(_DWORD *)&v10[v13[5]];
    *(_DWORD *)&v9[v13[6]] = *(_DWORD *)&v10[v13[6]];
    uint64_t v14 = v13[7];
    v15 = &v9[v14];
    v16 = &v10[v14];
    *(_OWORD *)v15 = *(_OWORD *)v16;
    *((void *)v15 + 2) = *((void *)v16 + 2);
    uint64_t v17 = v13[8];
    long long v18 = &v9[v17];
    uint64_t v19 = &v10[v17];
    *(_OWORD *)long long v18 = *(_OWORD *)v19;
    *((void *)v18 + 2) = *((void *)v19 + 2);
    uint64_t v20 = v13[9];
    uint64_t v21 = &v9[v20];
    uint64_t v22 = &v10[v20];
    uint64_t v23 = type metadata accessor for SymmetricKey();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v21, v22, v23);
    *(_DWORD *)&v9[v13[10]] = *(_DWORD *)&v10[v13[10]];
    *(_WORD *)&v9[v13[11]] = *(_WORD *)&v10[v13[11]];
    *(_WORD *)&v9[v13[12]] = *(_WORD *)&v10[v13[12]];
    uint64_t v24 = v13[13];
    uint64_t v25 = &v9[v24];
    uint64_t v26 = &v10[v24];
    *((void *)v25 + 2) = *((void *)v26 + 2);
    *(_OWORD *)uint64_t v25 = *(_OWORD *)v26;
    uint64_t v27 = v13[14];
    uint64_t v28 = &v9[v27];
    v29 = &v10[v27];
    uint64_t v30 = type metadata accessor for P256.Signing.PublicKey();
    uint64_t v31 = *(void *)(v30 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30))
    {
      uint64_t v32 = type metadata accessor for PeerCertificateBundle.Bundle(0);
      memcpy(v28, v29, *(void *)(*(void *)(v32 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v28, v29, v30);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  uint64_t v33 = a3[6];
  uint64_t v34 = a3[7];
  uint64_t v35 = (char *)a1 + v33;
  v36 = (char *)a2 + v33;
  long long v37 = *(_OWORD *)v36;
  *((void *)v35 + 2) = *((void *)v36 + 2);
  *(_OWORD *)uint64_t v35 = v37;
  uint64_t v38 = (char *)a1 + v34;
  unint64_t v39 = (char *)a2 + v34;
  *(_OWORD *)uint64_t v38 = *(_OWORD *)v39;
  *((void *)v38 + 2) = *((void *)v39 + 2);
  uint64_t v40 = a3[9];
  *((unsigned char *)a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
  uint64_t v41 = (char *)a1 + v40;
  uint64_t v42 = (char *)a2 + v40;
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v44 = type metadata accessor for SHA384();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v44 - 8) + 32))(v41, v42, v44);
      uint64_t v45 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.EarlySecret);
      uint64_t v46 = v45[9];
      unint64_t v47 = &v41[v46];
      long long v48 = &v42[v46];
      uint64_t v49 = type metadata accessor for SymmetricKey();
      uint64_t v50 = *(void (**)(char *, char *, uint64_t))(*(void *)(v49 - 8) + 32);
      v50(v47, v48, v49);
      v50(&v41[v45[10]], &v42[v45[10]], v49);
      v50(&v41[v45[11]], &v42[v45[11]], v49);
      v50(&v41[v45[12]], &v42[v45[12]], v49);
      goto LABEL_13;
    case 1u:
      uint64_t v51 = type metadata accessor for SHA384();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v51 - 8) + 32))(v41, v42, v51);
      v52 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.HandshakeSecret);
      uint64_t v53 = v52[9];
      uint64_t v54 = &v41[v53];
      uint64_t v55 = &v42[v53];
      uint64_t v56 = type metadata accessor for SymmetricKey();
      uint64_t v57 = *(void (**)(char *, char *, uint64_t))(*(void *)(v56 - 8) + 32);
      v57(v54, v55, v56);
      v57(&v41[v52[10]], &v42[v52[10]], v56);
      v57(&v41[v52[11]], &v42[v52[11]], v56);
      goto LABEL_13;
    case 2u:
      uint64_t v58 = type metadata accessor for SHA384();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v58 - 8) + 32))(v41, v42, v58);
      unint64_t v59 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.MasterSecret);
      uint64_t v60 = v59[9];
      uint64_t v61 = &v41[v60];
      uint64_t v62 = &v42[v60];
      uint64_t v63 = type metadata accessor for SymmetricKey();
      uint64_t v64 = *(void (**)(char *, char *, uint64_t))(*(void *)(v63 - 8) + 32);
      v64(v61, v62, v63);
      v64(&v41[v59[10]], &v42[v59[10]], v63);
      v64(&v41[v59[11]], &v42[v59[11]], v63);
      v64(&v41[v59[12]], &v42[v59[12]], v63);
      v64(&v41[v59[13]], &v42[v59[13]], v63);
      v64(&v41[v59[14]], &v42[v59[14]], v63);
      goto LABEL_13;
    case 3u:
      uint64_t v65 = type metadata accessor for SymmetricKey();
      uint64_t v66 = *(void (**)(char *, char *, uint64_t))(*(void *)(v65 - 8) + 32);
      v66(v41, v42, v65);
      uint64_t v67 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.AllSecrets);
      v66(&v41[v67[9]], &v42[v67[9]], v65);
      v66(&v41[v67[10]], &v42[v67[10]], v65);
      v66(&v41[v67[11]], &v42[v67[11]], v65);
LABEL_13:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(v41, v42, *(void *)(*(void *)(v43 - 8) + 64));
      break;
  }
  return a1;
}

uint64_t assignWithTake for HandshakeState.EncryptedExtensionsState(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  unint64_t v7 = *(void *)(a1 + 32);
  if (v7 >> 60 == 15) {
    goto LABEL_4;
  }
  unint64_t v8 = *(void *)(a2 + 32);
  if (v8 >> 60 == 15)
  {
    outlined destroy of ByteBuffer(a1 + 24);
LABEL_4:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    goto LABEL_6;
  }
  uint64_t v9 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v8;
  outlined consume of Data._Representation(v9, v7);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
LABEL_6:
  unint64_t v10 = *(void *)(a1 + 56);
  if (v10 >> 60 == 15)
  {
LABEL_9:
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    goto LABEL_11;
  }
  unint64_t v11 = *(void *)(a2 + 56);
  if (v11 >> 60 == 15)
  {
    outlined destroy of ByteBuffer(a1 + 48);
    goto LABEL_9;
  }
  uint64_t v12 = *(void *)(a1 + 48);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v11;
  outlined consume of Data._Representation(v12, v10);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
LABEL_11:
  *(_WORD *)(a1 + 72) = *(_WORD *)(a2 + 72);
  *(unsigned char *)(a1 + 74) = *(unsigned char *)(a2 + 74);
  *(unsigned char *)(a1 + 75) = *(unsigned char *)(a2 + 75);
  if (a1 != a2)
  {
    uint64_t v13 = a3[5];
    uint64_t v14 = (char *)(a1 + v13);
    v15 = (char *)(a2 + v13);
    _s8SwiftTLS14HandshakeStateOWOhTm_1(a1 + v13, type metadata accessor for HandshakeState.EncryptedExtensionsState.SessionData);
    uint64_t v16 = type metadata accessor for HandshakeState.EncryptedExtensionsState.SessionData(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v17 = type metadata accessor for Date();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v14, v15, v17);
      long long v18 = (int *)type metadata accessor for SessionTicket();
      *(_DWORD *)&v14[v18[5]] = *(_DWORD *)&v15[v18[5]];
      *(_DWORD *)&v14[v18[6]] = *(_DWORD *)&v15[v18[6]];
      uint64_t v19 = v18[7];
      uint64_t v20 = &v14[v19];
      uint64_t v21 = &v15[v19];
      *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
      *((void *)v20 + 2) = *((void *)v21 + 2);
      uint64_t v22 = v18[8];
      uint64_t v23 = &v14[v22];
      uint64_t v24 = &v15[v22];
      *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
      *((void *)v23 + 2) = *((void *)v24 + 2);
      uint64_t v25 = v18[9];
      uint64_t v26 = &v14[v25];
      uint64_t v27 = &v15[v25];
      uint64_t v28 = type metadata accessor for SymmetricKey();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 32))(v26, v27, v28);
      *(_DWORD *)&v14[v18[10]] = *(_DWORD *)&v15[v18[10]];
      *(_WORD *)&v14[v18[11]] = *(_WORD *)&v15[v18[11]];
      *(_WORD *)&v14[v18[12]] = *(_WORD *)&v15[v18[12]];
      uint64_t v29 = v18[13];
      uint64_t v30 = &v14[v29];
      uint64_t v31 = &v15[v29];
      *((void *)v30 + 2) = *((void *)v31 + 2);
      *(_OWORD *)uint64_t v30 = *(_OWORD *)v31;
      uint64_t v32 = v18[14];
      uint64_t v33 = &v14[v32];
      uint64_t v34 = &v15[v32];
      uint64_t v35 = type metadata accessor for P256.Signing.PublicKey();
      uint64_t v36 = *(void *)(v35 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v34, 1, v35))
      {
        uint64_t v37 = type metadata accessor for PeerCertificateBundle.Bundle(0);
        memcpy(v33, v34, *(void *)(*(void *)(v37 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v33, v34, v35);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
    }
  }
  uint64_t v38 = a3[6];
  uint64_t v39 = a1 + v38;
  uint64_t v40 = a2 + v38;
  unint64_t v41 = *(void *)(a1 + v38 + 8);
  if (v41 >> 60 == 15) {
    goto LABEL_21;
  }
  unint64_t v42 = *(void *)(v40 + 8);
  if (v42 >> 60 == 15)
  {
    outlined destroy of ByteBuffer(v39);
LABEL_21:
    *(_OWORD *)uint64_t v39 = *(_OWORD *)v40;
    goto LABEL_23;
  }
  uint64_t v43 = *(void *)v39;
  *(void *)uint64_t v39 = *(void *)v40;
  *(void *)(v39 + 8) = v42;
  outlined consume of Data._Representation(v43, v41);
LABEL_23:
  *(void *)(v39 + 16) = *(void *)(v40 + 16);
  uint64_t v44 = a3[7];
  uint64_t v45 = a1 + v44;
  uint64_t v46 = a2 + v44;
  unint64_t v47 = *(void *)(a1 + v44 + 8);
  if (v47 >> 60 == 15)
  {
LABEL_26:
    *(_OWORD *)uint64_t v45 = *(_OWORD *)v46;
    goto LABEL_28;
  }
  unint64_t v48 = *(void *)(v46 + 8);
  if (v48 >> 60 == 15)
  {
    outlined destroy of ByteBuffer(v45);
    goto LABEL_26;
  }
  uint64_t v49 = *(void *)v45;
  *(void *)uint64_t v45 = *(void *)v46;
  *(void *)(v45 + 8) = v48;
  outlined consume of Data._Representation(v49, v47);
LABEL_28:
  *(void *)(v45 + 16) = *(void *)(v46 + 16);
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  if (a1 != a2)
  {
    uint64_t v50 = a3[9];
    uint64_t v51 = (char *)(a1 + v50);
    v52 = (char *)(a2 + v50);
    outlined destroy of HandshakeStateMachine?(a1 + v50, &demangling cache variable for type metadata for SessionKeyManager<SHA384>.State);
    uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v54 = type metadata accessor for SHA384();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v54 - 8) + 32))(v51, v52, v54);
        uint64_t v55 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.EarlySecret);
        uint64_t v56 = v55[9];
        uint64_t v57 = &v51[v56];
        uint64_t v58 = &v52[v56];
        uint64_t v59 = type metadata accessor for SymmetricKey();
        uint64_t v60 = *(void (**)(char *, char *, uint64_t))(*(void *)(v59 - 8) + 32);
        v60(v57, v58, v59);
        v60(&v51[v55[10]], &v52[v55[10]], v59);
        v60(&v51[v55[11]], &v52[v55[11]], v59);
        v60(&v51[v55[12]], &v52[v55[12]], v59);
        goto LABEL_35;
      case 1u:
        uint64_t v61 = type metadata accessor for SHA384();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v61 - 8) + 32))(v51, v52, v61);
        uint64_t v62 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.HandshakeSecret);
        uint64_t v63 = v62[9];
        uint64_t v64 = &v51[v63];
        uint64_t v65 = &v52[v63];
        uint64_t v66 = type metadata accessor for SymmetricKey();
        uint64_t v67 = *(void (**)(char *, char *, uint64_t))(*(void *)(v66 - 8) + 32);
        v67(v64, v65, v66);
        v67(&v51[v62[10]], &v52[v62[10]], v66);
        v67(&v51[v62[11]], &v52[v62[11]], v66);
        goto LABEL_35;
      case 2u:
        uint64_t v68 = type metadata accessor for SHA384();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v68 - 8) + 32))(v51, v52, v68);
        unint64_t v69 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.MasterSecret);
        uint64_t v70 = v69[9];
        uint64_t v71 = &v51[v70];
        uint64_t v72 = &v52[v70];
        uint64_t v73 = type metadata accessor for SymmetricKey();
        uint64_t v74 = *(void (**)(char *, char *, uint64_t))(*(void *)(v73 - 8) + 32);
        v74(v71, v72, v73);
        v74(&v51[v69[10]], &v52[v69[10]], v73);
        v74(&v51[v69[11]], &v52[v69[11]], v73);
        v74(&v51[v69[12]], &v52[v69[12]], v73);
        v74(&v51[v69[13]], &v52[v69[13]], v73);
        v74(&v51[v69[14]], &v52[v69[14]], v73);
        goto LABEL_35;
      case 3u:
        uint64_t v75 = type metadata accessor for SymmetricKey();
        uint64_t v76 = *(void (**)(char *, char *, uint64_t))(*(void *)(v75 - 8) + 32);
        v76(v51, v52, v75);
        v77 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.AllSecrets);
        v76(&v51[v77[9]], &v52[v77[9]], v75);
        v76(&v51[v77[10]], &v52[v77[10]], v75);
        v76(&v51[v77[11]], &v52[v77[11]], v75);
LABEL_35:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v51, v52, *(void *)(*(void *)(v53 - 8) + 64));
        break;
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for HandshakeState.EncryptedExtensionsState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B575AAB0);
}

uint64_t sub_1B575AAB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for HandshakeState.EncryptedExtensionsState.SessionData(0);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 20);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 36);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for HandshakeState.EncryptedExtensionsState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B575ABF4);
}

uint64_t sub_1B575ABF4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for HandshakeState.EncryptedExtensionsState.SessionData(0);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 20);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 36);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void type metadata completion function for HandshakeState.EncryptedExtensionsState()
{
  type metadata accessor for HandshakeState.EncryptedExtensionsState.SessionData(319);
  if (v0 <= 0x3F)
  {
    type metadata accessor for SessionKeyManager<SHA384>.State();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for HandshakeState.EncryptedExtensionsState.SessionData(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v26 = *a2;
    *(void *)a1 = *a2;
    a1 = v26 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = type metadata accessor for Date();
      (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      unint64_t v7 = (int *)type metadata accessor for SessionTicket();
      *(_DWORD *)(a1 + v7[5]) = *(_DWORD *)((char *)a2 + v7[5]);
      *(_DWORD *)(a1 + v7[6]) = *(_DWORD *)((char *)a2 + v7[6]);
      uint64_t v8 = v7[7];
      uint64_t v9 = (uint64_t *)(a1 + v8);
      uint64_t v10 = (uint64_t)a2 + v8;
      uint64_t v11 = *(uint64_t *)((char *)a2 + v8);
      unint64_t v12 = *(uint64_t *)((char *)a2 + v8 + 8);
      outlined copy of Data._Representation(v11, v12);
      *uint64_t v9 = v11;
      v9[1] = v12;
      v9[2] = *(void *)(v10 + 16);
      uint64_t v13 = v7[8];
      uint64_t v14 = (uint64_t *)(a1 + v13);
      uint64_t v15 = (uint64_t)a2 + v13;
      uint64_t v16 = *(uint64_t *)((char *)a2 + v13);
      unint64_t v17 = *(uint64_t *)((char *)a2 + v13 + 8);
      outlined copy of Data._Representation(v16, v17);
      *uint64_t v14 = v16;
      v14[1] = v17;
      v14[2] = *(void *)(v15 + 16);
      uint64_t v18 = v7[9];
      uint64_t v19 = a1 + v18;
      uint64_t v20 = (uint64_t)a2 + v18;
      uint64_t v21 = type metadata accessor for SymmetricKey();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
      *(_DWORD *)(a1 + v7[10]) = *(_DWORD *)((char *)a2 + v7[10]);
      *(_WORD *)(a1 + v7[11]) = *(_WORD *)((char *)a2 + v7[11]);
      *(_WORD *)(a1 + v7[12]) = *(_WORD *)((char *)a2 + v7[12]);
      uint64_t v22 = v7[13];
      uint64_t v23 = a1 + v22;
      uint64_t v24 = (uint64_t *)((char *)a2 + v22);
      unint64_t v25 = *(uint64_t *)((char *)a2 + v22 + 8);
      if (v25 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
      }
      else
      {
        uint64_t v28 = *v24;
        outlined copy of Data._Representation(*v24, v25);
        *(void *)uint64_t v23 = v28;
        *(void *)(v23 + 8) = v25;
      }
      *(void *)(v23 + 16) = v24[2];
      uint64_t v29 = v7[14];
      uint64_t v30 = (void *)(a1 + v29);
      uint64_t v31 = (char *)a2 + v29;
      uint64_t v32 = type metadata accessor for P256.Signing.PublicKey();
      uint64_t v33 = *(void *)(v32 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32))
      {
        uint64_t v34 = type metadata accessor for PeerCertificateBundle.Bundle(0);
        memcpy(v30, v31, *(void *)(*(void *)(v34 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, char *, uint64_t))(v33 + 16))(v30, v31, v32);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
      }
    }
    else
    {
      *(_DWORD *)a1 = *(_DWORD *)a2;
      *(unsigned char *)(a1 + 4) = *((unsigned char *)a2 + 4);
      uint64_t v27 = a2[2];
      *(void *)(a1 + 8) = a2[1];
      *(void *)(a1 + 16) = v27;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for HandshakeState.EncryptedExtensionsState.SessionData(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = type metadata accessor for Date();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
    v3 = (int *)type metadata accessor for SessionTicket();
    outlined consume of Data._Representation(*(void *)(a1 + v3[7]), *(void *)(a1 + v3[7] + 8));
    outlined consume of Data._Representation(*(void *)(a1 + v3[8]), *(void *)(a1 + v3[8] + 8));
    uint64_t v4 = a1 + v3[9];
    uint64_t v5 = type metadata accessor for SymmetricKey();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
    uint64_t v6 = (uint64_t *)(a1 + v3[13]);
    unint64_t v7 = v6[1];
    if (v7 >> 60 != 15) {
      outlined consume of Data._Representation(*v6, v7);
    }
    uint64_t v8 = a1 + v3[14];
    uint64_t v9 = type metadata accessor for P256.Signing.PublicKey();
    uint64_t v12 = *(void *)(v9 - 8);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v8, 1, v9);
    if (!result)
    {
      uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(v12 + 8);
      return v11(v8, v9);
    }
  }
  else
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for HandshakeState.EncryptedExtensionsState.SessionData(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = type metadata accessor for Date();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    uint64_t v5 = (int *)type metadata accessor for SessionTicket();
    *(_DWORD *)(a1 + v5[5]) = *(_DWORD *)(a2 + v5[5]);
    *(_DWORD *)(a1 + v5[6]) = *(_DWORD *)(a2 + v5[6]);
    uint64_t v6 = v5[7];
    unint64_t v7 = (uint64_t *)(a1 + v6);
    uint64_t v8 = a2 + v6;
    uint64_t v9 = *(void *)(a2 + v6);
    unint64_t v10 = *(void *)(a2 + v6 + 8);
    outlined copy of Data._Representation(v9, v10);
    uint64_t *v7 = v9;
    v7[1] = v10;
    v7[2] = *(void *)(v8 + 16);
    uint64_t v11 = v5[8];
    uint64_t v12 = (uint64_t *)(a1 + v11);
    uint64_t v13 = a2 + v11;
    uint64_t v14 = *(void *)(a2 + v11);
    unint64_t v15 = *(void *)(a2 + v11 + 8);
    outlined copy of Data._Representation(v14, v15);
    *uint64_t v12 = v14;
    v12[1] = v15;
    v12[2] = *(void *)(v13 + 16);
    uint64_t v16 = v5[9];
    uint64_t v17 = a1 + v16;
    uint64_t v18 = a2 + v16;
    uint64_t v19 = type metadata accessor for SymmetricKey();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
    *(_DWORD *)(a1 + v5[10]) = *(_DWORD *)(a2 + v5[10]);
    *(_WORD *)(a1 + v5[11]) = *(_WORD *)(a2 + v5[11]);
    *(_WORD *)(a1 + v5[12]) = *(_WORD *)(a2 + v5[12]);
    uint64_t v20 = v5[13];
    uint64_t v21 = a1 + v20;
    uint64_t v22 = (uint64_t *)(a2 + v20);
    unint64_t v23 = *(void *)(a2 + v20 + 8);
    if (v23 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
    }
    else
    {
      uint64_t v25 = *v22;
      outlined copy of Data._Representation(*v22, v23);
      *(void *)uint64_t v21 = v25;
      *(void *)(v21 + 8) = v23;
    }
    *(void *)(v21 + 16) = v22[2];
    uint64_t v26 = v5[14];
    uint64_t v27 = (void *)(a1 + v26);
    uint64_t v28 = (const void *)(a2 + v26);
    uint64_t v29 = type metadata accessor for P256.Signing.PublicKey();
    uint64_t v30 = *(void *)(v29 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
    {
      uint64_t v31 = type metadata accessor for PeerCertificateBundle.Bundle(0);
      memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v30 + 16))(v27, v28, v29);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
    }
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
    uint64_t v24 = *(void *)(a2 + 16);
    *(void *)(a1 + 8) = *(void *)(a2 + 8);
    *(void *)(a1 + 16) = v24;
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for HandshakeState.EncryptedExtensionsState.SessionData(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    _s8SwiftTLS14HandshakeStateOWOhTm_1(a1, type metadata accessor for HandshakeState.EncryptedExtensionsState.SessionData);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = type metadata accessor for Date();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
      uint64_t v5 = (int *)type metadata accessor for SessionTicket();
      *(_DWORD *)(a1 + v5[5]) = *(_DWORD *)(a2 + v5[5]);
      *(_DWORD *)(a1 + v5[6]) = *(_DWORD *)(a2 + v5[6]);
      uint64_t v6 = v5[7];
      unint64_t v7 = (uint64_t *)(a1 + v6);
      uint64_t v8 = a2 + v6;
      uint64_t v9 = *(void *)(a2 + v6);
      unint64_t v10 = *(void *)(a2 + v6 + 8);
      outlined copy of Data._Representation(v9, v10);
      uint64_t *v7 = v9;
      v7[1] = v10;
      v7[2] = *(void *)(v8 + 16);
      uint64_t v11 = v5[8];
      uint64_t v12 = (uint64_t *)(a1 + v11);
      uint64_t v13 = a2 + v11;
      uint64_t v14 = *(void *)(a2 + v11);
      unint64_t v15 = *(void *)(a2 + v11 + 8);
      outlined copy of Data._Representation(v14, v15);
      *uint64_t v12 = v14;
      v12[1] = v15;
      v12[2] = *(void *)(v13 + 16);
      uint64_t v16 = v5[9];
      uint64_t v17 = a1 + v16;
      uint64_t v18 = a2 + v16;
      uint64_t v19 = type metadata accessor for SymmetricKey();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
      *(_DWORD *)(a1 + v5[10]) = *(_DWORD *)(a2 + v5[10]);
      *(_WORD *)(a1 + v5[11]) = *(_WORD *)(a2 + v5[11]);
      *(_WORD *)(a1 + v5[12]) = *(_WORD *)(a2 + v5[12]);
      uint64_t v20 = v5[13];
      uint64_t v21 = a1 + v20;
      uint64_t v22 = (uint64_t *)(a2 + v20);
      unint64_t v23 = *(void *)(a2 + v20 + 8);
      if (v23 >> 60 == 15)
      {
        long long v24 = *(_OWORD *)v22;
        *(void *)(v21 + 16) = v22[2];
        *(_OWORD *)uint64_t v21 = v24;
      }
      else
      {
        uint64_t v25 = *v22;
        outlined copy of Data._Representation(*v22, v23);
        *(void *)uint64_t v21 = v25;
        *(void *)(v21 + 8) = v23;
        *(void *)(v21 + 16) = v22[2];
      }
      uint64_t v26 = v5[14];
      uint64_t v27 = (void *)(a1 + v26);
      uint64_t v28 = (const void *)(a2 + v26);
      uint64_t v29 = type metadata accessor for P256.Signing.PublicKey();
      uint64_t v30 = *(void *)(v29 - 8);
      if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
      {
        uint64_t v31 = type metadata accessor for PeerCertificateBundle.Bundle(0);
        memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v30 + 16))(v27, v28, v29);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
      }
    }
    else
    {
      *(_WORD *)a1 = *(_WORD *)a2;
      *(_WORD *)(a1 + 2) = *(_WORD *)(a2 + 2);
      *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
      *(void *)(a1 + 8) = *(void *)(a2 + 8);
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *initializeWithTake for HandshakeState.ServerHelloState.SessionData(char *a1, char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for Date();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    unint64_t v7 = (int *)type metadata accessor for SessionTicket();
    *(_DWORD *)&a1[v7[5]] = *(_DWORD *)&a2[v7[5]];
    *(_DWORD *)&a1[v7[6]] = *(_DWORD *)&a2[v7[6]];
    uint64_t v8 = v7[7];
    uint64_t v9 = &a1[v8];
    unint64_t v10 = &a2[v8];
    *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
    *((void *)v9 + 2) = *((void *)v10 + 2);
    uint64_t v11 = v7[8];
    uint64_t v12 = &a1[v11];
    uint64_t v13 = &a2[v11];
    *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
    *((void *)v12 + 2) = *((void *)v13 + 2);
    uint64_t v14 = v7[9];
    unint64_t v15 = &a1[v14];
    uint64_t v16 = &a2[v14];
    uint64_t v17 = type metadata accessor for SymmetricKey();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
    *(_DWORD *)&a1[v7[10]] = *(_DWORD *)&a2[v7[10]];
    *(_WORD *)&a1[v7[11]] = *(_WORD *)&a2[v7[11]];
    *(_WORD *)&a1[v7[12]] = *(_WORD *)&a2[v7[12]];
    uint64_t v18 = v7[13];
    uint64_t v19 = &a1[v18];
    uint64_t v20 = &a2[v18];
    *((void *)v19 + 2) = *((void *)v20 + 2);
    *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
    uint64_t v21 = v7[14];
    uint64_t v22 = &a1[v21];
    unint64_t v23 = &a2[v21];
    uint64_t v24 = type metadata accessor for P256.Signing.PublicKey();
    uint64_t v25 = *(void *)(v24 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
    {
      uint64_t v26 = type metadata accessor for PeerCertificateBundle.Bundle(0);
      memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v22, v23, v24);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

char *assignWithTake for HandshakeState.EncryptedExtensionsState.SessionData(char *a1, char *a2, uint64_t a3)
{
  return assignWithTake for HandshakeState.ServerHelloState.SessionData(a1, a2, a3, type metadata accessor for HandshakeState.EncryptedExtensionsState.SessionData);
}

char *assignWithTake for HandshakeState.ServerHelloState.SessionData(char *a1, char *a2, uint64_t a3, uint64_t (*a4)(void))
{
  if (a1 != a2)
  {
    _s8SwiftTLS14HandshakeStateOWOhTm_1((uint64_t)a1, a4);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for Date();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      uint64_t v8 = (int *)type metadata accessor for SessionTicket();
      *(_DWORD *)&a1[v8[5]] = *(_DWORD *)&a2[v8[5]];
      *(_DWORD *)&a1[v8[6]] = *(_DWORD *)&a2[v8[6]];
      uint64_t v9 = v8[7];
      unint64_t v10 = &a1[v9];
      uint64_t v11 = &a2[v9];
      *(_OWORD *)unint64_t v10 = *(_OWORD *)v11;
      *((void *)v10 + 2) = *((void *)v11 + 2);
      uint64_t v12 = v8[8];
      uint64_t v13 = &a1[v12];
      uint64_t v14 = &a2[v12];
      *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
      *((void *)v13 + 2) = *((void *)v14 + 2);
      uint64_t v15 = v8[9];
      uint64_t v16 = &a1[v15];
      uint64_t v17 = &a2[v15];
      uint64_t v18 = type metadata accessor for SymmetricKey();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
      *(_DWORD *)&a1[v8[10]] = *(_DWORD *)&a2[v8[10]];
      *(_WORD *)&a1[v8[11]] = *(_WORD *)&a2[v8[11]];
      *(_WORD *)&a1[v8[12]] = *(_WORD *)&a2[v8[12]];
      uint64_t v19 = v8[13];
      uint64_t v20 = &a1[v19];
      uint64_t v21 = &a2[v19];
      *((void *)v20 + 2) = *((void *)v21 + 2);
      *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
      uint64_t v22 = v8[14];
      unint64_t v23 = &a1[v22];
      uint64_t v24 = &a2[v22];
      uint64_t v25 = type metadata accessor for P256.Signing.PublicKey();
      uint64_t v26 = *(void *)(v25 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25))
      {
        uint64_t v27 = type metadata accessor for PeerCertificateBundle.Bundle(0);
        memcpy(v23, v24, *(void *)(*(void *)(v27 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v23, v24, v25);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for HandshakeState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for HandshakeState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t type metadata completion function for HandshakeState.EncryptedExtensionsState.SessionData()
{
  return type metadata completion function for HandshakeState.ServerHelloState.SessionData();
}

uint64_t destroy for HandshakeState.EncryptedExtensionsState.SessionData.NewSession()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeBufferWithCopyOfBuffer for HandshakeState.EncryptedExtensionsState.SessionData.NewSession(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HandshakeState.EncryptedExtensionsState.SessionData.NewSession(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(_WORD *)(a1 + 2) = *(_WORD *)(a2 + 2);
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for HandshakeState.EncryptedExtensionsState.SessionData.NewSession(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HandshakeState.EncryptedExtensionsState.SessionData.NewSession(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for HandshakeState.EncryptedExtensionsState.SessionData.NewSession(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HandshakeState.EncryptedExtensionsState.SessionData.NewSession()
{
  return &type metadata for HandshakeState.EncryptedExtensionsState.SessionData.NewSession;
}

uint64_t initializeBufferWithCopyOfBuffer for HandshakeState.ServerCertificateState(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *(void *)a1 = *a2;
    a1 = v9 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    *(void *)(a1 + 16) = a2[2];
    unint64_t v8 = a2[4];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v8 >> 60 == 15)
    {
      *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
    }
    else
    {
      uint64_t v11 = a2[3];
      outlined copy of Data._Representation(v11, v8);
      *(void *)(a1 + 24) = v11;
      *(void *)(a1 + 32) = v8;
    }
    *(void *)(a1 + 40) = a2[5];
    unint64_t v12 = a2[7];
    if (v12 >> 60 == 15)
    {
      *(_OWORD *)(a1 + 48) = *((_OWORD *)a2 + 3);
    }
    else
    {
      uint64_t v13 = a2[6];
      outlined copy of Data._Representation(v13, a2[7]);
      *(void *)(a1 + 48) = v13;
      *(void *)(a1 + 56) = v12;
    }
    *(void *)(a1 + 64) = a2[8];
    int v14 = *((_DWORD *)a2 + 19);
    *(_DWORD *)(a1 + 72) = *((_DWORD *)a2 + 18);
    *(_DWORD *)(a1 + 76) = v14;
    unint64_t v15 = a2[11];
    if (v15 >> 60 == 15)
    {
      *(_OWORD *)(a1 + 80) = *((_OWORD *)a2 + 5);
    }
    else
    {
      uint64_t v16 = a2[10];
      outlined copy of Data._Representation(v16, a2[11]);
      *(void *)(a1 + 80) = v16;
      *(void *)(a1 + 88) = v15;
    }
    *(void *)(a1 + 96) = a2[12];
    unint64_t v17 = a2[14];
    if (v17 >> 60 == 15)
    {
      *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 13);
    }
    else
    {
      uint64_t v18 = a2[13];
      outlined copy of Data._Representation(v18, a2[14]);
      *(void *)(a1 + 104) = v18;
      *(void *)(a1 + 112) = v17;
    }
    *(void *)(a1 + 120) = a2[15];
    *(unsigned char *)(a1 + 128) = *((unsigned char *)a2 + 128);
    uint64_t v19 = *(int *)(a3 + 40);
    uint64_t v20 = (void *)(a1 + v19);
    uint64_t v21 = (char *)a2 + v19;
    uint64_t v22 = type metadata accessor for P256.Signing.PublicKey();
    uint64_t v23 = *(void *)(v22 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
    {
      uint64_t v24 = type metadata accessor for PeerCertificateBundle.Bundle(0);
      memcpy(v20, v21, *(void *)(*(void *)(v24 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v23 + 16))(v20, v21, v22);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
    }
    uint64_t v25 = *(int *)(a3 + 44);
    uint64_t v26 = (char *)(a1 + v25);
    uint64_t v27 = (char *)a2 + v25;
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v29 = type metadata accessor for SHA384();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 16))(v26, v27, v29);
        uint64_t v30 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.EarlySecret);
        uint64_t v31 = v30[9];
        uint64_t v32 = &v26[v31];
        uint64_t v33 = &v27[v31];
        uint64_t v34 = type metadata accessor for SymmetricKey();
        uint64_t v35 = *(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16);
        v35(v32, v33, v34);
        v35(&v26[v30[10]], &v27[v30[10]], v34);
        v35(&v26[v30[11]], &v27[v30[11]], v34);
        v35(&v26[v30[12]], &v27[v30[12]], v34);
        swift_storeEnumTagMultiPayload();
        break;
      case 1u:
        uint64_t v36 = type metadata accessor for SHA384();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 16))(v26, v27, v36);
        uint64_t v37 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.HandshakeSecret);
        uint64_t v38 = v37[9];
        uint64_t v39 = &v26[v38];
        uint64_t v40 = &v27[v38];
        uint64_t v41 = type metadata accessor for SymmetricKey();
        unint64_t v42 = *(void (**)(char *, char *, uint64_t))(*(void *)(v41 - 8) + 16);
        v42(v39, v40, v41);
        v42(&v26[v37[10]], &v27[v37[10]], v41);
        v42(&v26[v37[11]], &v27[v37[11]], v41);
        swift_storeEnumTagMultiPayload();
        break;
      case 2u:
        uint64_t v43 = type metadata accessor for SHA384();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 16))(v26, v27, v43);
        uint64_t v44 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.MasterSecret);
        uint64_t v45 = v44[9];
        uint64_t v46 = &v26[v45];
        unint64_t v47 = &v27[v45];
        uint64_t v48 = type metadata accessor for SymmetricKey();
        uint64_t v49 = *(void (**)(char *, char *, uint64_t))(*(void *)(v48 - 8) + 16);
        v49(v46, v47, v48);
        v49(&v26[v44[10]], &v27[v44[10]], v48);
        v49(&v26[v44[11]], &v27[v44[11]], v48);
        v49(&v26[v44[12]], &v27[v44[12]], v48);
        v49(&v26[v44[13]], &v27[v44[13]], v48);
        v49(&v26[v44[14]], &v27[v44[14]], v48);
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
        uint64_t v50 = type metadata accessor for SymmetricKey();
        uint64_t v51 = *(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 16);
        v51(v26, v27, v50);
        v52 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.AllSecrets);
        v51(&v26[v52[9]], &v27[v52[9]], v50);
        v51(&v26[v52[10]], &v27[v52[10]], v50);
        v51(&v26[v52[11]], &v27[v52[11]], v50);
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v26, v27, *(void *)(*(void *)(v28 - 8) + 64));
        break;
    }
  }
  return a1;
}

uint64_t destroy for HandshakeState.ServerCertificateState(uint64_t *a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v4 = a1[4];
  if (v4 >> 60 != 15) {
    outlined consume of Data._Representation(a1[3], v4);
  }
  unint64_t v5 = a1[7];
  if (v5 >> 60 != 15) {
    outlined consume of Data._Representation(a1[6], v5);
  }
  unint64_t v6 = a1[11];
  if (v6 >> 60 != 15) {
    outlined consume of Data._Representation(a1[10], v6);
  }
  unint64_t v7 = a1[14];
  if (v7 >> 60 != 15) {
    outlined consume of Data._Representation(a1[13], v7);
  }
  unint64_t v8 = (char *)a1 + *(int *)(a2 + 40);
  uint64_t v9 = type metadata accessor for P256.Signing.PublicKey();
  uint64_t v10 = *(void *)(v9 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
  }
  uint64_t v11 = (char *)a1 + *(int *)(a2 + 44);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State);
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      uint64_t v13 = type metadata accessor for SHA384();
      (*(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8))(v11, v13);
      int v14 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.EarlySecret);
      unint64_t v15 = &v11[v14[9]];
      uint64_t v16 = type metadata accessor for SymmetricKey();
      uint64_t v28 = *(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8);
      ((void (*)(void *__return_ptr, char *, uint64_t))v28)((void *)(v16 - 8), v15, v16);
      v28(&v11[v14[10]], v16);
      v28(&v11[v14[11]], v16);
      uint64_t v17 = v14[12];
      goto LABEL_15;
    case 1:
      uint64_t v18 = type metadata accessor for SHA384();
      (*(void (**)(char *, uint64_t))(*(void *)(v18 - 8) + 8))(v11, v18);
      uint64_t v19 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.HandshakeSecret);
      uint64_t v20 = &v11[v19[9]];
      uint64_t v16 = type metadata accessor for SymmetricKey();
      uint64_t v28 = *(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8);
      ((void (*)(void *__return_ptr, char *, uint64_t))v28)((void *)(v16 - 8), v20, v16);
      v28(&v11[v19[10]], v16);
      uint64_t v17 = v19[11];
      goto LABEL_15;
    case 2:
      uint64_t v21 = type metadata accessor for SHA384();
      (*(void (**)(char *, uint64_t))(*(void *)(v21 - 8) + 8))(v11, v21);
      uint64_t v22 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.MasterSecret);
      uint64_t v23 = &v11[v22[9]];
      uint64_t v16 = type metadata accessor for SymmetricKey();
      uint64_t v28 = *(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8);
      ((void (*)(void *__return_ptr, char *, uint64_t))v28)((void *)(v16 - 8), v23, v16);
      v28(&v11[v22[10]], v16);
      v28(&v11[v22[11]], v16);
      v28(&v11[v22[12]], v16);
      v28(&v11[v22[13]], v16);
      uint64_t v17 = v22[14];
LABEL_15:
      uint64_t v24 = &v11[v17];
      uint64_t v25 = v16;
      goto LABEL_17;
    case 3:
      uint64_t v26 = type metadata accessor for SymmetricKey();
      uint64_t v28 = *(void (**)(char *, uint64_t))(*(void *)(v26 - 8) + 8);
      ((void (*)(void *__return_ptr, char *, uint64_t))v28)((void *)(v26 - 8), v11, v26);
      uint64_t v27 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.AllSecrets);
      v28(&v11[v27[9]], v26);
      v28(&v11[v27[10]], v26);
      uint64_t v24 = &v11[v27[11]];
      uint64_t v25 = v26;
LABEL_17:
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v28)(v24, v25);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t initializeWithCopy for HandshakeState.ServerCertificateState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  unint64_t v7 = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  }
  else
  {
    uint64_t v8 = *(void *)(a2 + 24);
    outlined copy of Data._Representation(v8, v7);
    *(void *)(a1 + 24) = v8;
    *(void *)(a1 + 32) = v7;
  }
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  unint64_t v9 = *(void *)(a2 + 56);
  if (v9 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  }
  else
  {
    uint64_t v10 = *(void *)(a2 + 48);
    outlined copy of Data._Representation(v10, *(void *)(a2 + 56));
    *(void *)(a1 + 48) = v10;
    *(void *)(a1 + 56) = v9;
  }
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  int v11 = *(_DWORD *)(a2 + 76);
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = v11;
  unint64_t v12 = *(void *)(a2 + 88);
  if (v12 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  }
  else
  {
    uint64_t v13 = *(void *)(a2 + 80);
    outlined copy of Data._Representation(v13, *(void *)(a2 + 88));
    *(void *)(a1 + 80) = v13;
    *(void *)(a1 + 88) = v12;
  }
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  unint64_t v14 = *(void *)(a2 + 112);
  if (v14 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  }
  else
  {
    uint64_t v15 = *(void *)(a2 + 104);
    outlined copy of Data._Representation(v15, *(void *)(a2 + 112));
    *(void *)(a1 + 104) = v15;
    *(void *)(a1 + 112) = v14;
  }
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  uint64_t v16 = *(int *)(a3 + 40);
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (const void *)(a2 + v16);
  uint64_t v19 = type metadata accessor for P256.Signing.PublicKey();
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
  {
    uint64_t v21 = type metadata accessor for PeerCertificateBundle.Bundle(0);
    memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v20 + 16))(v17, v18, v19);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  }
  uint64_t v22 = *(int *)(a3 + 44);
  uint64_t v23 = (char *)(a1 + v22);
  uint64_t v24 = (char *)(a2 + v22);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v26 = type metadata accessor for SHA384();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16))(v23, v24, v26);
      uint64_t v27 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.EarlySecret);
      uint64_t v28 = v27[9];
      uint64_t v29 = &v23[v28];
      uint64_t v30 = &v24[v28];
      uint64_t v31 = type metadata accessor for SymmetricKey();
      uint64_t v32 = *(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 16);
      v32(v29, v30, v31);
      v32(&v23[v27[10]], &v24[v27[10]], v31);
      v32(&v23[v27[11]], &v24[v27[11]], v31);
      v32(&v23[v27[12]], &v24[v27[12]], v31);
      goto LABEL_22;
    case 1u:
      uint64_t v33 = type metadata accessor for SHA384();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 16))(v23, v24, v33);
      uint64_t v34 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.HandshakeSecret);
      uint64_t v35 = v34[9];
      uint64_t v36 = &v23[v35];
      uint64_t v37 = &v24[v35];
      uint64_t v38 = type metadata accessor for SymmetricKey();
      uint64_t v39 = *(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 16);
      v39(v36, v37, v38);
      v39(&v23[v34[10]], &v24[v34[10]], v38);
      v39(&v23[v34[11]], &v24[v34[11]], v38);
      goto LABEL_22;
    case 2u:
      uint64_t v40 = type metadata accessor for SHA384();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v40 - 8) + 16))(v23, v24, v40);
      uint64_t v41 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.MasterSecret);
      uint64_t v42 = v41[9];
      uint64_t v43 = &v23[v42];
      uint64_t v44 = &v24[v42];
      uint64_t v45 = type metadata accessor for SymmetricKey();
      uint64_t v46 = *(void (**)(char *, char *, uint64_t))(*(void *)(v45 - 8) + 16);
      v46(v43, v44, v45);
      v46(&v23[v41[10]], &v24[v41[10]], v45);
      v46(&v23[v41[11]], &v24[v41[11]], v45);
      v46(&v23[v41[12]], &v24[v41[12]], v45);
      v46(&v23[v41[13]], &v24[v41[13]], v45);
      v46(&v23[v41[14]], &v24[v41[14]], v45);
      goto LABEL_22;
    case 3u:
      uint64_t v47 = type metadata accessor for SymmetricKey();
      uint64_t v48 = *(void (**)(char *, char *, uint64_t))(*(void *)(v47 - 8) + 16);
      v48(v23, v24, v47);
      uint64_t v49 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.AllSecrets);
      v48(&v23[v49[9]], &v24[v49[9]], v47);
      v48(&v23[v49[10]], &v24[v49[10]], v47);
      v48(&v23[v49[11]], &v24[v49[11]], v47);
LABEL_22:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(v23, v24, *(void *)(*(void *)(v25 - 8) + 64));
      break;
  }
  return a1;
}

uint64_t assignWithCopy for HandshakeState.ServerCertificateState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (long long *)(a1 + 24);
  unint64_t v7 = (long long *)(a2 + 24);
  unint64_t v8 = *(void *)(a2 + 32);
  if (*(void *)(a1 + 32) >> 60 == 15)
  {
    if (v8 >> 60 == 15)
    {
      long long v9 = *v7;
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      long long *v6 = v9;
      goto LABEL_9;
    }
    uint64_t v11 = *(void *)(a2 + 24);
    outlined copy of Data._Representation(v11, *(void *)(a2 + 32));
    *(void *)(a1 + 24) = v11;
    *(void *)(a1 + 32) = v8;
  }
  else
  {
    if (v8 >> 60 == 15)
    {
      outlined destroy of ByteBuffer(a1 + 24);
      uint64_t v10 = *(void *)(a2 + 40);
      long long *v6 = *v7;
      *(void *)(a1 + 40) = v10;
      goto LABEL_9;
    }
    uint64_t v12 = *(void *)(a2 + 24);
    outlined copy of Data._Representation(v12, *(void *)(a2 + 32));
    uint64_t v13 = *(void *)(a1 + 24);
    unint64_t v14 = *(void *)(a1 + 32);
    *(void *)(a1 + 24) = v12;
    *(void *)(a1 + 32) = v8;
    outlined consume of Data._Representation(v13, v14);
  }
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
LABEL_9:
  uint64_t v15 = (long long *)(a1 + 48);
  uint64_t v16 = (long long *)(a2 + 48);
  unint64_t v17 = *(void *)(a2 + 56);
  if (*(void *)(a1 + 56) >> 60 == 15)
  {
    if (v17 >> 60 == 15)
    {
      long long v18 = *v16;
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      long long *v15 = v18;
      goto LABEL_17;
    }
    uint64_t v20 = *(void *)(a2 + 48);
    outlined copy of Data._Representation(v20, *(void *)(a2 + 56));
    *(void *)(a1 + 48) = v20;
    *(void *)(a1 + 56) = v17;
  }
  else
  {
    if (v17 >> 60 == 15)
    {
      outlined destroy of ByteBuffer(a1 + 48);
      uint64_t v19 = *(void *)(a2 + 64);
      long long *v15 = *v16;
      *(void *)(a1 + 64) = v19;
      goto LABEL_17;
    }
    uint64_t v21 = *(void *)(a2 + 48);
    outlined copy of Data._Representation(v21, *(void *)(a2 + 56));
    uint64_t v22 = *(void *)(a1 + 48);
    unint64_t v23 = *(void *)(a1 + 56);
    *(void *)(a1 + 48) = v21;
    *(void *)(a1 + 56) = v17;
    outlined consume of Data._Representation(v22, v23);
  }
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
LABEL_17:
  __int16 v24 = *(_WORD *)(a2 + 72);
  *(unsigned char *)(a1 + 74) = *(unsigned char *)(a2 + 74);
  *(_WORD *)(a1 + 72) = v24;
  *(unsigned char *)(a1 + 75) = *(unsigned char *)(a2 + 75);
  *(_WORD *)(a1 + 76) = *(_WORD *)(a2 + 76);
  *(_WORD *)(a1 + 78) = *(_WORD *)(a2 + 78);
  uint64_t v25 = (long long *)(a1 + 80);
  uint64_t v26 = (long long *)(a2 + 80);
  unint64_t v27 = *(void *)(a2 + 88);
  if (*(void *)(a1 + 88) >> 60 == 15)
  {
    if (v27 >> 60 == 15)
    {
      long long v28 = *v26;
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      *uint64_t v25 = v28;
      goto LABEL_25;
    }
    uint64_t v30 = *(void *)(a2 + 80);
    outlined copy of Data._Representation(v30, *(void *)(a2 + 88));
    *(void *)(a1 + 80) = v30;
    *(void *)(a1 + 88) = v27;
  }
  else
  {
    if (v27 >> 60 == 15)
    {
      outlined destroy of ByteBuffer(a1 + 80);
      uint64_t v29 = *(void *)(a2 + 96);
      *uint64_t v25 = *v26;
      *(void *)(a1 + 96) = v29;
      goto LABEL_25;
    }
    uint64_t v31 = *(void *)(a2 + 80);
    outlined copy of Data._Representation(v31, *(void *)(a2 + 88));
    uint64_t v32 = *(void *)(a1 + 80);
    unint64_t v33 = *(void *)(a1 + 88);
    *(void *)(a1 + 80) = v31;
    *(void *)(a1 + 88) = v27;
    outlined consume of Data._Representation(v32, v33);
  }
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
LABEL_25:
  uint64_t v34 = (long long *)(a1 + 104);
  uint64_t v35 = (long long *)(a2 + 104);
  unint64_t v36 = *(void *)(a2 + 112);
  if (*(void *)(a1 + 112) >> 60 == 15)
  {
    if (v36 >> 60 == 15)
    {
      long long v37 = *v35;
      *(void *)(a1 + 120) = *(void *)(a2 + 120);
      *uint64_t v34 = v37;
      goto LABEL_33;
    }
    uint64_t v39 = *(void *)(a2 + 104);
    outlined copy of Data._Representation(v39, *(void *)(a2 + 112));
    *(void *)(a1 + 104) = v39;
    *(void *)(a1 + 112) = v36;
  }
  else
  {
    if (v36 >> 60 == 15)
    {
      outlined destroy of ByteBuffer(a1 + 104);
      uint64_t v38 = *(void *)(a2 + 120);
      *uint64_t v34 = *v35;
      *(void *)(a1 + 120) = v38;
      goto LABEL_33;
    }
    uint64_t v40 = *(void *)(a2 + 104);
    outlined copy of Data._Representation(v40, *(void *)(a2 + 112));
    uint64_t v41 = *(void *)(a1 + 104);
    unint64_t v42 = *(void *)(a1 + 112);
    *(void *)(a1 + 104) = v40;
    *(void *)(a1 + 112) = v36;
    outlined consume of Data._Representation(v41, v42);
  }
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
LABEL_33:
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  uint64_t v43 = *(int *)(a3 + 40);
  uint64_t v44 = (void *)(a1 + v43);
  uint64_t v45 = (void *)(a2 + v43);
  uint64_t v46 = type metadata accessor for P256.Signing.PublicKey();
  uint64_t v47 = *(void *)(v46 - 8);
  uint64_t v48 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v47 + 48);
  int v49 = v48(v44, 1, v46);
  int v50 = v48(v45, 1, v46);
  if (v49)
  {
    if (!v50)
    {
      (*(void (**)(void *, void *, uint64_t))(v47 + 16))(v44, v45, v46);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v47 + 56))(v44, 0, 1, v46);
      if (a1 == a2) {
        return a1;
      }
      goto LABEL_40;
    }
LABEL_39:
    uint64_t v51 = type metadata accessor for PeerCertificateBundle.Bundle(0);
    memcpy(v44, v45, *(void *)(*(void *)(v51 - 8) + 64));
    if (a1 == a2) {
      return a1;
    }
    goto LABEL_40;
  }
  if (v50)
  {
    (*(void (**)(void *, uint64_t))(v47 + 8))(v44, v46);
    goto LABEL_39;
  }
  (*(void (**)(void *, void *, uint64_t))(v47 + 24))(v44, v45, v46);
  if (a1 == a2) {
    return a1;
  }
LABEL_40:
  uint64_t v52 = *(int *)(a3 + 44);
  uint64_t v53 = (char *)(a1 + v52);
  uint64_t v54 = (char *)(a2 + v52);
  outlined destroy of HandshakeStateMachine?(a1 + v52, &demangling cache variable for type metadata for SessionKeyManager<SHA384>.State);
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v56 = type metadata accessor for SHA384();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v56 - 8) + 16))(v53, v54, v56);
      uint64_t v57 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.EarlySecret);
      uint64_t v58 = v57[9];
      uint64_t v59 = &v53[v58];
      uint64_t v60 = &v54[v58];
      uint64_t v61 = type metadata accessor for SymmetricKey();
      uint64_t v62 = *(void (**)(char *, char *, uint64_t))(*(void *)(v61 - 8) + 16);
      v62(v59, v60, v61);
      v62(&v53[v57[10]], &v54[v57[10]], v61);
      v62(&v53[v57[11]], &v54[v57[11]], v61);
      v62(&v53[v57[12]], &v54[v57[12]], v61);
      goto LABEL_48;
    case 1u:
      uint64_t v63 = type metadata accessor for SHA384();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v63 - 8) + 16))(v53, v54, v63);
      uint64_t v64 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.HandshakeSecret);
      uint64_t v65 = v64[9];
      uint64_t v66 = &v53[v65];
      uint64_t v67 = &v54[v65];
      uint64_t v68 = type metadata accessor for SymmetricKey();
      unint64_t v69 = *(void (**)(char *, char *, uint64_t))(*(void *)(v68 - 8) + 16);
      v69(v66, v67, v68);
      v69(&v53[v64[10]], &v54[v64[10]], v68);
      v69(&v53[v64[11]], &v54[v64[11]], v68);
      goto LABEL_48;
    case 2u:
      uint64_t v70 = type metadata accessor for SHA384();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v70 - 8) + 16))(v53, v54, v70);
      uint64_t v71 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.MasterSecret);
      uint64_t v72 = v71[9];
      uint64_t v73 = &v53[v72];
      uint64_t v74 = &v54[v72];
      uint64_t v75 = type metadata accessor for SymmetricKey();
      uint64_t v76 = *(void (**)(char *, char *, uint64_t))(*(void *)(v75 - 8) + 16);
      v76(v73, v74, v75);
      v76(&v53[v71[10]], &v54[v71[10]], v75);
      v76(&v53[v71[11]], &v54[v71[11]], v75);
      v76(&v53[v71[12]], &v54[v71[12]], v75);
      v76(&v53[v71[13]], &v54[v71[13]], v75);
      v76(&v53[v71[14]], &v54[v71[14]], v75);
      goto LABEL_48;
    case 3u:
      uint64_t v77 = type metadata accessor for SymmetricKey();
      v78 = *(void (**)(char *, char *, uint64_t))(*(void *)(v77 - 8) + 16);
      v78(v53, v54, v77);
      uint64_t v79 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.AllSecrets);
      v78(&v53[v79[9]], &v54[v79[9]], v77);
      v78(&v53[v79[10]], &v54[v79[10]], v77);
      v78(&v53[v79[11]], &v54[v79[11]], v77);
LABEL_48:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(v53, v54, *(void *)(*(void *)(v55 - 8) + 64));
      break;
  }
  return a1;
}

uint64_t initializeWithTake for HandshakeState.ServerCertificateState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v6;
  *(_OWORD *)(a1 + 60) = *(_OWORD *)(a2 + 60);
  long long v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v7;
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  long long v8 = *(_OWORD *)(a2 + 104);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  uint64_t v9 = *(int *)(a3 + 40);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (const void *)(a2 + v9);
  *(_OWORD *)(a1 + 104) = v8;
  uint64_t v12 = type metadata accessor for P256.Signing.PublicKey();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    uint64_t v14 = type metadata accessor for PeerCertificateBundle.Bundle(0);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v13 + 32))(v10, v11, v12);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  uint64_t v15 = *(int *)(a3 + 44);
  uint64_t v16 = (char *)(a1 + v15);
  unint64_t v17 = (char *)(a2 + v15);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v19 = type metadata accessor for SHA384();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v16, v17, v19);
      uint64_t v20 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.EarlySecret);
      uint64_t v21 = v20[9];
      uint64_t v22 = &v16[v21];
      unint64_t v23 = &v17[v21];
      uint64_t v24 = type metadata accessor for SymmetricKey();
      uint64_t v25 = *(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 32);
      v25(v22, v23, v24);
      v25(&v16[v20[10]], &v17[v20[10]], v24);
      v25(&v16[v20[11]], &v17[v20[11]], v24);
      v25(&v16[v20[12]], &v17[v20[12]], v24);
      goto LABEL_10;
    case 1u:
      uint64_t v26 = type metadata accessor for SHA384();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(v16, v17, v26);
      unint64_t v27 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.HandshakeSecret);
      uint64_t v28 = v27[9];
      uint64_t v29 = &v16[v28];
      uint64_t v30 = &v17[v28];
      uint64_t v31 = type metadata accessor for SymmetricKey();
      uint64_t v32 = *(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 32);
      v32(v29, v30, v31);
      v32(&v16[v27[10]], &v17[v27[10]], v31);
      v32(&v16[v27[11]], &v17[v27[11]], v31);
      goto LABEL_10;
    case 2u:
      uint64_t v33 = type metadata accessor for SHA384();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 32))(v16, v17, v33);
      uint64_t v34 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.MasterSecret);
      uint64_t v35 = v34[9];
      unint64_t v36 = &v16[v35];
      long long v37 = &v17[v35];
      uint64_t v38 = type metadata accessor for SymmetricKey();
      uint64_t v39 = *(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 32);
      v39(v36, v37, v38);
      v39(&v16[v34[10]], &v17[v34[10]], v38);
      v39(&v16[v34[11]], &v17[v34[11]], v38);
      v39(&v16[v34[12]], &v17[v34[12]], v38);
      v39(&v16[v34[13]], &v17[v34[13]], v38);
      v39(&v16[v34[14]], &v17[v34[14]], v38);
      goto LABEL_10;
    case 3u:
      uint64_t v40 = type metadata accessor for SymmetricKey();
      uint64_t v41 = *(void (**)(char *, char *, uint64_t))(*(void *)(v40 - 8) + 32);
      v41(v16, v17, v40);
      unint64_t v42 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.AllSecrets);
      v41(&v16[v42[9]], &v17[v42[9]], v40);
      v41(&v16[v42[10]], &v17[v42[10]], v40);
      v41(&v16[v42[11]], &v17[v42[11]], v40);
LABEL_10:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
      break;
  }
  return a1;
}

uint64_t assignWithTake for HandshakeState.ServerCertificateState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  unint64_t v7 = *(void *)(a1 + 32);
  if (v7 >> 60 == 15) {
    goto LABEL_4;
  }
  unint64_t v8 = *(void *)(a2 + 32);
  if (v8 >> 60 == 15)
  {
    outlined destroy of ByteBuffer(a1 + 24);
LABEL_4:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    goto LABEL_6;
  }
  uint64_t v9 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v8;
  outlined consume of Data._Representation(v9, v7);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
LABEL_6:
  unint64_t v10 = *(void *)(a1 + 56);
  if (v10 >> 60 == 15)
  {
LABEL_9:
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    goto LABEL_11;
  }
  unint64_t v11 = *(void *)(a2 + 56);
  if (v11 >> 60 == 15)
  {
    outlined destroy of ByteBuffer(a1 + 48);
    goto LABEL_9;
  }
  uint64_t v12 = *(void *)(a1 + 48);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v11;
  outlined consume of Data._Representation(v12, v10);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
LABEL_11:
  *(_WORD *)(a1 + 72) = *(_WORD *)(a2 + 72);
  *(unsigned char *)(a1 + 74) = *(unsigned char *)(a2 + 74);
  *(unsigned char *)(a1 + 75) = *(unsigned char *)(a2 + 75);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  unint64_t v13 = *(void *)(a1 + 88);
  if (v13 >> 60 == 15)
  {
LABEL_14:
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    goto LABEL_16;
  }
  unint64_t v14 = *(void *)(a2 + 88);
  if (v14 >> 60 == 15)
  {
    outlined destroy of ByteBuffer(a1 + 80);
    goto LABEL_14;
  }
  uint64_t v15 = *(void *)(a1 + 80);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v14;
  outlined consume of Data._Representation(v15, v13);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
LABEL_16:
  unint64_t v16 = *(void *)(a1 + 112);
  if (v16 >> 60 == 15)
  {
LABEL_19:
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
    *(void *)(a1 + 120) = *(void *)(a2 + 120);
    goto LABEL_21;
  }
  unint64_t v17 = *(void *)(a2 + 112);
  if (v17 >> 60 == 15)
  {
    outlined destroy of ByteBuffer(a1 + 104);
    goto LABEL_19;
  }
  uint64_t v18 = *(void *)(a1 + 104);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v17;
  outlined consume of Data._Representation(v18, v16);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
LABEL_21:
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  uint64_t v19 = *(int *)(a3 + 40);
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (void *)(a2 + v19);
  uint64_t v22 = type metadata accessor for P256.Signing.PublicKey();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v23 + 48);
  int v25 = v24(v20, 1, v22);
  int v26 = v24(v21, 1, v22);
  if (v25)
  {
    if (!v26)
    {
      (*(void (**)(void *, void *, uint64_t))(v23 + 32))(v20, v21, v22);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
      if (a1 == a2) {
        return a1;
      }
      goto LABEL_28;
    }
LABEL_27:
    uint64_t v27 = type metadata accessor for PeerCertificateBundle.Bundle(0);
    memcpy(v20, v21, *(void *)(*(void *)(v27 - 8) + 64));
    if (a1 == a2) {
      return a1;
    }
    goto LABEL_28;
  }
  if (v26)
  {
    (*(void (**)(void *, uint64_t))(v23 + 8))(v20, v22);
    goto LABEL_27;
  }
  (*(void (**)(void *, void *, uint64_t))(v23 + 40))(v20, v21, v22);
  if (a1 == a2) {
    return a1;
  }
LABEL_28:
  uint64_t v28 = *(int *)(a3 + 44);
  uint64_t v29 = (char *)(a1 + v28);
  uint64_t v30 = (char *)(a2 + v28);
  outlined destroy of HandshakeStateMachine?(a1 + v28, &demangling cache variable for type metadata for SessionKeyManager<SHA384>.State);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v32 = type metadata accessor for SHA384();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 32))(v29, v30, v32);
      uint64_t v33 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.EarlySecret);
      uint64_t v34 = v33[9];
      uint64_t v35 = &v29[v34];
      unint64_t v36 = &v30[v34];
      uint64_t v37 = type metadata accessor for SymmetricKey();
      uint64_t v38 = *(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 32);
      v38(v35, v36, v37);
      v38(&v29[v33[10]], &v30[v33[10]], v37);
      v38(&v29[v33[11]], &v30[v33[11]], v37);
      v38(&v29[v33[12]], &v30[v33[12]], v37);
      goto LABEL_36;
    case 1u:
      uint64_t v39 = type metadata accessor for SHA384();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v39 - 8) + 32))(v29, v30, v39);
      uint64_t v40 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.HandshakeSecret);
      uint64_t v41 = v40[9];
      unint64_t v42 = &v29[v41];
      uint64_t v43 = &v30[v41];
      uint64_t v44 = type metadata accessor for SymmetricKey();
      uint64_t v45 = *(void (**)(char *, char *, uint64_t))(*(void *)(v44 - 8) + 32);
      v45(v42, v43, v44);
      v45(&v29[v40[10]], &v30[v40[10]], v44);
      v45(&v29[v40[11]], &v30[v40[11]], v44);
      goto LABEL_36;
    case 2u:
      uint64_t v46 = type metadata accessor for SHA384();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 32))(v29, v30, v46);
      uint64_t v47 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.MasterSecret);
      uint64_t v48 = v47[9];
      int v49 = &v29[v48];
      int v50 = &v30[v48];
      uint64_t v51 = type metadata accessor for SymmetricKey();
      uint64_t v52 = *(void (**)(char *, char *, uint64_t))(*(void *)(v51 - 8) + 32);
      v52(v49, v50, v51);
      v52(&v29[v47[10]], &v30[v47[10]], v51);
      v52(&v29[v47[11]], &v30[v47[11]], v51);
      v52(&v29[v47[12]], &v30[v47[12]], v51);
      v52(&v29[v47[13]], &v30[v47[13]], v51);
      v52(&v29[v47[14]], &v30[v47[14]], v51);
      goto LABEL_36;
    case 3u:
      uint64_t v53 = type metadata accessor for SymmetricKey();
      uint64_t v54 = *(void (**)(char *, char *, uint64_t))(*(void *)(v53 - 8) + 32);
      v54(v29, v30, v53);
      uint64_t v55 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.AllSecrets);
      v54(&v29[v55[9]], &v30[v55[9]], v53);
      v54(&v29[v55[10]], &v30[v55[10]], v53);
      v54(&v29[v55[11]], &v30[v55[11]], v53);
LABEL_36:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(v29, v30, *(void *)(*(void *)(v31 - 8) + 64));
      break;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for HandshakeState.ServerCertificateState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B575E9C8);
}

uint64_t sub_1B575E9C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for PeerCertificateBundle(0);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 40);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>);
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 44);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for HandshakeState.ServerCertificateState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B575EB0C);
}

uint64_t sub_1B575EB0C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for PeerCertificateBundle(0);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 40);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>);
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 44);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void type metadata completion function for HandshakeState.ServerCertificateState()
{
  type metadata accessor for PeerCertificateBundle.Bundle(319);
  if (v0 <= 0x3F)
  {
    type metadata accessor for SessionKeyManager<SHA384>.State();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t getEnumTagSinglePayload for HandshakeState.ServerCertificateVerifyState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, j____swift_get_extra_inhabitant_index_21Tm);
}

uint64_t storeEnumTagSinglePayload for HandshakeState.ServerCertificateVerifyState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_22Tm);
}

uint64_t initializeBufferWithCopyOfBuffer for HandshakeState.ServerCertificateVerifyState(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *(void *)a1 = *a2;
    a1 = v9 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    *(void *)(a1 + 16) = a2[2];
    unint64_t v8 = a2[4];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v8 >> 60 == 15)
    {
      *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
    }
    else
    {
      uint64_t v11 = a2[3];
      outlined copy of Data._Representation(v11, v8);
      *(void *)(a1 + 24) = v11;
      *(void *)(a1 + 32) = v8;
    }
    *(void *)(a1 + 40) = a2[5];
    unint64_t v12 = a2[7];
    if (v12 >> 60 == 15)
    {
      *(_OWORD *)(a1 + 48) = *((_OWORD *)a2 + 3);
    }
    else
    {
      uint64_t v13 = a2[6];
      outlined copy of Data._Representation(v13, a2[7]);
      *(void *)(a1 + 48) = v13;
      *(void *)(a1 + 56) = v12;
    }
    *(void *)(a1 + 64) = a2[8];
    int v14 = *((_DWORD *)a2 + 19);
    *(_DWORD *)(a1 + 72) = *((_DWORD *)a2 + 18);
    *(_DWORD *)(a1 + 76) = v14;
    uint64_t v15 = a3[7];
    uint64_t v16 = (void *)(a1 + v15);
    unint64_t v17 = (char *)a2 + v15;
    uint64_t v18 = type metadata accessor for P256.Signing.PublicKey();
    uint64_t v19 = *(void *)(v18 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
    {
      uint64_t v20 = type metadata accessor for PeerCertificateBundle.Bundle(0);
      memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v19 + 16))(v16, v17, v18);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
    }
    uint64_t v21 = a3[8];
    uint64_t v22 = a1 + v21;
    uint64_t v23 = (uint64_t *)((char *)a2 + v21);
    unint64_t v24 = *(uint64_t *)((char *)a2 + v21 + 8);
    if (v24 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
    }
    else
    {
      uint64_t v25 = *v23;
      outlined copy of Data._Representation(*v23, v24);
      *(void *)uint64_t v22 = v25;
      *(void *)(v22 + 8) = v24;
    }
    *(void *)(v22 + 16) = v23[2];
    uint64_t v26 = a3[9];
    uint64_t v27 = a1 + v26;
    uint64_t v28 = (uint64_t *)((char *)a2 + v26);
    unint64_t v29 = *(uint64_t *)((char *)a2 + v26 + 8);
    if (v29 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v27 = *(_OWORD *)v28;
    }
    else
    {
      uint64_t v30 = *v28;
      outlined copy of Data._Representation(*v28, v29);
      *(void *)uint64_t v27 = v30;
      *(void *)(v27 + 8) = v29;
    }
    *(void *)(v27 + 16) = v28[2];
    uint64_t v31 = a3[11];
    *(unsigned char *)(a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
    uint64_t v32 = (char *)(a1 + v31);
    uint64_t v33 = (char *)a2 + v31;
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v35 = type metadata accessor for SHA384();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 16))(v32, v33, v35);
        unint64_t v36 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.EarlySecret);
        uint64_t v37 = v36[9];
        uint64_t v38 = &v32[v37];
        uint64_t v39 = &v33[v37];
        uint64_t v40 = type metadata accessor for SymmetricKey();
        uint64_t v41 = *(void (**)(char *, char *, uint64_t))(*(void *)(v40 - 8) + 16);
        v41(v38, v39, v40);
        v41(&v32[v36[10]], &v33[v36[10]], v40);
        v41(&v32[v36[11]], &v33[v36[11]], v40);
        v41(&v32[v36[12]], &v33[v36[12]], v40);
        swift_storeEnumTagMultiPayload();
        break;
      case 1u:
        uint64_t v42 = type metadata accessor for SHA384();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 16))(v32, v33, v42);
        uint64_t v43 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.HandshakeSecret);
        uint64_t v44 = v43[9];
        uint64_t v45 = &v32[v44];
        uint64_t v46 = &v33[v44];
        uint64_t v47 = type metadata accessor for SymmetricKey();
        uint64_t v48 = *(void (**)(char *, char *, uint64_t))(*(void *)(v47 - 8) + 16);
        v48(v45, v46, v47);
        v48(&v32[v43[10]], &v33[v43[10]], v47);
        v48(&v32[v43[11]], &v33[v43[11]], v47);
        swift_storeEnumTagMultiPayload();
        break;
      case 2u:
        uint64_t v49 = type metadata accessor for SHA384();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v49 - 8) + 16))(v32, v33, v49);
        int v50 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.MasterSecret);
        uint64_t v51 = v50[9];
        uint64_t v52 = &v32[v51];
        uint64_t v53 = &v33[v51];
        uint64_t v54 = type metadata accessor for SymmetricKey();
        uint64_t v55 = *(void (**)(char *, char *, uint64_t))(*(void *)(v54 - 8) + 16);
        v55(v52, v53, v54);
        v55(&v32[v50[10]], &v33[v50[10]], v54);
        v55(&v32[v50[11]], &v33[v50[11]], v54);
        v55(&v32[v50[12]], &v33[v50[12]], v54);
        v55(&v32[v50[13]], &v33[v50[13]], v54);
        v55(&v32[v50[14]], &v33[v50[14]], v54);
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
        uint64_t v56 = type metadata accessor for SymmetricKey();
        uint64_t v57 = *(void (**)(char *, char *, uint64_t))(*(void *)(v56 - 8) + 16);
        v57(v32, v33, v56);
        uint64_t v58 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.AllSecrets);
        v57(&v32[v58[9]], &v33[v58[9]], v56);
        v57(&v32[v58[10]], &v33[v58[10]], v56);
        v57(&v32[v58[11]], &v33[v58[11]], v56);
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v32, v33, *(void *)(*(void *)(v34 - 8) + 64));
        break;
    }
  }
  return a1;
}

uint64_t destroy for HandshakeState.ServerCertificateVerifyState(uint64_t *a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v4 = a1[4];
  if (v4 >> 60 != 15) {
    outlined consume of Data._Representation(a1[3], v4);
  }
  unint64_t v5 = a1[7];
  if (v5 >> 60 != 15) {
    outlined consume of Data._Representation(a1[6], v5);
  }
  uint64_t v6 = (char *)a1 + a2[7];
  uint64_t v7 = type metadata accessor for P256.Signing.PublicKey();
  uint64_t v8 = *(void *)(v7 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  }
  uint64_t v9 = (uint64_t *)((char *)a1 + a2[8]);
  unint64_t v10 = v9[1];
  if (v10 >> 60 != 15) {
    outlined consume of Data._Representation(*v9, v10);
  }
  uint64_t v11 = (uint64_t *)((char *)a1 + a2[9]);
  unint64_t v12 = v11[1];
  if (v12 >> 60 != 15) {
    outlined consume of Data._Representation(*v11, v12);
  }
  uint64_t v13 = (char *)a1 + a2[11];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State);
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      uint64_t v15 = type metadata accessor for SHA384();
      (*(void (**)(char *, uint64_t))(*(void *)(v15 - 8) + 8))(v13, v15);
      uint64_t v16 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.EarlySecret);
      unint64_t v17 = &v13[v16[9]];
      uint64_t v18 = type metadata accessor for SymmetricKey();
      uint64_t v30 = *(void (**)(char *, uint64_t))(*(void *)(v18 - 8) + 8);
      ((void (*)(void *__return_ptr, char *, uint64_t))v30)((void *)(v18 - 8), v17, v18);
      v30(&v13[v16[10]], v18);
      v30(&v13[v16[11]], v18);
      uint64_t v19 = v16[12];
      goto LABEL_15;
    case 1:
      uint64_t v20 = type metadata accessor for SHA384();
      (*(void (**)(char *, uint64_t))(*(void *)(v20 - 8) + 8))(v13, v20);
      uint64_t v21 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.HandshakeSecret);
      uint64_t v22 = &v13[v21[9]];
      uint64_t v18 = type metadata accessor for SymmetricKey();
      uint64_t v30 = *(void (**)(char *, uint64_t))(*(void *)(v18 - 8) + 8);
      ((void (*)(void *__return_ptr, char *, uint64_t))v30)((void *)(v18 - 8), v22, v18);
      v30(&v13[v21[10]], v18);
      uint64_t v19 = v21[11];
      goto LABEL_15;
    case 2:
      uint64_t v23 = type metadata accessor for SHA384();
      (*(void (**)(char *, uint64_t))(*(void *)(v23 - 8) + 8))(v13, v23);
      unint64_t v24 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.MasterSecret);
      uint64_t v25 = &v13[v24[9]];
      uint64_t v18 = type metadata accessor for SymmetricKey();
      uint64_t v30 = *(void (**)(char *, uint64_t))(*(void *)(v18 - 8) + 8);
      ((void (*)(void *__return_ptr, char *, uint64_t))v30)((void *)(v18 - 8), v25, v18);
      v30(&v13[v24[10]], v18);
      v30(&v13[v24[11]], v18);
      v30(&v13[v24[12]], v18);
      v30(&v13[v24[13]], v18);
      uint64_t v19 = v24[14];
LABEL_15:
      uint64_t v26 = &v13[v19];
      uint64_t v27 = v18;
      goto LABEL_17;
    case 3:
      uint64_t v28 = type metadata accessor for SymmetricKey();
      uint64_t v30 = *(void (**)(char *, uint64_t))(*(void *)(v28 - 8) + 8);
      ((void (*)(void *__return_ptr, char *, uint64_t))v30)((void *)(v28 - 8), v13, v28);
      unint64_t v29 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.AllSecrets);
      v30(&v13[v29[9]], v28);
      v30(&v13[v29[10]], v28);
      uint64_t v26 = &v13[v29[11]];
      uint64_t v27 = v28;
LABEL_17:
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v30)(v26, v27);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t initializeWithCopy for HandshakeState.ServerCertificateVerifyState(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  unint64_t v7 = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  }
  else
  {
    uint64_t v8 = *(void *)(a2 + 24);
    outlined copy of Data._Representation(v8, v7);
    *(void *)(a1 + 24) = v8;
    *(void *)(a1 + 32) = v7;
  }
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  unint64_t v9 = *(void *)(a2 + 56);
  if (v9 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  }
  else
  {
    uint64_t v10 = *(void *)(a2 + 48);
    outlined copy of Data._Representation(v10, *(void *)(a2 + 56));
    *(void *)(a1 + 48) = v10;
    *(void *)(a1 + 56) = v9;
  }
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  int v11 = *(_DWORD *)(a2 + 76);
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = v11;
  uint64_t v12 = a3[7];
  uint64_t v13 = (void *)(a1 + v12);
  int v14 = (const void *)(a2 + v12);
  uint64_t v15 = type metadata accessor for P256.Signing.PublicKey();
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    uint64_t v17 = type metadata accessor for PeerCertificateBundle.Bundle(0);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v16 + 16))(v13, v14, v15);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  uint64_t v18 = a3[8];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = (uint64_t *)(a2 + v18);
  unint64_t v21 = *(void *)(a2 + v18 + 8);
  if (v21 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
  }
  else
  {
    uint64_t v22 = *v20;
    outlined copy of Data._Representation(*v20, v21);
    *(void *)uint64_t v19 = v22;
    *(void *)(v19 + 8) = v21;
  }
  *(void *)(v19 + 16) = v20[2];
  uint64_t v23 = a3[9];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = (uint64_t *)(a2 + v23);
  unint64_t v26 = *(void *)(a2 + v23 + 8);
  if (v26 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
  }
  else
  {
    uint64_t v27 = *v25;
    outlined copy of Data._Representation(*v25, v26);
    *(void *)uint64_t v24 = v27;
    *(void *)(v24 + 8) = v26;
  }
  *(void *)(v24 + 16) = v25[2];
  uint64_t v28 = a3[11];
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  unint64_t v29 = (char *)(a1 + v28);
  uint64_t v30 = (char *)(a2 + v28);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v32 = type metadata accessor for SHA384();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 16))(v29, v30, v32);
      uint64_t v33 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.EarlySecret);
      uint64_t v34 = v33[9];
      uint64_t v35 = &v29[v34];
      unint64_t v36 = &v30[v34];
      uint64_t v37 = type metadata accessor for SymmetricKey();
      uint64_t v38 = *(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 16);
      v38(v35, v36, v37);
      v38(&v29[v33[10]], &v30[v33[10]], v37);
      v38(&v29[v33[11]], &v30[v33[11]], v37);
      v38(&v29[v33[12]], &v30[v33[12]], v37);
      goto LABEL_22;
    case 1u:
      uint64_t v39 = type metadata accessor for SHA384();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v39 - 8) + 16))(v29, v30, v39);
      uint64_t v40 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.HandshakeSecret);
      uint64_t v41 = v40[9];
      uint64_t v42 = &v29[v41];
      uint64_t v43 = &v30[v41];
      uint64_t v44 = type metadata accessor for SymmetricKey();
      uint64_t v45 = *(void (**)(char *, char *, uint64_t))(*(void *)(v44 - 8) + 16);
      v45(v42, v43, v44);
      v45(&v29[v40[10]], &v30[v40[10]], v44);
      v45(&v29[v40[11]], &v30[v40[11]], v44);
      goto LABEL_22;
    case 2u:
      uint64_t v46 = type metadata accessor for SHA384();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 16))(v29, v30, v46);
      uint64_t v47 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.MasterSecret);
      uint64_t v48 = v47[9];
      uint64_t v49 = &v29[v48];
      int v50 = &v30[v48];
      uint64_t v51 = type metadata accessor for SymmetricKey();
      uint64_t v52 = *(void (**)(char *, char *, uint64_t))(*(void *)(v51 - 8) + 16);
      v52(v49, v50, v51);
      v52(&v29[v47[10]], &v30[v47[10]], v51);
      v52(&v29[v47[11]], &v30[v47[11]], v51);
      v52(&v29[v47[12]], &v30[v47[12]], v51);
      v52(&v29[v47[13]], &v30[v47[13]], v51);
      v52(&v29[v47[14]], &v30[v47[14]], v51);
      goto LABEL_22;
    case 3u:
      uint64_t v53 = type metadata accessor for SymmetricKey();
      uint64_t v54 = *(void (**)(char *, char *, uint64_t))(*(void *)(v53 - 8) + 16);
      v54(v29, v30, v53);
      uint64_t v55 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.AllSecrets);
      v54(&v29[v55[9]], &v30[v55[9]], v53);
      v54(&v29[v55[10]], &v30[v55[10]], v53);
      v54(&v29[v55[11]], &v30[v55[11]], v53);
LABEL_22:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(v29, v30, *(void *)(*(void *)(v31 - 8) + 64));
      break;
  }
  return a1;
}

uint64_t assignWithCopy for HandshakeState.ServerCertificateVerifyState(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (long long *)(a1 + 24);
  unint64_t v7 = (long long *)(a2 + 24);
  unint64_t v8 = *(void *)(a2 + 32);
  if (*(void *)(a1 + 32) >> 60 == 15)
  {
    if (v8 >> 60 == 15)
    {
      long long v9 = *v7;
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      long long *v6 = v9;
      goto LABEL_9;
    }
    uint64_t v11 = *(void *)(a2 + 24);
    outlined copy of Data._Representation(v11, *(void *)(a2 + 32));
    *(void *)(a1 + 24) = v11;
    *(void *)(a1 + 32) = v8;
  }
  else
  {
    if (v8 >> 60 == 15)
    {
      outlined destroy of ByteBuffer(a1 + 24);
      uint64_t v10 = *(void *)(a2 + 40);
      long long *v6 = *v7;
      *(void *)(a1 + 40) = v10;
      goto LABEL_9;
    }
    uint64_t v12 = *(void *)(a2 + 24);
    outlined copy of Data._Representation(v12, *(void *)(a2 + 32));
    uint64_t v13 = *(void *)(a1 + 24);
    unint64_t v14 = *(void *)(a1 + 32);
    *(void *)(a1 + 24) = v12;
    *(void *)(a1 + 32) = v8;
    outlined consume of Data._Representation(v13, v14);
  }
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
LABEL_9:
  uint64_t v15 = (long long *)(a1 + 48);
  uint64_t v16 = (long long *)(a2 + 48);
  unint64_t v17 = *(void *)(a2 + 56);
  if (*(void *)(a1 + 56) >> 60 == 15)
  {
    if (v17 >> 60 == 15)
    {
      long long v18 = *v16;
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      long long *v15 = v18;
      goto LABEL_17;
    }
    uint64_t v20 = *(void *)(a2 + 48);
    outlined copy of Data._Representation(v20, *(void *)(a2 + 56));
    *(void *)(a1 + 48) = v20;
    *(void *)(a1 + 56) = v17;
  }
  else
  {
    if (v17 >> 60 == 15)
    {
      outlined destroy of ByteBuffer(a1 + 48);
      uint64_t v19 = *(void *)(a2 + 64);
      long long *v15 = *v16;
      *(void *)(a1 + 64) = v19;
      goto LABEL_17;
    }
    uint64_t v21 = *(void *)(a2 + 48);
    outlined copy of Data._Representation(v21, *(void *)(a2 + 56));
    uint64_t v22 = *(void *)(a1 + 48);
    unint64_t v23 = *(void *)(a1 + 56);
    *(void *)(a1 + 48) = v21;
    *(void *)(a1 + 56) = v17;
    outlined consume of Data._Representation(v22, v23);
  }
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
LABEL_17:
  __int16 v24 = *(_WORD *)(a2 + 72);
  *(unsigned char *)(a1 + 74) = *(unsigned char *)(a2 + 74);
  *(_WORD *)(a1 + 72) = v24;
  *(unsigned char *)(a1 + 75) = *(unsigned char *)(a2 + 75);
  *(_WORD *)(a1 + 76) = *(_WORD *)(a2 + 76);
  *(_WORD *)(a1 + 78) = *(_WORD *)(a2 + 78);
  uint64_t v25 = a3[7];
  unint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (void *)(a2 + v25);
  uint64_t v28 = type metadata accessor for P256.Signing.PublicKey();
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v29 + 48);
  int v31 = v30(v26, 1, v28);
  int v32 = v30(v27, 1, v28);
  if (v31)
  {
    if (!v32)
    {
      (*(void (**)(void *, void *, uint64_t))(v29 + 16))(v26, v27, v28);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if (v32)
  {
    (*(void (**)(void *, uint64_t))(v29 + 8))(v26, v28);
LABEL_22:
    uint64_t v33 = type metadata accessor for PeerCertificateBundle.Bundle(0);
    memcpy(v26, v27, *(void *)(*(void *)(v33 - 8) + 64));
    goto LABEL_23;
  }
  (*(void (**)(void *, void *, uint64_t))(v29 + 24))(v26, v27, v28);
LABEL_23:
  uint64_t v34 = a3[8];
  uint64_t v35 = a1 + v34;
  unint64_t v36 = (uint64_t *)(a2 + v34);
  unint64_t v37 = *(void *)(a2 + v34 + 8);
  if (*(void *)(a1 + v34 + 8) >> 60 == 15)
  {
    if (v37 >> 60 == 15)
    {
      long long v38 = *(_OWORD *)v36;
      *(void *)(v35 + 16) = v36[2];
      *(_OWORD *)uint64_t v35 = v38;
      goto LABEL_32;
    }
    uint64_t v40 = *v36;
    outlined copy of Data._Representation(*v36, v37);
    *(void *)uint64_t v35 = v40;
    *(void *)(v35 + 8) = v37;
    goto LABEL_30;
  }
  if (v37 >> 60 != 15)
  {
    uint64_t v41 = *v36;
    outlined copy of Data._Representation(*v36, v37);
    uint64_t v42 = *(void *)v35;
    unint64_t v43 = *(void *)(v35 + 8);
    *(void *)uint64_t v35 = v41;
    *(void *)(v35 + 8) = v37;
    outlined consume of Data._Representation(v42, v43);
LABEL_30:
    uint64_t v39 = v36[2];
    goto LABEL_31;
  }
  outlined destroy of ByteBuffer(v35);
  uint64_t v39 = v36[2];
  *(_OWORD *)uint64_t v35 = *(_OWORD *)v36;
LABEL_31:
  *(void *)(v35 + 16) = v39;
LABEL_32:
  uint64_t v44 = a3[9];
  uint64_t v45 = a1 + v44;
  uint64_t v46 = (uint64_t *)(a2 + v44);
  unint64_t v47 = *(void *)(a2 + v44 + 8);
  if (*(void *)(a1 + v44 + 8) >> 60 == 15)
  {
    if (v47 >> 60 == 15)
    {
      long long v48 = *(_OWORD *)v46;
      *(void *)(v45 + 16) = v46[2];
      *(_OWORD *)uint64_t v45 = v48;
      goto LABEL_41;
    }
    uint64_t v50 = *v46;
    outlined copy of Data._Representation(*v46, v47);
    *(void *)uint64_t v45 = v50;
    *(void *)(v45 + 8) = v47;
    goto LABEL_39;
  }
  if (v47 >> 60 != 15)
  {
    uint64_t v51 = *v46;
    outlined copy of Data._Representation(*v46, v47);
    uint64_t v52 = *(void *)v45;
    unint64_t v53 = *(void *)(v45 + 8);
    *(void *)uint64_t v45 = v51;
    *(void *)(v45 + 8) = v47;
    outlined consume of Data._Representation(v52, v53);
LABEL_39:
    uint64_t v49 = v46[2];
    goto LABEL_40;
  }
  outlined destroy of ByteBuffer(v45);
  uint64_t v49 = v46[2];
  *(_OWORD *)uint64_t v45 = *(_OWORD *)v46;
LABEL_40:
  *(void *)(v45 + 16) = v49;
LABEL_41:
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  if (a1 != a2)
  {
    uint64_t v54 = a3[11];
    uint64_t v55 = (char *)(a1 + v54);
    uint64_t v56 = (char *)(a2 + v54);
    outlined destroy of HandshakeStateMachine?(a1 + v54, &demangling cache variable for type metadata for SessionKeyManager<SHA384>.State);
    uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v58 = type metadata accessor for SHA384();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v58 - 8) + 16))(v55, v56, v58);
        uint64_t v59 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.EarlySecret);
        uint64_t v60 = v59[9];
        uint64_t v61 = &v55[v60];
        uint64_t v62 = &v56[v60];
        uint64_t v63 = type metadata accessor for SymmetricKey();
        uint64_t v64 = *(void (**)(char *, char *, uint64_t))(*(void *)(v63 - 8) + 16);
        v64(v61, v62, v63);
        v64(&v55[v59[10]], &v56[v59[10]], v63);
        v64(&v55[v59[11]], &v56[v59[11]], v63);
        v64(&v55[v59[12]], &v56[v59[12]], v63);
        goto LABEL_49;
      case 1u:
        uint64_t v65 = type metadata accessor for SHA384();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v65 - 8) + 16))(v55, v56, v65);
        uint64_t v66 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.HandshakeSecret);
        uint64_t v67 = v66[9];
        uint64_t v68 = &v55[v67];
        unint64_t v69 = &v56[v67];
        uint64_t v70 = type metadata accessor for SymmetricKey();
        uint64_t v71 = *(void (**)(char *, char *, uint64_t))(*(void *)(v70 - 8) + 16);
        v71(v68, v69, v70);
        v71(&v55[v66[10]], &v56[v66[10]], v70);
        v71(&v55[v66[11]], &v56[v66[11]], v70);
        goto LABEL_49;
      case 2u:
        uint64_t v72 = type metadata accessor for SHA384();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v72 - 8) + 16))(v55, v56, v72);
        uint64_t v73 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.MasterSecret);
        uint64_t v74 = v73[9];
        uint64_t v75 = &v55[v74];
        uint64_t v76 = &v56[v74];
        uint64_t v77 = type metadata accessor for SymmetricKey();
        v78 = *(void (**)(char *, char *, uint64_t))(*(void *)(v77 - 8) + 16);
        v78(v75, v76, v77);
        v78(&v55[v73[10]], &v56[v73[10]], v77);
        v78(&v55[v73[11]], &v56[v73[11]], v77);
        v78(&v55[v73[12]], &v56[v73[12]], v77);
        v78(&v55[v73[13]], &v56[v73[13]], v77);
        v78(&v55[v73[14]], &v56[v73[14]], v77);
        goto LABEL_49;
      case 3u:
        uint64_t v79 = type metadata accessor for SymmetricKey();
        uint64_t v80 = *(void (**)(char *, char *, uint64_t))(*(void *)(v79 - 8) + 16);
        v80(v55, v56, v79);
        v81 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.AllSecrets);
        v80(&v55[v81[9]], &v56[v81[9]], v79);
        v80(&v55[v81[10]], &v56[v81[10]], v79);
        v80(&v55[v81[11]], &v56[v81[11]], v79);
LABEL_49:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v55, v56, *(void *)(*(void *)(v57 - 8) + 64));
        break;
    }
  }
  return a1;
}

uint64_t initializeWithTake for HandshakeState.ServerCertificateVerifyState(uint64_t a1, long long *a2, int *a3)
{
  long long v6 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v6;
  *(_OWORD *)(a1 + 60) = *(long long *)((char *)a2 + 60);
  long long v8 = *a2;
  long long v7 = a2[1];
  *(_DWORD *)(a1 + 76) = *((_DWORD *)a2 + 19);
  uint64_t v9 = a3[7];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (char *)a2 + v9;
  *(_OWORD *)a1 = v8;
  *(_OWORD *)(a1 + 16) = v7;
  uint64_t v12 = type metadata accessor for P256.Signing.PublicKey();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    uint64_t v14 = type metadata accessor for PeerCertificateBundle.Bundle(0);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  uint64_t v15 = a3[8];
  uint64_t v16 = a3[9];
  uint64_t v17 = a1 + v15;
  long long v18 = (long long *)((char *)a2 + v15);
  long long v19 = *v18;
  *(void *)(v17 + 16) = *((void *)v18 + 2);
  *(_OWORD *)uint64_t v17 = v19;
  uint64_t v20 = a1 + v16;
  uint64_t v21 = (uint64_t)a2 + v16;
  *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
  *(void *)(v20 + 16) = *(void *)(v21 + 16);
  uint64_t v22 = a3[11];
  *(unsigned char *)(a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  unint64_t v23 = (char *)(a1 + v22);
  __int16 v24 = (char *)a2 + v22;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v26 = type metadata accessor for SHA384();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(v23, v24, v26);
      uint64_t v27 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.EarlySecret);
      uint64_t v28 = v27[9];
      uint64_t v29 = &v23[v28];
      uint64_t v30 = &v24[v28];
      uint64_t v31 = type metadata accessor for SymmetricKey();
      int v32 = *(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 32);
      v32(v29, v30, v31);
      v32(&v23[v27[10]], &v24[v27[10]], v31);
      v32(&v23[v27[11]], &v24[v27[11]], v31);
      v32(&v23[v27[12]], &v24[v27[12]], v31);
      goto LABEL_10;
    case 1u:
      uint64_t v33 = type metadata accessor for SHA384();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 32))(v23, v24, v33);
      uint64_t v34 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.HandshakeSecret);
      uint64_t v35 = v34[9];
      unint64_t v36 = &v23[v35];
      unint64_t v37 = &v24[v35];
      uint64_t v38 = type metadata accessor for SymmetricKey();
      uint64_t v39 = *(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 32);
      v39(v36, v37, v38);
      v39(&v23[v34[10]], &v24[v34[10]], v38);
      v39(&v23[v34[11]], &v24[v34[11]], v38);
      goto LABEL_10;
    case 2u:
      uint64_t v40 = type metadata accessor for SHA384();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v40 - 8) + 32))(v23, v24, v40);
      uint64_t v41 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.MasterSecret);
      uint64_t v42 = v41[9];
      unint64_t v43 = &v23[v42];
      uint64_t v44 = &v24[v42];
      uint64_t v45 = type metadata accessor for SymmetricKey();
      uint64_t v46 = *(void (**)(char *, char *, uint64_t))(*(void *)(v45 - 8) + 32);
      v46(v43, v44, v45);
      v46(&v23[v41[10]], &v24[v41[10]], v45);
      v46(&v23[v41[11]], &v24[v41[11]], v45);
      v46(&v23[v41[12]], &v24[v41[12]], v45);
      v46(&v23[v41[13]], &v24[v41[13]], v45);
      v46(&v23[v41[14]], &v24[v41[14]], v45);
      goto LABEL_10;
    case 3u:
      uint64_t v47 = type metadata accessor for SymmetricKey();
      long long v48 = *(void (**)(char *, char *, uint64_t))(*(void *)(v47 - 8) + 32);
      v48(v23, v24, v47);
      uint64_t v49 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.AllSecrets);
      v48(&v23[v49[9]], &v24[v49[9]], v47);
      v48(&v23[v49[10]], &v24[v49[10]], v47);
      v48(&v23[v49[11]], &v24[v49[11]], v47);
LABEL_10:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(v23, v24, *(void *)(*(void *)(v25 - 8) + 64));
      break;
  }
  return a1;
}

uint64_t assignWithTake for HandshakeState.ServerCertificateVerifyState(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  unint64_t v7 = *(void *)(a1 + 32);
  if (v7 >> 60 == 15) {
    goto LABEL_4;
  }
  unint64_t v8 = *(void *)(a2 + 32);
  if (v8 >> 60 == 15)
  {
    outlined destroy of ByteBuffer(a1 + 24);
LABEL_4:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    goto LABEL_6;
  }
  uint64_t v9 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v8;
  outlined consume of Data._Representation(v9, v7);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
LABEL_6:
  unint64_t v10 = *(void *)(a1 + 56);
  if (v10 >> 60 == 15)
  {
LABEL_9:
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    goto LABEL_11;
  }
  unint64_t v11 = *(void *)(a2 + 56);
  if (v11 >> 60 == 15)
  {
    outlined destroy of ByteBuffer(a1 + 48);
    goto LABEL_9;
  }
  uint64_t v12 = *(void *)(a1 + 48);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v11;
  outlined consume of Data._Representation(v12, v10);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
LABEL_11:
  *(_WORD *)(a1 + 72) = *(_WORD *)(a2 + 72);
  *(unsigned char *)(a1 + 74) = *(unsigned char *)(a2 + 74);
  *(unsigned char *)(a1 + 75) = *(unsigned char *)(a2 + 75);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  uint64_t v16 = type metadata accessor for P256.Signing.PublicKey();
  uint64_t v17 = *(void *)(v16 - 8);
  long long v18 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v17 + 48);
  int v19 = v18(v14, 1, v16);
  int v20 = v18(v15, 1, v16);
  if (v19)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v17 + 32))(v14, v15, v16);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (v20)
  {
    (*(void (**)(void *, uint64_t))(v17 + 8))(v14, v16);
LABEL_16:
    uint64_t v21 = type metadata accessor for PeerCertificateBundle.Bundle(0);
    memcpy(v14, v15, *(void *)(*(void *)(v21 - 8) + 64));
    goto LABEL_17;
  }
  (*(void (**)(void *, void *, uint64_t))(v17 + 40))(v14, v15, v16);
LABEL_17:
  uint64_t v22 = a3[8];
  uint64_t v23 = a1 + v22;
  uint64_t v24 = a2 + v22;
  unint64_t v25 = *(void *)(a1 + v22 + 8);
  if (v25 >> 60 == 15)
  {
LABEL_20:
    *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
    goto LABEL_22;
  }
  unint64_t v26 = *(void *)(v24 + 8);
  if (v26 >> 60 == 15)
  {
    outlined destroy of ByteBuffer(v23);
    goto LABEL_20;
  }
  uint64_t v27 = *(void *)v23;
  *(void *)uint64_t v23 = *(void *)v24;
  *(void *)(v23 + 8) = v26;
  outlined consume of Data._Representation(v27, v25);
LABEL_22:
  *(void *)(v23 + 16) = *(void *)(v24 + 16);
  uint64_t v28 = a3[9];
  uint64_t v29 = a1 + v28;
  uint64_t v30 = a2 + v28;
  unint64_t v31 = *(void *)(a1 + v28 + 8);
  if (v31 >> 60 == 15)
  {
LABEL_25:
    *(_OWORD *)uint64_t v29 = *(_OWORD *)v30;
    goto LABEL_27;
  }
  unint64_t v32 = *(void *)(v30 + 8);
  if (v32 >> 60 == 15)
  {
    outlined destroy of ByteBuffer(v29);
    goto LABEL_25;
  }
  uint64_t v33 = *(void *)v29;
  *(void *)uint64_t v29 = *(void *)v30;
  *(void *)(v29 + 8) = v32;
  outlined consume of Data._Representation(v33, v31);
LABEL_27:
  *(void *)(v29 + 16) = *(void *)(v30 + 16);
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  if (a1 != a2)
  {
    uint64_t v34 = a3[11];
    uint64_t v35 = (char *)(a1 + v34);
    unint64_t v36 = (char *)(a2 + v34);
    outlined destroy of HandshakeStateMachine?(a1 + v34, &demangling cache variable for type metadata for SessionKeyManager<SHA384>.State);
    uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v38 = type metadata accessor for SHA384();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 32))(v35, v36, v38);
        uint64_t v39 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.EarlySecret);
        uint64_t v40 = v39[9];
        uint64_t v41 = &v35[v40];
        uint64_t v42 = &v36[v40];
        uint64_t v43 = type metadata accessor for SymmetricKey();
        uint64_t v44 = *(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 32);
        v44(v41, v42, v43);
        v44(&v35[v39[10]], &v36[v39[10]], v43);
        v44(&v35[v39[11]], &v36[v39[11]], v43);
        v44(&v35[v39[12]], &v36[v39[12]], v43);
        goto LABEL_35;
      case 1u:
        uint64_t v45 = type metadata accessor for SHA384();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v45 - 8) + 32))(v35, v36, v45);
        uint64_t v46 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.HandshakeSecret);
        uint64_t v47 = v46[9];
        long long v48 = &v35[v47];
        uint64_t v49 = &v36[v47];
        uint64_t v50 = type metadata accessor for SymmetricKey();
        uint64_t v51 = *(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 32);
        v51(v48, v49, v50);
        v51(&v35[v46[10]], &v36[v46[10]], v50);
        v51(&v35[v46[11]], &v36[v46[11]], v50);
        goto LABEL_35;
      case 2u:
        uint64_t v52 = type metadata accessor for SHA384();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v52 - 8) + 32))(v35, v36, v52);
        unint64_t v53 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.MasterSecret);
        uint64_t v54 = v53[9];
        uint64_t v55 = &v35[v54];
        uint64_t v56 = &v36[v54];
        uint64_t v57 = type metadata accessor for SymmetricKey();
        uint64_t v58 = *(void (**)(char *, char *, uint64_t))(*(void *)(v57 - 8) + 32);
        v58(v55, v56, v57);
        v58(&v35[v53[10]], &v36[v53[10]], v57);
        v58(&v35[v53[11]], &v36[v53[11]], v57);
        v58(&v35[v53[12]], &v36[v53[12]], v57);
        v58(&v35[v53[13]], &v36[v53[13]], v57);
        v58(&v35[v53[14]], &v36[v53[14]], v57);
        goto LABEL_35;
      case 3u:
        uint64_t v59 = type metadata accessor for SymmetricKey();
        uint64_t v60 = *(void (**)(char *, char *, uint64_t))(*(void *)(v59 - 8) + 32);
        v60(v35, v36, v59);
        uint64_t v61 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>.State.AllSecrets);
        v60(&v35[v61[9]], &v36[v61[9]], v59);
        v60(&v35[v61[10]], &v36[v61[10]], v59);
        v60(&v35[v61[11]], &v36[v61[11]], v59);
LABEL_35:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v35, v36, *(void *)(*(void *)(v37 - 8) + 64));
        break;
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for HandshakeState.ReadyState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B5761684);
}

uint64_t __swift_get_extra_inhabitant_index_21Tm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for PeerCertificateBundle(0);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 28);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 44);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for HandshakeState.ReadyState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B57617CC);
}

uint64_t __swift_store_extra_inhabitant_index_22Tm(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for PeerCertificateBundle(0);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 28);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionKeyManager<SHA384>);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 44);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void type metadata completion function for HandshakeState.ServerCertificateVerifyState()
{
  type metadata accessor for PeerCertificateBundle.Bundle(319);
  if (v0 <= 0x3F)
  {
    type metadata accessor for SessionKeyManager<SHA384>.State();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t lazy protocol witness table accessor for type SharedSecret and conformance SharedSecret(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type HashedAuthenticationCode<SHA384> and conformance HashedAuthenticationCode<A>(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t partial apply for specialized closure #1 in static HKDF.extract(inputKeyMaterial:salt:)()
{
  return specialized closure #1 in static HKDF.extract(inputKeyMaterial:salt:)();
}

uint64_t outlined retain of ClientHello(uint64_t a1)
{
  return a1;
}

uint64_t closure #1 in static HMAC.authenticationCode<A>(bytes:using:)specialized partial apply()
{
  return partial apply for specialized closure #1 in static HMAC.authenticationCode<A>(bytes:using:)();
}

uint64_t closure #1 in static HKDF.extract(inputKeyMaterial:salt:)specialized partial apply()
{
  return partial apply for specialized closure #1 in static HKDF.extract(inputKeyMaterial:salt:)();
}

uint64_t closure #1 in static HKDF.expandLabel<A, B>(secret:label:context:length:)partial apply(uint64_t a1, char *a2)
{
  return partial apply for closure #1 in static HKDF.expandLabel<A, B>(secret:label:context:length:)(a1, a2);
}

uint64_t HandshakeStateMachine.Configuration.serverName.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HandshakeStateMachine.Configuration.serverName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t HandshakeStateMachine.Configuration.validPublicKeys.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t HandshakeStateMachine.Configuration.validPublicKeys.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*HandshakeStateMachine.Configuration.validPublicKeys.modify())()
{
  return CertificateVerify.algorithm.getter;
}

uint64_t HandshakeStateMachine.Configuration.quicTransportParameters.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  outlined copy of ByteBuffer?(v1, *(void *)(v0 + 32));
  return v1;
}

uint64_t HandshakeStateMachine.Configuration.quicTransportParameters.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = outlined consume of ByteBuffer?(v3[3], v3[4]);
  v3[3] = a1;
  v3[4] = a2;
  v3[5] = a3;
  return result;
}

uint64_t HandshakeStateMachine.Configuration.alpn.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  outlined copy of ByteBuffer?(v1, *(void *)(v0 + 56));
  return v1;
}

uint64_t HandshakeStateMachine.Configuration.alpn.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = outlined consume of ByteBuffer?(v3[6], v3[7]);
  v3[6] = a1;
  v3[7] = a2;
  v3[8] = a3;
  return result;
}

uint64_t (*HandshakeStateMachine.Configuration.alpn.modify())()
{
  return CertificateVerify.algorithm.getter;
}

uint64_t HandshakeStateMachine.Configuration.ticketRequest.getter()
{
  return *(unsigned __int16 *)(v0 + 72) | (*(unsigned __int8 *)(v0 + 74) << 16);
}

uint64_t HandshakeStateMachine.Configuration.ticketRequest.setter(uint64_t result)
{
  *(_WORD *)(v1 + 72) = result;
  *(unsigned char *)(v1 + 74) = BYTE2(result) & 1;
  return result;
}

uint64_t (*HandshakeStateMachine.Configuration.ticketRequest.modify())()
{
  return CertificateVerify.algorithm.getter;
}

uint64_t HandshakeStateMachine.Configuration.useX25519KeyExchange.getter()
{
  return *(unsigned __int8 *)(v0 + 75);
}

uint64_t HandshakeStateMachine.Configuration.useX25519KeyExchange.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 75) = result;
  return result;
}

uint64_t (*HandshakeStateMachine.Configuration.useX25519KeyExchange.modify())()
{
  return CertificateVerify.algorithm.getter;
}

uint64_t HandshakeStateMachine.Configuration.init(serverName:validPublicKeys:quicTransportParameters:alpn:ticketRequest:useX25519KeyExchange:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, __int16 a11, char a12, char a13, char a14)
{
  *(void *)a9 = result;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = a7;
  *(void *)(a9 + 56) = a8;
  *(void *)(a9 + 64) = a10;
  *(_WORD *)(a9 + 72) = a11;
  *(unsigned char *)(a9 + 74) = a12 & 1;
  *(unsigned char *)(a9 + 75) = a14;
  return result;
}

void HandshakeStateMachine.Configuration.hash(into:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for P256.Signing.PublicKey();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v47 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for P256.Signing.PublicKey?);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v2[1])
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  uint64_t v41 = v2;
  uint64_t v10 = v2[2];
  uint64_t v48 = a1;
  uint64_t v49 = v10;
  uint64_t v11 = *(void *)(v10 + 16);
  if (v11)
  {
    uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    uint64_t v14 = v10 + ((*(unsigned __int8 *)(v12 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 64));
    uint64_t v15 = *(void *)(v12 + 56);
    uint64_t v16 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 40);
    uint64_t v45 = (unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 32);
    uint64_t v46 = v13;
    uint64_t v43 = (uint64_t (**)(char *, char *, uint64_t))(v12 + 16);
    uint64_t v44 = v15;
    uint64_t v42 = (void (**)(char *, uint64_t))(v12 - 8);
    swift_bridgeObjectRetain();
    unint64_t v40 = (v12 + 40) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    uint64_t v17 = v47;
    while (1)
    {
      v46(v9, v14, v4);
      long long v18 = *v16;
      (*v16)(v9, 0, 1, v4);
      if ((*v45)(v9, 1, v4) == 1) {
        break;
      }
      uint64_t v19 = (*v43)(v17, v9, v4);
      uint64_t v20 = MEMORY[0x1BA99E450](v19);
      uint64_t v21 = v12;
      unint64_t v23 = v22;
      Data.hash(into:)();
      unint64_t v24 = v23;
      uint64_t v12 = v21;
      outlined consume of Data._Representation(v20, v24);
      (*v42)(v17, v4);
      v14 += v44;
      if (!--v11) {
        goto LABEL_10;
      }
    }
  }
  else
  {
    long long v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
    swift_bridgeObjectRetain();
LABEL_10:
    v18(v9, 1, 1, v4);
  }
  outlined release of [Extension]((uint64_t)&v49);
  unint64_t v25 = v41;
  unint64_t v26 = v41[4];
  if (v26 >> 60 == 15)
  {
    Hasher._combine(_:)(0);
  }
  else
  {
    uint64_t v27 = v41[3];
    uint64_t v28 = v41[5];
    Hasher._combine(_:)(1u);
    uint64_t v29 = 0;
    switch(v26 >> 62)
    {
      case 1uLL:
        uint64_t v29 = v27 >> 32;
        goto LABEL_17;
      case 2uLL:
        uint64_t v29 = *(void *)(v27 + 24);
LABEL_17:
        outlined copy of Data._Representation(v27, v26);
        outlined copy of Data._Representation(v27, v26);
        break;
      case 3uLL:
        break;
      default:
        uint64_t v29 = BYTE6(v26);
        break;
    }
    if (v29 < v28)
    {
      __break(1u);
      goto LABEL_30;
    }
    uint64_t v30 = Data._Representation.subscript.getter();
    unint64_t v32 = v31;
    Data.hash(into:)();
    outlined consume of Data._Representation(v30, v32);
    outlined consume of ByteBuffer?(v27, v26);
    outlined consume of ByteBuffer?(v27, v26);
  }
  unint64_t v33 = v25[7];
  if (v33 >> 60 == 15)
  {
    Hasher._combine(_:)(0);
    return;
  }
  uint64_t v34 = v25[6];
  uint64_t v35 = v25[8];
  Hasher._combine(_:)(1u);
  uint64_t v36 = 0;
  switch(v33 >> 62)
  {
    case 1uLL:
      uint64_t v36 = v34 >> 32;
      goto LABEL_26;
    case 2uLL:
      uint64_t v36 = *(void *)(v34 + 24);
LABEL_26:
      outlined copy of Data._Representation(v34, v33);
      outlined copy of Data._Representation(v34, v33);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v36 = BYTE6(v33);
      break;
  }
  if (v36 < v35)
  {
LABEL_30:
    __break(1u);
    JUMPOUT(0x1B576229CLL);
  }
  uint64_t v37 = Data._Representation.subscript.getter();
  unint64_t v39 = v38;
  Data.hash(into:)();
  outlined consume of Data._Representation(v37, v39);
  outlined consume of ByteBuffer?(v34, v33);
  outlined consume of ByteBuffer?(v34, v33);
}

Swift::Int HandshakeStateMachine.Configuration.hashValue.getter()
{
  Hasher.init(_seed:)();
  HandshakeStateMachine.Configuration.hash(into:)((uint64_t)v1);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance HandshakeStateMachine.Configuration()
{
  Hasher.init(_seed:)();
  HandshakeStateMachine.Configuration.hash(into:)((uint64_t)v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance HandshakeStateMachine.Configuration(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[3];
  v7[2] = a1[2];
  v8[0] = v2;
  *(_OWORD *)((char *)v8 + 12) = *(_OWORD *)((char *)a1 + 60);
  long long v3 = a1[1];
  v7[0] = *a1;
  v7[1] = v3;
  long long v4 = a2[3];
  v9[2] = a2[2];
  v10[0] = v4;
  *(_OWORD *)((char *)v10 + 12) = *(_OWORD *)((char *)a2 + 60);
  long long v5 = a2[1];
  v9[0] = *a2;
  v9[1] = v5;
  return specialized static HandshakeStateMachine.Configuration.== infix(_:_:)(v7, v9) & 1;
}

uint64_t closure #1 in static Data.== infix(_:_:)@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      outlined copy of Data._Representation(a2, a3);
      uint64_t v10 = (char *)__DataStorage._bytes.getter();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = __DataStorage._offset.getter();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = __DataStorage._length.getter();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x1B57625FCLL);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = outlined consume of Data._Representation(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      uint64_t v17 = (char *)__DataStorage._bytes.getter();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = __DataStorage._offset.getter();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = __DataStorage._length.getter();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t specialized static HandshakeStateMachine.Configuration.== infix(_:_:)(void *a1, void *a2)
{
  v137[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (P256.Signing.PublicKey, P256.Signing.PublicKey));
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  BOOL v8 = (char *)&v102 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x1F4188790](v6);
  uint64_t v11 = (char *)&v102 - v10;
  MEMORY[0x1F4188790](v9);
  size_t v13 = (char *)&v102 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for P256.Signing.PublicKey?);
  uint64_t v15 = MEMORY[0x1F4188790](v14 - 8);
  uint64_t v17 = (char *)&v102 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  BOOL v19 = (char *)&v102 - v18;
  uint64_t v20 = type metadata accessor for P256.Signing.PublicKey();
  unint64_t v130 = *(void *)(v20 - 8);
  uint64_t v21 = MEMORY[0x1F4188790](v20);
  v131 = (char *)&v102 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v21);
  v133 = (char *)&v102 - v23;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (P256.Signing.PublicKey, P256.Signing.PublicKey)?);
  MEMORY[0x1F4188790](v24 - 8);
  v132 = (char *)&v102 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = a1[1];
  uint64_t v27 = a2[1];
  if (v26)
  {
    if (!v27) {
      return 0;
    }
    if (*a1 != *a2 || v26 != v27)
    {
      char v28 = _stringCompareWithSmolCheck(_:_:expecting:)();
      uint64_t result = 0;
      if ((v28 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v27)
  {
    return 0;
  }
  v125 = v17;
  v126 = v13;
  v128 = v19;
  v129 = v8;
  v122 = v11;
  uint64_t v120 = v5;
  uint64_t v127 = v4;
  uint64_t v30 = a1[3];
  unint64_t v31 = a1[4];
  uint64_t v32 = a1[5];
  uint64_t v34 = a2[3];
  unint64_t v33 = a2[4];
  uint64_t v35 = a2[5];
  if (v31 >> 60 == 15)
  {
    if (v33 >> 60 == 15) {
      goto LABEL_14;
    }
LABEL_12:
    outlined copy of ByteBuffer?(a1[3], a1[4]);
    outlined copy of ByteBuffer?(v34, v33);
    outlined consume of ByteBuffer?(v30, v31);
    outlined consume of ByteBuffer?(v34, v33);
    return 0;
  }
  if (v33 >> 60 == 15) {
    goto LABEL_12;
  }
  outlined copy of ByteBuffer?(a1[3], a1[4]);
  outlined copy of ByteBuffer?(v34, v33);
  char v36 = specialized static ByteBuffer.== infix(_:_:)(v30, v31, v32, v34, v33, v35);
  outlined consume of ByteBuffer?(v34, v33);
  outlined consume of ByteBuffer?(v30, v31);
  if ((v36 & 1) == 0) {
    return 0;
  }
LABEL_14:
  uint64_t v37 = a1[6];
  unint64_t v38 = a1[7];
  uint64_t v39 = a1[8];
  uint64_t v40 = a2[6];
  unint64_t v41 = a2[7];
  uint64_t v42 = a2[8];
  if (v38 >> 60 == 15)
  {
    if (v41 >> 60 == 15) {
      goto LABEL_20;
    }
LABEL_18:
    outlined copy of ByteBuffer?(a1[6], a1[7]);
    outlined copy of ByteBuffer?(v40, v41);
    outlined consume of ByteBuffer?(v37, v38);
    outlined consume of ByteBuffer?(v40, v41);
    return 0;
  }
  if (v41 >> 60 == 15) {
    goto LABEL_18;
  }
  outlined copy of ByteBuffer?(a1[6], a1[7]);
  outlined copy of ByteBuffer?(v40, v41);
  char v43 = specialized static ByteBuffer.== infix(_:_:)(v37, v38, v39, v40, v41, v42);
  outlined consume of ByteBuffer?(v40, v41);
  outlined consume of ByteBuffer?(v37, v38);
  if ((v43 & 1) == 0) {
    return 0;
  }
LABEL_20:
  uint64_t v44 = a1[2];
  uint64_t v45 = a2[2];
  uint64_t v136 = v45;
  v137[0] = v44;
  uint64_t v112 = v44;
  uint64_t v46 = *(void *)(v44 + 16);
  outlined retain of [Extension]((uint64_t)v137);
  outlined retain of [Extension]((uint64_t)&v136);
  outlined retain of [Extension]((uint64_t)v137);
  outlined retain of [Extension]((uint64_t)&v136);
  uint64_t v111 = v46;
  if (!v46)
  {
    v119 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v130 + 56);
    unint64_t v130 = (v130 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    uint64_t v50 = v127;
LABEL_59:
    uint64_t v52 = (uint64_t)v128;
    v119(v128, 1, 1, v20);
LABEL_62:
    outlined destroy of HandshakeStateMachine?(v52, &demangling cache variable for type metadata for P256.Signing.PublicKey?);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v120 + 56))(v132, 1, 1, v50);
LABEL_63:
    outlined release of [Extension]((uint64_t)v137);
    outlined release of [Extension]((uint64_t)&v136);
    outlined release of [Extension]((uint64_t)v137);
    outlined release of [Extension]((uint64_t)&v136);
    return 1;
  }
  unint64_t v47 = 0;
  uint64_t v105 = 0;
  v124 = *(void (**)(void))(v130 + 16);
  unint64_t v48 = (*(unsigned __int8 *)(v130 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v130 + 80);
  uint64_t v106 = *(void *)(v130 + 72);
  unint64_t v123 = v130 + 16;
  uint64_t v49 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v130 + 56);
  v118 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v130 + 48);
  v117 = (void (**)(char *, uint64_t, uint64_t))(v130 + 32);
  v110 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v120 + 56);
  v109 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v120 + 48);
  v116 = (void (**)(char *, uint64_t))(v130 + 8);
  unint64_t v130 = (v130 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  uint64_t v51 = (uint64_t)v126;
  uint64_t v50 = v127;
  v108 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v123 + 40);
  uint64_t v107 = v45;
  uint64_t v121 = v20;
  while (2)
  {
    uint64_t v52 = (uint64_t)v128;
    ((void (*)(char *, unint64_t, uint64_t))v124)(v128, v112 + v48, v20);
    v119 = *v49;
    v119((char *)v52, 0, 1, v20);
    unint64_t v53 = *v118;
    if ((*v118)(v52, 1, v20) == 1) {
      goto LABEL_62;
    }
    uint64_t v54 = *v117;
    (*v117)(v133, v52, v20);
    unint64_t v55 = *(void *)(v45 + 16);
    if (v47 == v55)
    {
      uint64_t v52 = (uint64_t)v125;
      v119(v125, 1, 1, v20);
LABEL_61:
      (*v116)(v133, v20);
      goto LABEL_62;
    }
    if (v47 >= v55)
    {
      __break(1u);
LABEL_68:
      __break(1u);
LABEL_69:
      __break(1u);
LABEL_70:
      __break(1u);
LABEL_71:
      __break(1u);
LABEL_72:
      __break(1u);
LABEL_73:
      __break(1u);
LABEL_74:
      __break(1u);
LABEL_75:
      __break(1u);
    }
    uint64_t v52 = (uint64_t)v125;
    ((void (*)(char *, unint64_t, uint64_t))v124)(v125, v45 + v48, v20);
    v119((char *)v52, 0, 1, v20);
    if (v53(v52, 1, v20) == 1) {
      goto LABEL_61;
    }
    unint64_t v114 = v48;
    uint64_t v56 = v131;
    v54(v131, v52, v20);
    uint64_t v57 = (uint64_t)v132;
    uint64_t v58 = &v132[*(int *)(v50 + 48)];
    v54(v132, (uint64_t)v133, v20);
    v54(v58, (uint64_t)v56, v20);
    (*v110)(v57, 0, 1, v50);
    if ((*v109)(v57, 1, v50) == 1) {
      goto LABEL_63;
    }
    ++v47;
    outlined init with take of (P256.Signing.PublicKey, P256.Signing.PublicKey)(v57, v51);
    uint64_t v59 = *(int *)(v50 + 48);
    uint64_t v60 = v122;
    uint64_t v61 = &v122[v59];
    uint64_t v62 = v51 + v59;
    uint64_t v63 = v124;
    ((void (*)(char *, uint64_t, uint64_t))v124)(v122, v51, v20);
    v113 = v61;
    uint64_t v64 = ((uint64_t (*)(char *, uint64_t, uint64_t))v63)(v61, v62, v20);
    uint64_t v115 = MEMORY[0x1BA99E450](v64);
    unint64_t v66 = v65;
    uint64_t v67 = *v116;
    (*v116)(v60, v121);
    uint64_t v68 = &v129[*(int *)(v50 + 48)];
    v63();
    uint64_t v69 = v62;
    unint64_t v70 = v66;
    uint64_t v20 = v121;
    uint64_t v71 = ((uint64_t (*)(char *, uint64_t, uint64_t))v63)(v68, v69, v121);
    uint64_t v72 = v67;
    uint64_t v73 = MEMORY[0x1BA99E450](v71);
    unint64_t v75 = v74;
    v67(v68, v20);
    uint64_t v76 = 0;
    uint64_t v45 = v107;
    uint64_t v49 = v108;
    unint64_t v77 = v114;
    switch(v70 >> 62)
    {
      case 1uLL:
        LODWORD(v76) = HIDWORD(v115) - v115;
        if (__OFSUB__(HIDWORD(v115), v115)) {
          goto LABEL_68;
        }
        uint64_t v76 = (int)v76;
        break;
      case 2uLL:
        uint64_t v79 = *(void *)(v115 + 16);
        uint64_t v78 = *(void *)(v115 + 24);
        BOOL v80 = __OFSUB__(v78, v79);
        uint64_t v76 = v78 - v79;
        if (!v80) {
          break;
        }
        goto LABEL_69;
      case 3uLL:
        break;
      default:
        uint64_t v76 = BYTE6(v70);
        break;
    }
    switch(v75 >> 62)
    {
      case 1uLL:
        LODWORD(v81) = HIDWORD(v73) - v73;
        if (__OFSUB__(HIDWORD(v73), v73)) {
          goto LABEL_70;
        }
        uint64_t v81 = (int)v81;
LABEL_40:
        if (v76 == v81)
        {
          if (v76 < 1)
          {
LABEL_23:
            outlined consume of Data._Representation(v115, v70);
            outlined consume of Data._Representation(v73, v75);
            v72(v129, v20);
            v72(v113, v20);
            uint64_t v51 = (uint64_t)v126;
            outlined destroy of HandshakeStateMachine?((uint64_t)v126, &demangling cache variable for type metadata for (P256.Signing.PublicKey, P256.Signing.PublicKey));
          }
          else
          {
            switch(v70 >> 62)
            {
              case 1uLL:
                uint64_t v85 = v73;
                uint64_t v86 = (int)v115;
                uint64_t v104 = (v115 >> 32) - (int)v115;
                if (v115 >> 32 < (int)v115) {
                  goto LABEL_72;
                }
                unint64_t v103 = v70;
                outlined copy of Data._Representation(v115, v70);
                uint64_t v87 = __DataStorage._bytes.getter();
                if (!v87) {
                  goto LABEL_48;
                }
                uint64_t v88 = __DataStorage._offset.getter();
                if (__OFSUB__(v86, v88)) {
                  goto LABEL_74;
                }
                v87 += v86 - v88;
LABEL_48:
                __DataStorage._length.getter();
                uint64_t v89 = v105;
                closure #1 in static Data.== infix(_:_:)(v87, v85, v75, (char *)__s1);
                uint64_t v105 = v89;
                uint64_t v90 = v115;
                unint64_t v91 = v103;
                outlined consume of Data._Representation(v115, v103);
                outlined consume of Data._Representation(v90, v91);
                outlined consume of Data._Representation(v85, v75);
                char v92 = __s1[0];
                uint64_t v20 = v121;
                break;
              case 2uLL:
                uint64_t v104 = v73;
                unint64_t v103 = v70;
                uint64_t v93 = *(void *)(v115 + 16);
                uint64_t v102 = *(void *)(v115 + 24);
                swift_retain();
                swift_retain();
                uint64_t v94 = __DataStorage._bytes.getter();
                if (!v94) {
                  goto LABEL_52;
                }
                uint64_t v95 = __DataStorage._offset.getter();
                if (__OFSUB__(v93, v95)) {
                  goto LABEL_75;
                }
                v94 += v93 - v95;
LABEL_52:
                if (__OFSUB__(v102, v93)) {
                  goto LABEL_73;
                }
                __DataStorage._length.getter();
                uint64_t v96 = v94;
                uint64_t v97 = v104;
                uint64_t v98 = v105;
                closure #1 in static Data.== infix(_:_:)(v96, v104, v75, (char *)__s1);
                uint64_t v105 = v98;
                swift_release();
                uint64_t v99 = v115;
                swift_release();
                outlined consume of Data._Representation(v99, v103);
                outlined consume of Data._Representation(v97, v75);
                char v92 = __s1[0];
                break;
              case 3uLL:
                memset(__s1, 0, 14);
                uint64_t v84 = v115;
                goto LABEL_55;
              default:
                __s1[0] = v115;
                LOWORD(__s1[1]) = v70;
                BYTE2(__s1[1]) = BYTE2(v70);
                BYTE3(__s1[1]) = BYTE3(v70);
                BYTE4(__s1[1]) = BYTE4(v70);
                BYTE5(__s1[1]) = BYTE5(v70);
                uint64_t v84 = v115;
LABEL_55:
                uint64_t v100 = v73;
                uint64_t v104 = v73;
                uint64_t v101 = v105;
                closure #1 in static Data.== infix(_:_:)((uint64_t)__s1, v100, v75, &v134);
                uint64_t v105 = v101;
                outlined consume of Data._Representation(v84, v70);
                outlined consume of Data._Representation(v104, v75);
                char v92 = v134;
                break;
            }
            v72(v129, v20);
            v72(v113, v20);
            uint64_t v51 = (uint64_t)v126;
            outlined destroy of HandshakeStateMachine?((uint64_t)v126, &demangling cache variable for type metadata for (P256.Signing.PublicKey, P256.Signing.PublicKey));
            if ((v92 & 1) == 0) {
              goto LABEL_65;
            }
          }
          unint64_t v48 = v77 + v106;
          uint64_t v50 = v127;
          if (v111 == v47) {
            goto LABEL_59;
          }
          continue;
        }
LABEL_64:
        outlined consume of Data._Representation(v115, v70);
        outlined consume of Data._Representation(v73, v75);
        v72(v129, v20);
        v72(v113, v20);
        outlined destroy of HandshakeStateMachine?((uint64_t)v126, &demangling cache variable for type metadata for (P256.Signing.PublicKey, P256.Signing.PublicKey));
LABEL_65:
        outlined release of [Extension]((uint64_t)v137);
        outlined release of [Extension]((uint64_t)&v136);
        outlined release of [Extension]((uint64_t)v137);
        outlined release of [Extension]((uint64_t)&v136);
        return 0;
      case 2uLL:
        uint64_t v83 = *(void *)(v73 + 16);
        uint64_t v82 = *(void *)(v73 + 24);
        BOOL v80 = __OFSUB__(v82, v83);
        uint64_t v81 = v82 - v83;
        if (!v80) {
          goto LABEL_40;
        }
        goto LABEL_71;
      case 3uLL:
        if (!v76) {
          goto LABEL_23;
        }
        goto LABEL_64;
      default:
        uint64_t v81 = BYTE6(v75);
        goto LABEL_40;
    }
  }
}

unint64_t lazy protocol witness table accessor for type HandshakeStateMachine.Configuration and conformance HandshakeStateMachine.Configuration()
{
  unint64_t result = lazy protocol witness table cache variable for type HandshakeStateMachine.Configuration and conformance HandshakeStateMachine.Configuration;
  if (!lazy protocol witness table cache variable for type HandshakeStateMachine.Configuration and conformance HandshakeStateMachine.Configuration)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type HandshakeStateMachine.Configuration and conformance HandshakeStateMachine.Configuration);
  }
  return result;
}

uint64_t destroy for HandshakeStateMachine.Configuration(uint64_t *a1)
{
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v3 = a1[4];
  if (v3 >> 60 != 15) {
    uint64_t result = outlined consume of Data._Representation(a1[3], v3);
  }
  unint64_t v4 = a1[7];
  if (v4 >> 60 != 15)
  {
    uint64_t v5 = a1[6];
    return outlined consume of Data._Representation(v5, v4);
  }
  return result;
}

uint64_t initializeWithCopy for HandshakeStateMachine.Configuration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  unint64_t v5 = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v5 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  }
  else
  {
    uint64_t v6 = *(void *)(a2 + 24);
    outlined copy of Data._Representation(v6, v5);
    *(void *)(a1 + 24) = v6;
    *(void *)(a1 + 32) = v5;
  }
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  unint64_t v7 = *(void *)(a2 + 56);
  if (v7 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  }
  else
  {
    uint64_t v8 = *(void *)(a2 + 48);
    outlined copy of Data._Representation(v8, *(void *)(a2 + 56));
    *(void *)(a1 + 48) = v8;
    *(void *)(a1 + 56) = v7;
  }
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  return a1;
}

uint64_t assignWithCopy for HandshakeStateMachine.Configuration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (long long *)(a1 + 24);
  unint64_t v5 = (long long *)(a2 + 24);
  unint64_t v6 = *(void *)(a2 + 32);
  if (*(void *)(a1 + 32) >> 60 == 15)
  {
    if (v6 >> 60 == 15)
    {
      long long v7 = *v5;
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *uint64_t v4 = v7;
      goto LABEL_9;
    }
    uint64_t v9 = *(void *)(a2 + 24);
    outlined copy of Data._Representation(v9, *(void *)(a2 + 32));
    *(void *)(a1 + 24) = v9;
    *(void *)(a1 + 32) = v6;
  }
  else
  {
    if (v6 >> 60 == 15)
    {
      outlined destroy of ByteBuffer(a1 + 24);
      uint64_t v8 = *(void *)(a2 + 40);
      *uint64_t v4 = *v5;
      *(void *)(a1 + 40) = v8;
      goto LABEL_9;
    }
    uint64_t v10 = *(void *)(a2 + 24);
    outlined copy of Data._Representation(v10, *(void *)(a2 + 32));
    uint64_t v11 = *(void *)(a1 + 24);
    unint64_t v12 = *(void *)(a1 + 32);
    *(void *)(a1 + 24) = v10;
    *(void *)(a1 + 32) = v6;
    outlined consume of Data._Representation(v11, v12);
  }
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
LABEL_9:
  size_t v13 = (_OWORD *)(a1 + 48);
  uint64_t v14 = (_OWORD *)(a2 + 48);
  unint64_t v15 = *(void *)(a2 + 56);
  if (*(void *)(a1 + 56) >> 60 != 15)
  {
    if (v15 >> 60 == 15)
    {
      outlined destroy of ByteBuffer(a1 + 48);
      uint64_t v17 = *(void *)(a2 + 64);
      *size_t v13 = *v14;
      *(void *)(a1 + 64) = v17;
      goto LABEL_17;
    }
    uint64_t v19 = *(void *)(a2 + 48);
    outlined copy of Data._Representation(v19, *(void *)(a2 + 56));
    uint64_t v20 = *(void *)(a1 + 48);
    unint64_t v21 = *(void *)(a1 + 56);
    *(void *)(a1 + 48) = v19;
    *(void *)(a1 + 56) = v15;
    outlined consume of Data._Representation(v20, v21);
LABEL_16:
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    goto LABEL_17;
  }
  if (v15 >> 60 != 15)
  {
    uint64_t v18 = *(void *)(a2 + 48);
    outlined copy of Data._Representation(v18, *(void *)(a2 + 56));
    *(void *)(a1 + 48) = v18;
    *(void *)(a1 + 56) = v15;
    goto LABEL_16;
  }
  long long v16 = *v14;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *size_t v13 = v16;
LABEL_17:
  __int16 v22 = *(_WORD *)(a2 + 72);
  *(unsigned char *)(a1 + 74) = *(unsigned char *)(a2 + 74);
  *(_WORD *)(a1 + 72) = v22;
  *(unsigned char *)(a1 + 75) = *(unsigned char *)(a2 + 75);
  return a1;
}

__n128 __swift_memcpy76_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 60) = *(_OWORD *)(a2 + 60);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for HandshakeStateMachine.Configuration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  unint64_t v5 = *(void *)(a1 + 32);
  if (v5 >> 60 == 15) {
    goto LABEL_4;
  }
  unint64_t v6 = *(void *)(a2 + 32);
  if (v6 >> 60 == 15)
  {
    outlined destroy of ByteBuffer(a1 + 24);
LABEL_4:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    goto LABEL_6;
  }
  uint64_t v7 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  outlined consume of Data._Representation(v7, v5);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
LABEL_6:
  unint64_t v8 = *(void *)(a1 + 56);
  if (v8 >> 60 != 15)
  {
    unint64_t v9 = *(void *)(a2 + 56);
    if (v9 >> 60 != 15)
    {
      uint64_t v10 = *(void *)(a1 + 48);
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      *(void *)(a1 + 56) = v9;
      outlined consume of Data._Representation(v10, v8);
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      goto LABEL_11;
    }
    outlined destroy of ByteBuffer(a1 + 48);
  }
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
LABEL_11:
  *(_WORD *)(a1 + 72) = *(_WORD *)(a2 + 72);
  *(unsigned char *)(a1 + 74) = *(unsigned char *)(a2 + 74);
  *(unsigned char *)(a1 + 75) = *(unsigned char *)(a2 + 75);
  return a1;
}

uint64_t getEnumTagSinglePayload for HandshakeStateMachine.Configuration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 76)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HandshakeStateMachine.Configuration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_DWORD *)(result + 72) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 76) = 1;
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
    *(unsigned char *)(result + 76) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HandshakeStateMachine.Configuration()
{
  return &type metadata for HandshakeStateMachine.Configuration;
}

uint64_t outlined init with take of (P256.Signing.PublicKey, P256.Signing.PublicKey)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (P256.Signing.PublicKey, P256.Signing.PublicKey));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t ByteBuffer.writePreSharedKeyKexModes(_:)(uint64_t a1)
{
  swift_bridgeObjectRetain();
  unint64_t v3 = specialized ByteBuffer.writeVariableLengthVector<A>(lengthFieldType:_:)(v1, a1);
  swift_bridgeObjectRelease();
  return v3;
}

char *ByteBuffer.readPreSharedKeyKexModes(messageType:)(unsigned __int8 a1)
{
  if (a1 == 1)
  {
    uint64_t v5 = *v1;
    unint64_t v4 = v1[1];
    uint64_t v6 = v1[2];
    outlined copy of Data._Representation(*v1, v4);
    uint64_t v7 = specialized closure #1 in ByteBuffer.readVariableLengthVector<A, B>(lengthFieldType:_:)(v1);
    if (v2)
    {
      outlined consume of Data._Representation(*v1, v1[1]);
      *uint64_t v1 = v5;
      v1[1] = v4;
      v1[2] = v6;
    }
    else
    {
      unint64_t v3 = v7;
      if (v7)
      {
        outlined consume of Data._Representation(v5, v4);
        return v3;
      }
      outlined consume of Data._Representation(*v1, v1[1]);
      *uint64_t v1 = v5;
      v1[1] = v4;
      v1[2] = v6;
      lazy protocol witness table accessor for type TLSError and conformance TLSError();
      swift_allocError();
      *(_DWORD *)uint64_t v11 = 0;
      *(unsigned char *)(v11 + 4) = 1;
    }
  }
  else
  {
    int v8 = a1 | 0x2D0000;
    lazy protocol witness table accessor for type TLSError and conformance TLSError();
    swift_allocError();
    *(_DWORD *)uint64_t v9 = v8;
    *(unsigned char *)(v9 + 4) = 0;
  }
  swift_willThrow();
  return v3;
}

void *Extension.PreSharedKeyKexModes.Mode.pskAndDHE.unsafeMutableAddressor()
{
  return &static Extension.PreSharedKeyKexModes.Mode.pskAndDHE;
}

void *Extension.PreSharedKeyKexModes.Mode.pskOnly.unsafeMutableAddressor()
{
  return &static Extension.PreSharedKeyKexModes.Mode.pskOnly;
}

void Extension.PreSharedKeyKexModes.hash(into:)(uint64_t a1, uint64_t a2)
{
  Swift::UInt v3 = *(void *)(a2 + 16);
  Hasher._combine(_:)(v3);
  if (v3)
  {
    unint64_t v4 = (Swift::UInt8 *)(a2 + 32);
    do
    {
      Swift::UInt8 v5 = *v4++;
      Hasher._combine(_:)(v5);
      --v3;
    }
    while (v3);
  }
}

Swift::Int Extension.PreSharedKeyKexModes.hashValue.getter(uint64_t a1)
{
  Hasher.init(_seed:)();
  Swift::UInt v2 = *(void *)(a1 + 16);
  Hasher._combine(_:)(v2);
  if (v2)
  {
    Swift::UInt v3 = (Swift::UInt8 *)(a1 + 32);
    do
    {
      Swift::UInt8 v4 = *v3++;
      Hasher._combine(_:)(v4);
      --v2;
    }
    while (v2);
  }
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Extension.PreSharedKeyKexModes()
{
  return Extension.PreSharedKeyKexModes.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance Extension.PreSharedKeyKexModes()
{
  uint64_t v1 = *v0;
  Swift::UInt v2 = *(void *)(*v0 + 16);
  Hasher._combine(_:)(v2);
  if (v2)
  {
    Swift::UInt v3 = (Swift::UInt8 *)(v1 + 32);
    do
    {
      Swift::UInt8 v4 = *v3++;
      Hasher._combine(_:)(v4);
      --v2;
    }
    while (v2);
  }
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Extension.PreSharedKeyKexModes()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)();
  Swift::UInt v2 = *(void *)(v1 + 16);
  Hasher._combine(_:)(v2);
  if (v2)
  {
    Swift::UInt v3 = (Swift::UInt8 *)(v1 + 32);
    do
    {
      Swift::UInt8 v4 = *v3++;
      Hasher._combine(_:)(v4);
      --v2;
    }
    while (v2);
  }
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance Extension.PreSharedKeyKexModes(void *a1, void *a2)
{
  return specialized static Array<A>.== infix(_:_:)(*a1, *a2);
}

unint64_t lazy protocol witness table accessor for type Extension.PreSharedKeyKexModes.Mode and conformance Extension.PreSharedKeyKexModes.Mode()
{
  unint64_t result = lazy protocol witness table cache variable for type Extension.PreSharedKeyKexModes.Mode and conformance Extension.PreSharedKeyKexModes.Mode;
  if (!lazy protocol witness table cache variable for type Extension.PreSharedKeyKexModes.Mode and conformance Extension.PreSharedKeyKexModes.Mode)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Extension.PreSharedKeyKexModes.Mode and conformance Extension.PreSharedKeyKexModes.Mode);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Extension.PreSharedKeyKexModes and conformance Extension.PreSharedKeyKexModes()
{
  unint64_t result = lazy protocol witness table cache variable for type Extension.PreSharedKeyKexModes and conformance Extension.PreSharedKeyKexModes;
  if (!lazy protocol witness table cache variable for type Extension.PreSharedKeyKexModes and conformance Extension.PreSharedKeyKexModes)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Extension.PreSharedKeyKexModes and conformance Extension.PreSharedKeyKexModes);
  }
  return result;
}

ValueMetadata *type metadata accessor for Extension.PreSharedKeyKexModes()
{
  return &type metadata for Extension.PreSharedKeyKexModes;
}

ValueMetadata *type metadata accessor for Extension.PreSharedKeyKexModes.Mode()
{
  return &type metadata for Extension.PreSharedKeyKexModes.Mode;
}

uint64_t SessionKeyManager.dataToSignInServerCertificateVerify()()
{
  uint64_t v1 = type metadata accessor for SessionKeyManager.State.HandshakeSecret();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  Swift::UInt8 v4 = (char *)&v16 - v3;
  uint64_t v5 = type metadata accessor for SessionKeyManager.State();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  int v8 = (char *)&v16 - v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v16 - v7, v0, v5);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v8, v1);
      uint64_t v12 = SessionKeyManager.State.HandshakeSecret.dataToSignInServerCertificateVerify.getter();
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      break;
    case 4u:
      goto LABEL_3;
    default:
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
LABEL_3:
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      uint64_t v9 = type metadata accessor for Logger();
      uint64_t v10 = __swift_project_value_buffer(v9, (uint64_t)logger);
      uint64_t v11 = SessionKeyManager.State.logDescription.getter(v5);
      uint64_t v12 = v10;
      Logger.logInvalidStateTransition(stateName:event:)(v11, v13, 0xD00000000000001DLL, 0x80000001B5782680);
      swift_bridgeObjectRelease();
      lazy protocol witness table accessor for type TLSError and conformance TLSError();
      swift_allocError();
      *(_DWORD *)uint64_t v14 = 2;
      *(unsigned char *)(v14 + 4) = 1;
      swift_willThrow();
      break;
  }
  return v12;
}

uint64_t type metadata accessor for SessionKeyManager.State.HandshakeSecret()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for SessionKeyManager.State()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t SessionKeyManager.clientEarlyTrafficSecret.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for SessionKeyManager.State.EarlySecret();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v18 - v6;
  uint64_t v8 = type metadata accessor for SessionKeyManager.State();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v18 - v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v18 - v10, v2, v8);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if ((EnumCaseMultiPayload - 1) >= 3)
  {
    if (!EnumCaseMultiPayload)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v11, v4);
      unint64_t v13 = &v7[*(int *)(v4 + 44)];
      uint64_t v14 = type metadata accessor for SymmetricKey();
      uint64_t v15 = *(void *)(v14 - 8);
      (*(void (**)(uint64_t, char *, uint64_t))(v15 + 16))(a1, v13, v14);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v15 + 56))(a1, 0, 1, v14);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  uint64_t v17 = type metadata accessor for SymmetricKey();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(a1, 1, 1, v17);
}

uint64_t SessionKeyManager.clientHandshakeTrafficSecret.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v26 = a1;
  uint64_t v3 = type metadata accessor for SessionKeyManager.State.MasterSecret();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v25 - v5;
  uint64_t v7 = type metadata accessor for SessionKeyManager.State.HandshakeSecret();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v25 - v9;
  uint64_t v11 = type metadata accessor for SessionKeyManager.State();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v25 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v25 - v13, v2, v11);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v14, v7);
      unint64_t v21 = &v10[*(int *)(v7 + 40)];
      uint64_t v22 = type metadata accessor for SymmetricKey();
      uint64_t v23 = *(void *)(v22 - 8);
      uint64_t v24 = v26;
      (*(void (**)(uint64_t, char *, uint64_t))(v23 + 16))(v26, v21, v22);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v23 + 56))(v24, 0, 1, v22);
      break;
    case 2u:
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v14, v3);
      uint64_t v17 = &v6[*(int *)(v3 + 40)];
      uint64_t v18 = type metadata accessor for SymmetricKey();
      uint64_t v19 = *(void *)(v18 - 8);
      uint64_t v20 = v26;
      (*(void (**)(uint64_t, char *, uint64_t))(v19 + 16))(v26, v17, v18);
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v19 + 56))(v20, 0, 1, v18);
      break;
    case 4u:
      goto LABEL_3;
    default:
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
LABEL_3:
      uint64_t v15 = type metadata accessor for SymmetricKey();
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v26, 1, 1, v15);
      break;
  }
  return result;
}

uint64_t SessionKeyManager.serverHandshakeTrafficSecret.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v26 = a1;
  uint64_t v3 = type metadata accessor for SessionKeyManager.State.MasterSecret();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v25 - v5;
  uint64_t v7 = type metadata accessor for SessionKeyManager.State.HandshakeSecret();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v25 - v9;
  uint64_t v11 = type metadata accessor for SessionKeyManager.State();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v25 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v25 - v13, v2, v11);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v14, v7);
      unint64_t v21 = &v10[*(int *)(v7 + 44)];
      uint64_t v22 = type metadata accessor for SymmetricKey();
      uint64_t v23 = *(void *)(v22 - 8);
      uint64_t v24 = v26;
      (*(void (**)(uint64_t, char *, uint64_t))(v23 + 16))(v26, v21, v22);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v23 + 56))(v24, 0, 1, v22);
      break;
    case 2u:
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v14, v3);
      uint64_t v17 = &v6[*(int *)(v3 + 44)];
      uint64_t v18 = type metadata accessor for SymmetricKey();
      uint64_t v19 = *(void *)(v18 - 8);
      uint64_t v20 = v26;
      (*(void (**)(uint64_t, char *, uint64_t))(v19 + 16))(v26, v17, v18);
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v19 + 56))(v20, 0, 1, v18);
      break;
    case 4u:
      goto LABEL_3;
    default:
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
LABEL_3:
      uint64_t v15 = type metadata accessor for SymmetricKey();
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v26, 1, 1, v15);
      break;
  }
  return result;
}

uint64_t SessionKeyManager.clientApplicationTrafficSecret.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v25 = a1;
  uint64_t v3 = type metadata accessor for SessionKeyManager.State.AllSecrets();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v24 - v5;
  uint64_t v7 = type metadata accessor for SessionKeyManager.State.MasterSecret();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v24 - v9;
  uint64_t v11 = type metadata accessor for SessionKeyManager.State();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v24 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v24 - v13, v2, v11);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 2u:
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v14, v7);
      uint64_t v20 = &v10[*(int *)(v7 + 48)];
      uint64_t v21 = type metadata accessor for SymmetricKey();
      uint64_t v22 = *(void *)(v21 - 8);
      uint64_t v23 = v25;
      (*(void (**)(uint64_t, char *, uint64_t))(v22 + 16))(v25, v20, v21);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v22 + 56))(v23, 0, 1, v21);
      break;
    case 3u:
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v14, v3);
      uint64_t v17 = type metadata accessor for SymmetricKey();
      uint64_t v18 = *(void *)(v17 - 8);
      uint64_t v19 = v25;
      (*(void (**)(uint64_t, char *, uint64_t))(v18 + 16))(v25, v6, v17);
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v18 + 56))(v19, 0, 1, v17);
      break;
    case 4u:
      goto LABEL_3;
    default:
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
LABEL_3:
      uint64_t v15 = type metadata accessor for SymmetricKey();
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v25, 1, 1, v15);
      break;
  }
  return result;
}

uint64_t SessionKeyManager.serverApplicationTrafficSecret.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v26 = a1;
  uint64_t v3 = type metadata accessor for SessionKeyManager.State.AllSecrets();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v25 - v5;
  uint64_t v7 = type metadata accessor for SessionKeyManager.State.MasterSecret();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v25 - v9;
  uint64_t v11 = type metadata accessor for SessionKeyManager.State();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v25 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v25 - v13, v2, v11);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 2u:
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v14, v7);
      uint64_t v21 = &v10[*(int *)(v7 + 52)];
      uint64_t v22 = type metadata accessor for SymmetricKey();
      uint64_t v23 = *(void *)(v22 - 8);
      uint64_t v24 = v26;
      (*(void (**)(uint64_t, char *, uint64_t))(v23 + 16))(v26, v21, v22);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v23 + 56))(v24, 0, 1, v22);
      break;
    case 3u:
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v14, v3);
      uint64_t v17 = &v6[*(int *)(v3 + 36)];
      uint64_t v18 = type metadata accessor for SymmetricKey();
      uint64_t v19 = *(void *)(v18 - 8);
      uint64_t v20 = v26;
      (*(void (**)(uint64_t, char *, uint64_t))(v19 + 16))(v26, v17, v18);
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v19 + 56))(v20, 0, 1, v18);
      break;
    case 4u:
      goto LABEL_3;
    default:
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
LABEL_3:
      uint64_t v15 = type metadata accessor for SymmetricKey();
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v26, 1, 1, v15);
      break;
  }
  return result;
}

uint64_t SessionKeyManager.init()()
{
  type metadata accessor for SessionKeyManager.State();

  return swift_storeEnumTagMultiPayload();
}

char *SessionKeyManager.sendingClientHello(clientHello:sessionToResume:currentTime:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v19 = a3;
  uint64_t v17 = a1;
  uint64_t v18 = a2;
  uint64_t v5 = *(void *)(a4 + 16);
  uint64_t v6 = *(void **)(a4 + 24);
  uint64_t v7 = type metadata accessor for SessionKeyManager.State.EarlySecret();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v17 - v9;
  uint64_t v11 = type metadata accessor for SessionKeyManager.State();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v17 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v17 - v13, v4, v11);
  if (swift_getEnumCaseMultiPayload() >= 4)
  {
    uint64_t v14 = (char *)static SessionKeyManager.State.EarlySecret.create(clientHello:sessionToResume:currentTime:)((uint64_t)v10, v17, v18, v19, v5, v6);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v4, v11);
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v4, v10, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    lazy protocol witness table accessor for type TLSError and conformance TLSError();
    swift_allocError();
    *(_DWORD *)uint64_t v15 = 2;
    *(unsigned char *)(v15 + 4) = 1;
    swift_willThrow();
  }
  return v14;
}

uint64_t SessionKeyManager.postServerHello(ecdheSecret:serverHelloBytes:resumptionFailed:)(uint64_t a1, uint64_t a2, unint64_t a3, char *a4, int a5, uint64_t a6)
{
  uint64_t v54 = a4;
  uint64_t v7 = v6;
  int v52 = a5;
  unint64_t v53 = a3;
  uint64_t v51 = a2;
  uint64_t v49 = a1;
  uint64_t v50 = type metadata accessor for SymmetricKey();
  uint64_t v57 = *(void *)(v50 - 8);
  MEMORY[0x1F4188790](v50);
  uint64_t v56 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(a6 + 16);
  uint64_t v10 = *(void *)(a6 + 24);
  uint64_t v58 = type metadata accessor for SessionKeyManager.State.EarlySecret();
  uint64_t v55 = *(void *)(v58 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v58);
  uint64_t v14 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v16 = (char *)&v44 - v15;
  uint64_t v17 = type metadata accessor for SessionKeyManager.State();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x1F4188790](v17);
  uint64_t v21 = (char *)&v44 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v19);
  uint64_t v23 = (char *)&v44 - v22;
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  uint64_t v59 = v7;
  v24((char *)&v44 - v22, v7, v17);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if ((EnumCaseMultiPayload - 1) >= 3)
  {
    uint64_t v46 = v21;
    uint64_t v47 = v11;
    uint64_t v26 = v14;
    uint64_t v48 = v10;
    uint64_t v28 = v55;
    uint64_t v27 = v56;
    uint64_t v29 = v57;
    if (!EnumCaseMultiPayload)
    {
      uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v55 + 32);
      unint64_t v31 = v16;
      uint64_t v45 = v16;
      uint64_t v32 = v23;
      uint64_t v33 = v58;
      v30(v16, v32, v58);
      uint64_t v34 = (uint64_t)v26;
      (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v26, v31, v33);
      uint64_t v35 = (uint64_t)v27;
      (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v27, v49, v50);
      uint64_t v36 = v51;
      unint64_t v37 = v53;
      outlined copy of Data._Representation(v51, v53);
      uint64_t v38 = (uint64_t)v46;
      SessionKeyManager.State.HandshakeSecret.init(earlySecret:ecdheSecret:serverHelloBytes:resumptionFailed:)(v34, v35, v36, v37, v54, v52 & 1, v47, (uint64_t)v46);
      (*(void (**)(char *, uint64_t))(v28 + 8))(v45, v58);
      swift_storeEnumTagMultiPayload();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 40))(v59, v38, v17);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v23, v17);
  }
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v40 = type metadata accessor for Logger();
  __swift_project_value_buffer(v40, (uint64_t)logger);
  uint64_t v41 = SessionKeyManager.State.logDescription.getter(v17);
  Logger.logInvalidStateTransition(stateName:event:)(v41, v42, 0x7672655374736F70, 0xEF6F6C6C65487265);
  swift_bridgeObjectRelease();
  lazy protocol witness table accessor for type TLSError and conformance TLSError();
  swift_allocError();
  *(_DWORD *)uint64_t v43 = 2;
  *(unsigned char *)(v43 + 4) = 1;
  return swift_willThrow();
}

uint64_t SessionKeyManager.addPreFinishedMessageToTransportHash(_:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v22 = a3;
  unint64_t v21 = a2;
  uint64_t v6 = type metadata accessor for SessionKeyManager.State.HandshakeSecret();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v20 - v8;
  uint64_t v10 = type metadata accessor for SessionKeyManager.State();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v20 - v12;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))((char *)&v20 - v12, v4, v10);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
      v19(v9, v13, v6);
      SessionKeyManager.State.HandshakeSecret.addMessageToTranscriptHash(_:)(a1, v21, v22);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v4, v10);
      v19(v4, v9, v6);
      uint64_t result = swift_storeEnumTagMultiPayload();
      break;
    case 4u:
      goto LABEL_3;
    default:
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
LABEL_3:
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      uint64_t v14 = type metadata accessor for Logger();
      __swift_project_value_buffer(v14, (uint64_t)logger);
      uint64_t v15 = SessionKeyManager.State.logDescription.getter(v10);
      Logger.logInvalidStateTransition(stateName:event:)(v15, v16, 0xD000000000000012, 0x80000001B5782F10);
      swift_bridgeObjectRelease();
      lazy protocol witness table accessor for type TLSError and conformance TLSError();
      swift_allocError();
      *(_DWORD *)uint64_t v17 = 2;
      *(unsigned char *)(v17 + 4) = 1;
      uint64_t result = swift_willThrow();
      break;
  }
  return result;
}

uint64_t SessionKeyManager.generateSessionTicketPSK(ticketNonce:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v19 = a2;
  uint64_t v20 = a3;
  uint64_t v21 = a1;
  uint64_t v4 = type metadata accessor for SessionKeyManager.State.AllSecrets();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v19 - v6;
  uint64_t v8 = type metadata accessor for SessionKeyManager.State();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v19 - v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v19 - v10, v3, v8);
  unsigned int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload >= 3)
  {
    uint64_t v13 = v21;
    if (EnumCaseMultiPayload == 3)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v11, v4);
      SessionKeyManager.State.AllSecrets.generateSessionTicketPSK(ticketNonce:)(v13, v19, v20, v4);
      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v15 = type metadata accessor for Logger();
  __swift_project_value_buffer(v15, (uint64_t)logger);
  uint64_t v16 = SessionKeyManager.State.logDescription.getter(v8);
  Logger.logInvalidStateTransition(stateName:event:)(v16, v17, 0xD000000000000018, 0x80000001B5782F30);
  swift_bridgeObjectRelease();
  lazy protocol witness table accessor for type TLSError and conformance TLSError();
  swift_allocError();
  *(_DWORD *)uint64_t v18 = 2;
  *(unsigned char *)(v18 + 4) = 1;
  return swift_willThrow();
}

uint64_t SessionKeyManager.serverFinishedPayload()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for SessionKeyManager.State.HandshakeSecret();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)v16 - v5;
  uint64_t v7 = type metadata accessor for SessionKeyManager.State();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)v16 - v9;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)v16 - v9, v1, v7);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v10, v3);
      SessionKeyManager.State.HandshakeSecret.serverFinishedPayload.getter(v3, a1);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      break;
    case 4u:
      goto LABEL_3;
    default:
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
LABEL_3:
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      uint64_t v11 = type metadata accessor for Logger();
      __swift_project_value_buffer(v11, (uint64_t)logger);
      uint64_t v12 = SessionKeyManager.State.logDescription.getter(v7);
      Logger.logInvalidStateTransition(stateName:event:)(v12, v13, 0xD000000000000015, 0x80000001B5782EF0);
      swift_bridgeObjectRelease();
      lazy protocol witness table accessor for type TLSError and conformance TLSError();
      swift_allocError();
      *(_DWORD *)uint64_t v14 = 2;
      *(unsigned char *)(v14 + 4) = 1;
      uint64_t result = swift_willThrow();
      break;
  }
  return result;
}

uint64_t SessionKeyManager.postServerFinished(serverFinishedBytes:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v31 = a3;
  uint64_t v5 = v4;
  unint64_t v33 = a2;
  uint64_t v30 = a1;
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v32 = type metadata accessor for SessionKeyManager.State.HandshakeSecret();
  uint64_t v29 = *(void *)(v32 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v32);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v29 - v10;
  uint64_t v12 = type metadata accessor for SessionKeyManager.State();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  uint64_t v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)&v29 - v17;
  unint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  uint64_t v34 = v5;
  v19((char *)&v29 - v17, v5, v12);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v25 = v29;
      uint64_t v26 = v18;
      uint64_t v27 = v32;
      (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v11, v26, v32);
      (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v9, v11, v27);
      uint64_t v28 = v30;
      outlined copy of Data._Representation(v30, v33);
      SessionKeyManager.State.MasterSecret.init(handshakeSecret:serverFinishedBytes:)((uint64_t)v9, v28, v33, v31, v6, (uint64_t)v16);
      (*(void (**)(char *, uint64_t))(v25 + 8))(v11, v32);
      swift_storeEnumTagMultiPayload();
      uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 40))(v34, v16, v12);
      break;
    case 4u:
      goto LABEL_3;
    default:
      (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
LABEL_3:
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      uint64_t v20 = type metadata accessor for Logger();
      __swift_project_value_buffer(v20, (uint64_t)logger);
      uint64_t v21 = SessionKeyManager.State.logDescription.getter(v12);
      Logger.logInvalidStateTransition(stateName:event:)(v21, v22, 0xD000000000000012, 0x80000001B5782ED0);
      swift_bridgeObjectRelease();
      lazy protocol witness table accessor for type TLSError and conformance TLSError();
      swift_allocError();
      *(_DWORD *)uint64_t v23 = 2;
      *(unsigned char *)(v23 + 4) = 1;
      uint64_t result = swift_willThrow();
      break;
  }
  return result;
}

uint64_t SessionKeyManager.clientFinishedPayload()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for SessionKeyManager.State.MasterSecret();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)v16 - v5;
  uint64_t v7 = type metadata accessor for SessionKeyManager.State();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)v16 - v9;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)v16 - v9, v1, v7);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 2u:
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v10, v3);
      SessionKeyManager.State.MasterSecret.clientFinishedPayload.getter(v3, a1);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      break;
    case 4u:
      goto LABEL_3;
    default:
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
LABEL_3:
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      uint64_t v11 = type metadata accessor for Logger();
      __swift_project_value_buffer(v11, (uint64_t)logger);
      uint64_t v12 = SessionKeyManager.State.logDescription.getter(v7);
      Logger.logInvalidStateTransition(stateName:event:)(v12, v13, 0xD000000000000015, 0x80000001B5782EB0);
      swift_bridgeObjectRelease();
      lazy protocol witness table accessor for type TLSError and conformance TLSError();
      swift_allocError();
      *(_DWORD *)uint64_t v14 = 2;
      *(unsigned char *)(v14 + 4) = 1;
      uint64_t result = swift_willThrow();
      break;
  }
  return result;
}

uint64_t SessionKeyManager.postClientFinished(clientFinishedBytes:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v32 = a3;
  uint64_t v5 = v4;
  unint64_t v34 = a2;
  uint64_t v31 = a1;
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(void *)(a4 + 24);
  uint64_t v33 = type metadata accessor for SessionKeyManager.State.MasterSecret();
  uint64_t v30 = *(void *)(v33 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v33);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v30 - v11;
  uint64_t v13 = type metadata accessor for SessionKeyManager.State();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  unint64_t v19 = (char *)&v30 - v18;
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  uint64_t v35 = v5;
  v20((char *)&v30 - v18, v5, v13);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 2u:
      uint64_t v26 = v30;
      uint64_t v27 = v19;
      uint64_t v28 = v33;
      (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v12, v27, v33);
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v10, v12, v28);
      uint64_t v29 = v31;
      outlined copy of Data._Representation(v31, v34);
      SessionKeyManager.State.AllSecrets.init(masterSecret:clientFinishedBytes:)((uint64_t)v10, v29, v34, v32, v6, v7, (uint64_t)v17);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v12, v33);
      swift_storeEnumTagMultiPayload();
      uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 40))(v35, v17, v13);
      break;
    case 4u:
      goto LABEL_3;
    default:
      (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
LABEL_3:
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      uint64_t v21 = type metadata accessor for Logger();
      __swift_project_value_buffer(v21, (uint64_t)logger);
      uint64_t v22 = SessionKeyManager.State.logDescription.getter(v13);
      Logger.logInvalidStateTransition(stateName:event:)(v22, v23, 0xD000000000000013, 0x80000001B5782E90);
      swift_bridgeObjectRelease();
      lazy protocol witness table accessor for type TLSError and conformance TLSError();
      swift_allocError();
      *(_DWORD *)uint64_t v24 = 2;
      *(unsigned char *)(v24 + 4) = 1;
      uint64_t result = swift_willThrow();
      break;
  }
  return result;
}

uint64_t SessionKeyManager.generateTLSExporterKey(label:)@<X0>(Swift::Int a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  Swift::Int v21 = a1;
  unint64_t v22 = a2;
  uint64_t v23 = a4;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1F4188790](AssociatedTypeWitness);
  uint64_t v7 = (char *)&AssociatedTypeWitness - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&AssociatedTypeWitness - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v11 = type metadata accessor for SymmetricKey();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&AssociatedTypeWitness - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  SessionKeyManager.exporterMasterSecret.getter((uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, unint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    outlined destroy of HandshakeStateMachine?((uint64_t)v10, &demangling cache variable for type metadata for SymmetricKey?);
    uint64_t v15 = 1;
    uint64_t v16 = v23;
  }
  else
  {
    (*(void (**)(char *, char *, unint64_t))(v12 + 32))(v14, v10, v11);
    static HashFunction.zeroHash.getter(v4);
    unint64_t v17 = lazy protocol witness table accessor for type SymmetricKey and conformance SymmetricKey();
    uint64_t v18 = v23;
    static HKDF.tlsExporter<A>(secret:label:context:)((int64_t)v14, v21, v22, (uint64_t)v7, v4, v11, v17, v23);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, AssociatedTypeWitness);
    (*(void (**)(char *, unint64_t))(v12 + 8))(v14, v11);
    uint64_t v15 = 0;
    uint64_t v16 = v18;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t))(v12 + 56))(v16, v15, 1, v11);
}

uint64_t SessionKeyManager.generateHashForAuthenticator(transcript:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v21[0] = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = MEMORY[0x1F4188790](AssociatedTypeWitness);
  unint64_t v11 = (char *)v21 - v10;
  uint64_t v12 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v14 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v22 = xmmword_1B577F280;
  uint64_t v23 = 0;
  dispatch thunk of HashFunction.init()();
  uint64_t v15 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v15 = a1 >> 32;
      break;
    case 2uLL:
      uint64_t v15 = *(void *)(a1 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v15 = BYTE6(a2);
      break;
  }
  if (v15 < a3)
  {
    __break(1u);
    JUMPOUT(0x1B5767214);
  }
  uint64_t v16 = Data._Representation.subscript.getter();
  unint64_t v18 = v17;
  v21[2] = v16;
  v21[3] = v17;
  lazy protocol witness table accessor for type Data and conformance Data();
  HashFunction.update<A>(data:)();
  outlined consume of Data._Representation(v16, v18);
  uint64_t v19 = dispatch thunk of HashFunction.finalize()();
  MEMORY[0x1F4188790](v19);
  v21[-2] = &v22;
  swift_getAssociatedConformanceWitness();
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
  (*(void (**)(char *, uint64_t))(v21[0] + 8))(v11, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v7);
  return v22;
}

uint64_t SessionKeyManager.generateHMACForAuthenticator(transcript:key:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for HashedAuthenticationCode();
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)v14 - v7;
  uint64_t v9 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v9 = a1 >> 32;
      break;
    case 2uLL:
      uint64_t v9 = *(void *)(a1 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v9 = BYTE6(a2);
      break;
  }
  if (v9 < a3)
  {
    __break(1u);
    JUMPOUT(0x1B5767388);
  }
  uint64_t v10 = Data._Representation.subscript.getter();
  unint64_t v12 = v11;
  v14[0] = v10;
  v14[1] = v11;
  static HMAC.authenticationCode<A>(bytes:using:)();
  outlined consume of Data._Representation(v10, v12);
  swift_getWitnessTable();
  return ByteBuffer.init<A>(bytes:)((uint64_t)v8, v6);
}

uint64_t SessionKeyManager.binderKey.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for SessionKeyManager.State.EarlySecret();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v18 - v6;
  uint64_t v8 = type metadata accessor for SessionKeyManager.State();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  unint64_t v11 = (char *)&v18 - v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v18 - v10, v2, v8);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if ((EnumCaseMultiPayload - 1) >= 3)
  {
    if (!EnumCaseMultiPayload)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v11, v4);
      uint64_t v13 = &v7[*(int *)(v4 + 40)];
      uint64_t v14 = type metadata accessor for SymmetricKey();
      uint64_t v15 = *(void *)(v14 - 8);
      (*(void (**)(uint64_t, char *, uint64_t))(v15 + 16))(a1, v13, v14);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v15 + 56))(a1, 0, 1, v14);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  uint64_t v17 = type metadata accessor for SymmetricKey();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(a1, 1, 1, v17);
}

uint64_t SessionKeyManager.earlyExporterMasterSecret.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for SessionKeyManager.State.EarlySecret();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v18 - v6;
  uint64_t v8 = type metadata accessor for SessionKeyManager.State();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  unint64_t v11 = (char *)&v18 - v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v18 - v10, v2, v8);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if ((EnumCaseMultiPayload - 1) >= 3)
  {
    if (!EnumCaseMultiPayload)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v11, v4);
      uint64_t v13 = &v7[*(int *)(v4 + 48)];
      uint64_t v14 = type metadata accessor for SymmetricKey();
      uint64_t v15 = *(void *)(v14 - 8);
      (*(void (**)(uint64_t, char *, uint64_t))(v15 + 16))(a1, v13, v14);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v15 + 56))(a1, 0, 1, v14);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  uint64_t v17 = type metadata accessor for SymmetricKey();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(a1, 1, 1, v17);
}

uint64_t SessionKeyManager.exporterMasterSecret.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v26 = a1;
  uint64_t v3 = type metadata accessor for SessionKeyManager.State.AllSecrets();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v25 - v5;
  uint64_t v7 = type metadata accessor for SessionKeyManager.State.MasterSecret();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v25 - v9;
  uint64_t v11 = type metadata accessor for SessionKeyManager.State();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v25 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v25 - v13, v2, v11);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 2u:
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v14, v7);
      Swift::Int v21 = &v10[*(int *)(v7 + 56)];
      uint64_t v22 = type metadata accessor for SymmetricKey();
      uint64_t v23 = *(void *)(v22 - 8);
      uint64_t v24 = v26;
      (*(void (**)(uint64_t, char *, uint64_t))(v23 + 16))(v26, v21, v22);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v23 + 56))(v24, 0, 1, v22);
      break;
    case 3u:
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v14, v3);
      uint64_t v17 = &v6[*(int *)(v3 + 40)];
      uint64_t v18 = type metadata accessor for SymmetricKey();
      uint64_t v19 = *(void *)(v18 - 8);
      uint64_t v20 = v26;
      (*(void (**)(uint64_t, char *, uint64_t))(v19 + 16))(v26, v17, v18);
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v19 + 56))(v20, 0, 1, v18);
      break;
    case 4u:
      goto LABEL_3;
    default:
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
LABEL_3:
      uint64_t v15 = type metadata accessor for SymmetricKey();
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v26, 1, 1, v15);
      break;
  }
  return result;
}

uint64_t SessionKeyManager.resumptionMasterSecret.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for SessionKeyManager.State.AllSecrets();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v18 - v6;
  uint64_t v8 = type metadata accessor for SessionKeyManager.State();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v18 - v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v18 - v10, v2, v8);
  unsigned int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload >= 3)
  {
    if (EnumCaseMultiPayload == 3)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v11, v4);
      uint64_t v13 = &v7[*(int *)(v4 + 44)];
      uint64_t v14 = type metadata accessor for SymmetricKey();
      uint64_t v15 = *(void *)(v14 - 8);
      (*(void (**)(uint64_t, char *, uint64_t))(v15 + 16))(a1, v13, v14);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v15 + 56))(a1, 0, 1, v14);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  uint64_t v17 = type metadata accessor for SymmetricKey();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(a1, 1, 1, v17);
}

uint64_t static SessionKeyManager.State.EarlySecret.create(clientHello:sessionToResume:currentTime:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v77 = a4;
  uint64_t v97 = a3;
  uint64_t v86 = a2;
  uint64_t v83 = a1;
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1F4188790](a1);
  unint64_t v91 = (char *)&v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for SessionTicket();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v76 = (uint64_t)&v75 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v98 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v13 = MEMORY[0x1F4188790](AssociatedTypeWitness);
  uint64_t v82 = (char *)&v75 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v94 = (char *)&v75 - v15;
  unint64_t v95 = type metadata accessor for HashedAuthenticationCode();
  uint64_t v81 = *(void *)(v95 - 8);
  MEMORY[0x1F4188790](v95);
  uint64_t v88 = (void (*)(uint64_t, uint64_t))((char *)&v75 - v16);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SessionTicket?);
  uint64_t v18 = MEMORY[0x1F4188790](v17 - 8);
  uint64_t v84 = (uint64_t)&v75 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v18);
  Swift::Int v21 = (char *)&v75 - v20;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  MEMORY[0x1F4188790](v22 - 8);
  uint64_t v24 = (char *)&v75 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = type metadata accessor for SymmetricKey();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = MEMORY[0x1F4188790](v25);
  uint64_t v78 = (char *)&v75 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = MEMORY[0x1F4188790](v27);
  uint64_t v90 = (uint64_t)&v75 - v30;
  uint64_t v31 = MEMORY[0x1F4188790](v29);
  uint64_t v89 = (uint64_t)&v75 - v32;
  uint64_t v33 = MEMORY[0x1F4188790](v31);
  unint64_t v93 = (unint64_t)&v75 - v34;
  MEMORY[0x1F4188790](v33);
  char v92 = (char *)&v75 - v35;
  uint64_t v87 = a6;
  swift_getAssociatedConformanceWitness();
  uint64_t v96 = AssociatedTypeWitness;
  size_t v36 = dispatch thunk of static Digest.byteCount.getter();
  uint64_t v37 = specialized Array.init(repeating:count:)(0, v36);
  outlined init with copy of SessionTicket?(v97, (uint64_t)v21);
  uint64_t v38 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  uint64_t v85 = v10 + 48;
  int v39 = v38(v21, 1, v9);
  uint64_t v80 = v25;
  uint64_t v79 = v26;
  if (v39 == 1)
  {
    uint64_t v40 = v9;
    outlined destroy of HandshakeStateMachine?((uint64_t)v21, &demangling cache variable for type metadata for SessionTicket?);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 56))(v24, 1, 1, v25);
LABEL_4:
    *(void *)&v106[0] = v37;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UInt8]);
    lazy protocol witness table accessor for type [UInt8] and conformance <A> [A](&lazy protocol witness table cache variable for type [UInt8] and conformance <A> [A]);
    SymmetricKey.init<A>(data:)();
    outlined destroy of HandshakeStateMachine?((uint64_t)v24, &demangling cache variable for type metadata for SymmetricKey?);
    goto LABEL_6;
  }
  uint64_t v40 = v9;
  (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v24, &v21[*(int *)(v9 + 36)], v25);
  outlined destroy of SessionTicket((uint64_t)v21);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v24, 0, 1, v25);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25) == 1) {
    goto LABEL_4;
  }
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v92, v24, v25);
LABEL_6:
  int64_t v41 = (int64_t)v88;
  unint64_t v42 = v87;
  *(void *)&v106[0] = v37;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UInt8]);
  lazy protocol witness table accessor for type [UInt8] and conformance <A> [A]((unint64_t *)&lazy protocol witness table cache variable for type [UInt8] and conformance <A> [A]);
  static HKDF.extract<A>(inputKeyMaterial:salt:)();
  swift_bridgeObjectRelease();
  uint64_t v43 = (uint64_t)v94;
  static HashFunction.zeroHash.getter(a5);
  unint64_t v44 = v95;
  swift_getWitnessTable();
  unint64_t v45 = v93;
  static HKDF.deriveSecret<A>(secret:label:transcriptHash:)(v41, 0x646E696220736572, 0xEA00000000007265, v43, a5, v44);
  uint64_t v46 = *(void (**)(uint64_t, uint64_t))(v98 + 8);
  v98 += 8;
  uint64_t v88 = v46;
  v46(v43, v96);
  uint64_t v47 = v84;
  outlined init with copy of SessionTicket?(v97, v84);
  if (v38((char *)v47, 1, v40) == 1)
  {
    outlined destroy of HandshakeStateMachine?(v47, &demangling cache variable for type metadata for SessionTicket?);
    long long v104 = xmmword_1B577F280;
    uint64_t v105 = 0;
    long long v48 = *(_OWORD *)(v86 + 80);
    v106[4] = *(_OWORD *)(v86 + 64);
    v106[5] = v48;
    uint64_t v107 = *(void *)(v86 + 96);
    long long v49 = *(_OWORD *)(v86 + 16);
    v106[0] = *(_OWORD *)v86;
    v106[1] = v49;
    long long v50 = *(_OWORD *)(v86 + 48);
    v106[2] = *(_OWORD *)(v86 + 32);
    v106[3] = v50;
    LOBYTE(v99) = 1;
    uint64_t v51 = MEMORY[0x1E4FBB2B8];
    uint64_t v52 = MEMORY[0x1E4F27EF0];
    uint64_t v102 = MEMORY[0x1E4FBB2B8];
    uint64_t v103 = MEMORY[0x1E4F27EF0];
    uint64_t v100 = &v99;
    uint64_t v101 = (__int16 **)((char *)&v99 + 1);
    __swift_project_boxed_opaque_existential_1(&v100, MEMORY[0x1E4FBB2B8]);
    outlined retain of ClientHello((uint64_t)v106);
    Data._Representation.append(contentsOf:)();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v100);
    uint64_t v53 = 0;
    switch(*((void *)&v104 + 1) >> 62)
    {
      case 1:
        uint64_t v53 = (uint64_t)v104 >> 32;
        break;
      case 2:
        uint64_t v53 = *(void *)(v104 + 24);
        break;
      case 3:
        break;
      default:
        uint64_t v53 = BYTE14(v104);
        break;
    }
    LOBYTE(v99) = 0;
    uint64_t v102 = v51;
    uint64_t v103 = v52;
    uint64_t v100 = &v99;
    uint64_t v101 = (__int16 **)((char *)&v99 + 1);
    __swift_project_boxed_opaque_existential_1(&v100, v51);
    Data._Representation.append(contentsOf:)();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v100);
    __int16 v99 = 0;
    uint64_t v102 = v51;
    uint64_t v103 = v52;
    uint64_t v100 = &v99;
    uint64_t v101 = &v100;
    __swift_project_boxed_opaque_existential_1(&v100, v51);
    Data._Representation.append(contentsOf:)();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v100);
    int64_t v60 = ClientHello.write(into:)((uint64_t *)&v104);
    if (v60 > 0xFFFFFF) {
      goto LABEL_23;
    }
    unsigned int v61 = v60;
    uint64_t v62 = specialized ByteBuffer.setInteger<A>(_:at:as:)(SBYTE2(v60), v53);
    if (__OFADD__(v53, v62)) {
      goto LABEL_24;
    }
    specialized ByteBuffer.setInteger<A>(_:at:as:)(v61, v53 + v62);
    outlined release of ClientHello((uint64_t)v106);
    unint64_t v57 = *((void *)&v104 + 1);
    uint64_t v55 = v104;
    uint64_t v59 = v105;
  }
  else
  {
    uint64_t v54 = v76;
    outlined init with take of SessionTicket(v47, v76);
    uint64_t v55 = static SessionKeyManager.State.EarlySecret.tryToResume(session:binderSecret:clientHello:currentTime:)(v54, v45, v86, v77, a5, v42);
    unint64_t v57 = v56;
    uint64_t v59 = v58;
    outlined destroy of SessionTicket(v54);
    *(void *)&long long v104 = v55;
    *((void *)&v104 + 1) = v57;
    uint64_t v105 = v59;
  }
  dispatch thunk of HashFunction.init()();
  uint64_t v63 = 0;
  switch(v57 >> 62)
  {
    case 1uLL:
      uint64_t v63 = v55 >> 32;
      goto LABEL_19;
    case 2uLL:
      uint64_t v63 = *(void *)(v55 + 24);
LABEL_19:
      outlined copy of Data._Representation(v55, v57);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v63 = BYTE6(v57);
      break;
  }
  if (v63 < v59)
  {
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
  }
  uint64_t v64 = Data._Representation.subscript.getter();
  unint64_t v66 = v65;
  outlined consume of Data._Representation(v55, v57);
  uint64_t v100 = (__int16 *)v64;
  uint64_t v101 = (__int16 **)v66;
  lazy protocol witness table accessor for type Data and conformance Data();
  uint64_t v67 = (uint64_t)v91;
  HashFunction.update<A>(data:)();
  outlined consume of Data._Representation(v64, v66);
  uint64_t v68 = (uint64_t)v94;
  dispatch thunk of HashFunction.finalize()();
  unint64_t v69 = v95;
  static HKDF.deriveSecret<A>(secret:label:transcriptHash:)(v41, 0x6661727420652063, 0xEB00000000636966, v68, a5, v95);
  static HKDF.deriveSecret<A>(secret:label:transcriptHash:)(v41, 0x616D207078652065, 0xEC00000072657473, v68, a5, v69);
  uint64_t v70 = (uint64_t)v82;
  static HashFunction.zeroHash.getter(a5);
  uint64_t v71 = (uint64_t)v78;
  static HKDF.deriveSecret<A>(secret:label:transcriptHash:)(v41, 0x64657669726564, 0xE700000000000000, v70, a5, v69);
  uint64_t v72 = v96;
  uint64_t v73 = v88;
  v88(v70, v96);
  v73(v68, v72);
  (*(void (**)(int64_t, unint64_t))(v81 + 8))(v41, v69);
  (*(void (**)(char *, uint64_t))(v79 + 8))(v92, v80);
  SessionKeyManager.State.EarlySecret.init(transcriptHasher:derivedSecret:binderKey:clientEarlyTrafficSecret:earlyExporterMasterSecret:)(v67, v71, v93, v89, v90, a5, v83);
  return v104;
}

uint64_t SessionKeyManager.State.HandshakeSecret.init(earlySecret:ecdheSecret:serverHelloBytes:resumptionFailed:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, char *a5@<X4>, int a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  LODWORD(v61) = a6;
  uint64_t v62 = a5;
  uint64_t v73 = a2;
  uint64_t v74 = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v70 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v12 = MEMORY[0x1F4188790](AssociatedTypeWitness);
  int64_t v60 = (char *)&v57 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  unint64_t v69 = (char *)&v57 - v14;
  uint64_t v15 = type metadata accessor for HashedAuthenticationCode();
  uint64_t v16 = *(void *)(v15 - 8);
  unint64_t v67 = v15;
  uint64_t v68 = v16;
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  int64_t v71 = (int64_t)&v57 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  uint64_t v20 = (char *)&v57 - v19;
  uint64_t v21 = type metadata accessor for SymmetricKey();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = MEMORY[0x1F4188790](v21);
  uint64_t v25 = (char *)&v57 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x1F4188790](v23);
  uint64_t v75 = (char *)&v57 - v27;
  MEMORY[0x1F4188790](v26);
  uint64_t v29 = (char *)&v57 - v28;
  uint64_t v59 = type metadata accessor for SessionKeyManager.State.EarlySecret();
  uint64_t v30 = *(int *)(v59 + 36);
  uint64_t v72 = a1;
  uint64_t v65 = v22;
  uint64_t v66 = v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v29, a1 + v30, v21);
  unint64_t v63 = a4;
  if (v61)
  {
    uint64_t v31 = AssociatedTypeWitness;
    swift_getAssociatedConformanceWitness();
    size_t v32 = dispatch thunk of static Digest.byteCount.getter();
    uint64_t v33 = specialized Array.init(repeating:count:)(0, v32);
    uint64_t v76 = v33;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UInt8]);
    lazy protocol witness table accessor for type [UInt8] and conformance <A> [A](&lazy protocol witness table cache variable for type [UInt8] and conformance <A> [A]);
    uint64_t v34 = v75;
    SymmetricKey.init<A>(data:)();
    uint64_t v76 = v33;
    lazy protocol witness table accessor for type [UInt8] and conformance <A> [A]((unint64_t *)&lazy protocol witness table cache variable for type [UInt8] and conformance <A> [A]);
    static HKDF.extract<A>(inputKeyMaterial:salt:)();
    swift_bridgeObjectRelease();
    uint64_t v35 = (uint64_t)v69;
    static HashFunction.zeroHash.getter(a7);
    unint64_t v36 = v67;
    swift_getWitnessTable();
    static HKDF.deriveSecret<A>(secret:label:transcriptHash:)((int64_t)v20, 0x64657669726564, 0xE700000000000000, v35, a7, v36);
    (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v35, v31);
    (*(void (**)(char *, unint64_t))(v68 + 8))(v20, v36);
    uint64_t v37 = v65;
    uint64_t v38 = *(void (**)(char *, uint64_t))(v65 + 8);
    int v39 = v34;
    uint64_t v40 = v66;
    v38(v39, v66);
    v38(v29, v40);
    a4 = v63;
    (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v29, v25, v40);
  }
  static HKDF.extract(inputKeyMaterial:salt:)();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a7 - 8) + 16))(a8, v72, a7);
  uint64_t v41 = 0;
  switch(a4 >> 62)
  {
    case 1uLL:
      uint64_t v41 = v74 >> 32;
      break;
    case 2uLL:
      uint64_t v41 = *(void *)(v74 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v41 = BYTE6(a4);
      break;
  }
  if (v41 < (uint64_t)v62)
  {
    __break(1u);
    JUMPOUT(0x1B5769410);
  }
  uint64_t v42 = Data._Representation.subscript.getter();
  unint64_t v44 = v43;
  uint64_t v76 = v42;
  unint64_t v77 = v43;
  lazy protocol witness table accessor for type Data and conformance Data();
  uint64_t v62 = v29;
  HashFunction.update<A>(data:)();
  outlined consume of Data._Representation(v42, v44);
  uint64_t v45 = (uint64_t)v69;
  dispatch thunk of HashFunction.finalize()();
  uint64_t v61 = type metadata accessor for SessionKeyManager.State.HandshakeSecret();
  unint64_t v46 = v67;
  swift_getWitnessTable();
  uint64_t v48 = v70;
  int64_t v47 = v71;
  uint64_t v58 = a8;
  static HKDF.deriveSecret<A>(secret:label:transcriptHash:)(v71, 0x6172742073682063, 0xEC00000063696666, v45, a7, v46);
  static HKDF.deriveSecret<A>(secret:label:transcriptHash:)(v47, 0x6172742073682073, 0xEC00000063696666, v45, a7, v46);
  uint64_t v49 = (uint64_t)v60;
  static HashFunction.zeroHash.getter(a7);
  static HKDF.deriveSecret<A>(secret:label:transcriptHash:)(v47, 0x64657669726564, 0xE700000000000000, v49, a7, v46);
  outlined consume of Data._Representation(v74, v63);
  uint64_t v51 = v65;
  uint64_t v50 = v66;
  uint64_t v52 = *(void (**)(uint64_t, uint64_t))(v65 + 8);
  v52(v73, v66);
  (*(void (**)(uint64_t))(*(void *)(v59 - 8) + 8))(v72);
  uint64_t v53 = *(void (**)(uint64_t, uint64_t))(v48 + 8);
  uint64_t v54 = v49;
  uint64_t v55 = AssociatedTypeWitness;
  v53(v54, AssociatedTypeWitness);
  v53(v45, v55);
  (*(void (**)(int64_t, unint64_t))(v68 + 8))(v47, v46);
  v52((uint64_t)v62, v50);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v51 + 32))(v58 + *(int *)(v61 + 36), v75, v50);
}

uint64_t SessionKeyManager.State.logDescription.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v2 + 16))(v4);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v6 = 0x636553796C726165;
  uint64_t result = 1701602409;
  switch(EnumCaseMultiPayload)
  {
    case 1:
      uint64_t v6 = 0x6B616873646E6168;
      goto LABEL_5;
    case 2:
      uint64_t v6 = 0x655372657473616DLL;
      goto LABEL_5;
    case 3:
      uint64_t v6 = 0x65726365536C6C61;
      goto LABEL_5;
    case 4:
      return result;
    default:
LABEL_5:
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, a1);
      return v6;
  }
}

void Logger.logInvalidStateTransition(stateName:event:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  oslog = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v12 = v10;
    *(_DWORD *)uint64_t v9 = 136446466;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v9 + 12) = 2082;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a3, a4, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1B56C5000, oslog, v8, "invalid state transition for session key manager: state %{public}s event: %{public}s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1BA99F280](v10, -1, -1);
    MEMORY[0x1BA99F280](v9, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
}

uint64_t SessionKeyManager.State.MasterSecret.init(handshakeSecret:serverFinishedBytes:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v48 = a4;
  unint64_t v49 = a3;
  uint64_t v50 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v45 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1F4188790](AssociatedTypeWitness);
  unint64_t v44 = (char *)&v37 - v10;
  uint64_t v11 = type metadata accessor for HashedAuthenticationCode();
  MEMORY[0x1F4188790](v11);
  uint64_t v41 = type metadata accessor for SymmetricKey();
  uint64_t v12 = *(void *)(v41 - 8);
  uint64_t v13 = MEMORY[0x1F4188790](v41);
  unint64_t v43 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char *)&v37 - v15;
  swift_getAssociatedConformanceWitness();
  uint64_t v46 = AssociatedTypeWitness;
  size_t v17 = dispatch thunk of static Digest.byteCount.getter();
  uint64_t v51 = specialized Array.init(repeating:count:)(0, v17);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UInt8]);
  lazy protocol witness table accessor for type [UInt8] and conformance <A> [A](&lazy protocol witness table cache variable for type [UInt8] and conformance <A> [A]);
  SymmetricKey.init<A>(data:)();
  uint64_t v18 = type metadata accessor for SessionKeyManager.State.HandshakeSecret();
  uint64_t v42 = v16;
  static HKDF.extract(inputKeyMaterial:salt:)();
  uint64_t v19 = (int *)type metadata accessor for SessionKeyManager.State.MasterSecret();
  int64_t v20 = a6 + v19[9];
  swift_getWitnessTable();
  int64_t v40 = v20;
  SymmetricKey.init<A>(data:)();
  uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a5 - 8) + 16);
  uint64_t v22 = a6;
  uint64_t v47 = a1;
  v21(a6, a1, a5);
  uint64_t v23 = 0;
  switch(v49 >> 62)
  {
    case 1uLL:
      uint64_t v23 = v50 >> 32;
      break;
    case 2uLL:
      uint64_t v23 = *(void *)(v50 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v23 = BYTE6(v49);
      break;
  }
  if (v23 < v48)
  {
    __break(1u);
    JUMPOUT(0x1B5769D50);
  }
  uint64_t v24 = Data._Representation.subscript.getter();
  unint64_t v26 = v25;
  uint64_t v51 = v24;
  unint64_t v52 = v25;
  lazy protocol witness table accessor for type Data and conformance Data();
  HashFunction.update<A>(data:)();
  outlined consume of Data._Representation(v24, v26);
  uint64_t v27 = (uint64_t)v44;
  dispatch thunk of HashFunction.finalize()();
  uint64_t v28 = *(int *)(v18 + 40);
  uint64_t v38 = v18;
  uint64_t v39 = v12;
  uint64_t v29 = v47;
  uint64_t v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
  unint64_t v31 = v41;
  v30(v22 + v19[10], v47 + v28, v41);
  uint64_t v32 = v29;
  v30(v22 + v19[11], v29 + *(int *)(v18 + 44), v31);
  lazy protocol witness table accessor for type SymmetricKey and conformance SymmetricKey();
  int64_t v33 = v40;
  static HKDF.deriveSecret<A>(secret:label:transcriptHash:)(v40, 0x6172742070612063, 0xEC00000063696666, v27, a5, v31);
  static HKDF.deriveSecret<A>(secret:label:transcriptHash:)(v33, 0x6172742070612073, 0xEC00000063696666, v27, a5, v31);
  uint64_t v34 = v43;
  static HKDF.deriveSecret<A>(secret:label:transcriptHash:)(v33, 0x7473616D20707865, 0xEA00000000007265, v27, a5, v31);
  outlined consume of Data._Representation(v50, v49);
  (*(void (**)(uint64_t))(*(void *)(v38 - 8) + 8))(v32);
  (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v27, v46);
  uint64_t v35 = v39;
  (*(void (**)(char *, unint64_t))(v39 + 8))(v42, v31);
  return (*(uint64_t (**)(uint64_t, char *, unint64_t))(v35 + 32))(v22 + v19[14], v34, v31);
}

uint64_t SessionKeyManager.State.AllSecrets.init(masterSecret:clientFinishedBytes:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v48 = a4;
  uint64_t v49 = a2;
  unint64_t v50 = a3;
  uint64_t v11 = type metadata accessor for SymmetricKey();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v45 = (char *)v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v43 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v44 = AssociatedTypeWitness;
  uint64_t v15 = MEMORY[0x1F4188790](AssociatedTypeWitness);
  v41[0] = (char *)v41 - v16;
  uint64_t v51 = *(void *)(a5 - 8);
  MEMORY[0x1F4188790](v15);
  uint64_t v18 = (char *)v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = (int *)type metadata accessor for SessionKeyManager.State.MasterSecret();
  uint64_t v20 = a1 + v19[12];
  uint64_t v46 = v12;
  uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
  v21(a7, v20, v11);
  uint64_t v22 = a1 + v19[13];
  v41[1] = a6;
  uint64_t v23 = type metadata accessor for SessionKeyManager.State.AllSecrets();
  v21(a7 + *(int *)(v23 + 36), v22, v11);
  uint64_t v24 = a1 + v19[14];
  uint64_t v25 = *(int *)(v23 + 40);
  uint64_t v47 = a7;
  unint64_t v42 = v11;
  v21(a7 + v25, v24, v11);
  unint64_t v26 = v50;
  uint64_t v27 = v18;
  uint64_t v28 = v18;
  uint64_t v29 = a1;
  (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v28, a1, a5);
  uint64_t v30 = 0;
  uint64_t v31 = v49;
  switch(v26 >> 62)
  {
    case 1uLL:
      uint64_t v30 = v49 >> 32;
      break;
    case 2uLL:
      uint64_t v30 = *(void *)(v49 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v30 = BYTE6(v26);
      break;
  }
  if (v30 < v48)
  {
    __break(1u);
    JUMPOUT(0x1B576A194);
  }
  uint64_t v32 = Data._Representation.subscript.getter();
  unint64_t v34 = v33;
  uint64_t v52 = v32;
  unint64_t v53 = v33;
  lazy protocol witness table accessor for type Data and conformance Data();
  uint64_t v48 = v23;
  HashFunction.update<A>(data:)();
  outlined consume of Data._Representation(v32, v34);
  uint64_t v35 = v41[0];
  dispatch thunk of HashFunction.finalize()();
  uint64_t v36 = v29;
  int64_t v37 = v29 + v19[9];
  lazy protocol witness table accessor for type SymmetricKey and conformance SymmetricKey();
  uint64_t v38 = v45;
  unint64_t v39 = v42;
  static HKDF.deriveSecret<A>(secret:label:transcriptHash:)(v37, 0x7473616D20736572, 0xEA00000000007265, v35, a5, v42);
  outlined consume of Data._Representation(v31, v50);
  (*(void (**)(uint64_t, int *))(*((void *)v19 - 1) + 8))(v36, v19);
  (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v35, v44);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v27, a5);
  return (*(uint64_t (**)(uint64_t, char *, unint64_t))(v46 + 32))(v47 + *(int *)(v48 + 44), v38, v39);
}

uint64_t SessionKeyManager.State.HandshakeSecret.dataToSignInServerCertificateVerify.getter()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v1 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1F4188790](AssociatedTypeWitness);
  uint64_t v3 = &v6[-v2];
  long long v9 = xmmword_1B577F280;
  uint64_t v10 = 0;
  specialized Data.append<A>(contentsOf:)(64);
  specialized Data.append<A>(contentsOf:)(0xD000000000000021, 0x80000001B57826A0);
  if ((0x80000001B57826A0 & 0x1000000000000000) != 0) {
    String.UTF8View._foreignCount()();
  }
  char v7 = 0;
  v8[3] = MEMORY[0x1E4FBB2B8];
  v8[4] = MEMORY[0x1E4F27EF0];
  v8[0] = &v7;
  v8[1] = v8;
  __swift_project_boxed_opaque_existential_1(v8, MEMORY[0x1E4FBB2B8]);
  Data._Representation.append(contentsOf:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  uint64_t v4 = dispatch thunk of HashFunction.finalize()();
  MEMORY[0x1F4188790](v4);
  *(void *)&v6[-16] = &v9;
  swift_getAssociatedConformanceWitness();
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
  (*(void (**)(unsigned char *, uint64_t))(v1 + 8))(v3, AssociatedTypeWitness);
  return v9;
}

uint64_t type metadata accessor for SessionKeyManager.State.EarlySecret()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for SessionKeyManager.State.MasterSecret()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for SessionKeyManager.State.AllSecrets()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t SessionKeyManager.State.HandshakeSecret.serverFinishedPayload.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v18 = a2;
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v17 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1F4188790](AssociatedTypeWitness);
  char v7 = (char *)&v15 - v6;
  unint64_t v16 = type metadata accessor for SymmetricKey();
  uint64_t v8 = *(void *)(v16 - 8);
  MEMORY[0x1F4188790](v16);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v15 = v2 + *(int *)(a1 + 44);
  uint64_t v19 = MEMORY[0x1E4FBC860];
  swift_getAssociatedConformanceWitness();
  unint64_t v11 = dispatch thunk of static Digest.byteCount.getter();
  char v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UInt8]);
  lazy protocol witness table accessor for type SymmetricKey and conformance SymmetricKey();
  lazy protocol witness table accessor for type [UInt8] and conformance <A> [A](&lazy protocol witness table cache variable for type [UInt8] and conformance <A> [A]);
  unint64_t v13 = v16;
  static HKDF.expandLabel<A, B>(secret:label:context:length:)(v15, 0x64656873696E6966, 0xE800000000000000, (uint64_t)&v19, v11, v4, v16, v12);
  dispatch thunk of HashFunction.finalize()();
  static HMAC.authenticationCode<A>(bytes:using:)();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v7, AssociatedTypeWitness);
  return (*(uint64_t (**)(char *, unint64_t))(v8 + 8))(v10, v13);
}

uint64_t SessionKeyManager.addPreClientFinishedMessageToTransportHash(_:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v22 = a3;
  unint64_t v21 = a2;
  uint64_t v6 = type metadata accessor for SessionKeyManager.State.MasterSecret();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v20 - v8;
  uint64_t v10 = type metadata accessor for SessionKeyManager.State();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  unint64_t v13 = (char *)&v20 - v12;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))((char *)&v20 - v12, v4, v10);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 2u:
      uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
      v19(v9, v13, v6);
      SessionKeyManager.State.HandshakeSecret.addMessageToTranscriptHash(_:)(a1, v21, v22);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v4, v10);
      v19(v4, v9, v6);
      uint64_t result = swift_storeEnumTagMultiPayload();
      break;
    case 4u:
      goto LABEL_3;
    default:
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
LABEL_3:
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      uint64_t v14 = type metadata accessor for Logger();
      __swift_project_value_buffer(v14, (uint64_t)logger);
      uint64_t v15 = SessionKeyManager.State.logDescription.getter(v10);
      Logger.logInvalidStateTransition(stateName:event:)(v15, v16, 0xD000000000000012, 0x80000001B5782F10);
      swift_bridgeObjectRelease();
      lazy protocol witness table accessor for type TLSError and conformance TLSError();
      swift_allocError();
      *(_DWORD *)uint64_t v17 = 2;
      *(unsigned char *)(v17 + 4) = 1;
      uint64_t result = swift_willThrow();
      break;
  }
  return result;
}

uint64_t SessionKeyManager.State.HandshakeSecret.addMessageToTranscriptHash(_:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unsigned __int8 v3 = BYTE6(a2);
  unint64_t v4 = a2 >> 62;
  uint64_t v5 = 0;
  switch(v4)
  {
    case 1uLL:
      uint64_t v5 = a1 >> 32;
      break;
    case 2uLL:
      uint64_t v5 = *(void *)(a1 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v5 = v3;
      break;
  }
  if (v5 < a3)
  {
    __break(1u);
    JUMPOUT(0x1B576AAACLL);
  }
  uint64_t v6 = Data._Representation.subscript.getter();
  unint64_t v8 = v7;
  lazy protocol witness table accessor for type Data and conformance Data();
  HashFunction.update<A>(data:)();
  return outlined consume of Data._Representation(v6, v8);
}

uint64_t SessionKeyManager.State.MasterSecret.clientFinishedPayload.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v18 = a2;
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v17 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1F4188790](AssociatedTypeWitness);
  unint64_t v7 = (char *)&v15 - v6;
  unint64_t v16 = type metadata accessor for SymmetricKey();
  uint64_t v8 = *(void *)(v16 - 8);
  MEMORY[0x1F4188790](v16);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v15 = v2 + *(int *)(a1 + 40);
  uint64_t v19 = MEMORY[0x1E4FBC860];
  swift_getAssociatedConformanceWitness();
  unint64_t v11 = dispatch thunk of static Digest.byteCount.getter();
  char v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UInt8]);
  lazy protocol witness table accessor for type SymmetricKey and conformance SymmetricKey();
  lazy protocol witness table accessor for type [UInt8] and conformance <A> [A](&lazy protocol witness table cache variable for type [UInt8] and conformance <A> [A]);
  unint64_t v13 = v16;
  static HKDF.expandLabel<A, B>(secret:label:context:length:)(v15, 0x64656873696E6966, 0xE800000000000000, (uint64_t)&v19, v11, v4, v16, v12);
  dispatch thunk of HashFunction.finalize()();
  static HMAC.authenticationCode<A>(bytes:using:)();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v7, AssociatedTypeWitness);
  return (*(uint64_t (**)(char *, unint64_t))(v8 + 8))(v10, v13);
}

uint64_t SessionKeyManager.State.AllSecrets.generateSessionTicketPSK(ticketNonce:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned __int8 v6 = BYTE6(a2);
  unint64_t v7 = a2 >> 62;
  uint64_t v8 = 0;
  switch(v7)
  {
    case 1uLL:
      uint64_t v8 = a1 >> 32;
      break;
    case 2uLL:
      uint64_t v8 = *(void *)(a1 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v8 = v6;
      break;
  }
  if (v8 < a3)
  {
    __break(1u);
    JUMPOUT(0x1B576AEC4);
  }
  int64_t v9 = v4 + *(int *)(a4 + 44);
  uint64_t v10 = Data._Representation.subscript.getter();
  unint64_t v12 = v11;
  v17[0] = v10;
  v17[1] = v11;
  uint64_t v13 = *(void *)(a4 + 16);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  unint64_t v14 = dispatch thunk of static Digest.byteCount.getter();
  unint64_t v15 = type metadata accessor for SymmetricKey();
  lazy protocol witness table accessor for type SymmetricKey and conformance SymmetricKey();
  static HKDF.expandLabel<A, B>(secret:label:context:length:)(v9, 0x6974706D75736572, 0xEA00000000006E6FLL, (uint64_t)v17, v14, v13, v15, MEMORY[0x1E4F277C0]);
  return outlined consume of Data._Representation(v10, v12);
}

uint64_t closure #1 in SessionKeyManager.generateHashForAuthenticator(transcript:)(uint64_t a1, uint64_t a2)
{
  return closure #1 in ExportedAuthenticator.validate(keyParser:)(a1, a2);
}

uint64_t SessionKeyManager.State.EarlySecret.init(transcriptHasher:derivedSecret:binderKey:clientEarlyTrafficSecret:earlyExporterMasterSecret:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a6 - 8) + 32))(a7, a1, a6);
  unint64_t v12 = (int *)type metadata accessor for SessionKeyManager.State.EarlySecret();
  uint64_t v13 = a7 + v12[9];
  uint64_t v14 = type metadata accessor for SymmetricKey();
  uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t, uint64_t))v17)((void *)(v14 - 8), v13, a2, v14);
  v17(a7 + v12[10], a3, v14);
  v17(a7 + v12[11], a4, v14);
  uint64_t v15 = a7 + v12[12];

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v17)(v15, a5, v14);
}

uint64_t specialized Array.init(repeating:count:)(int a1, size_t a2)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    if (!a2) {
      return MEMORY[0x1E4FBC860];
    }
    uint64_t v4 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)(v4 + 16) = a2;
    memset((void *)(v4 + 32), a1, a2);
    return v4;
  }
  return result;
}

uint64_t static SessionKeyManager.State.EarlySecret.tryToResume(session:binderSecret:clientHello:currentTime:)(unint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = type metadata accessor for HashedAuthenticationCode();
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (uint64_t *)((char *)&v80 - v12);
  unint64_t v100 = type metadata accessor for SymmetricKey();
  uint64_t v14 = *(void *)(v100 - 8);
  MEMORY[0x1F4188790](v100);
  __int16 v99 = (char *)&v80 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = a5;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v17 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1F4188790](AssociatedTypeWitness);
  uint64_t v98 = (char *)&v80 - v18;
  Date.timeIntervalSince(_:)();
  double v20 = v19 * 1000.0;
  if ((~*(void *)&v20 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_60;
  }
  if (v20 <= -1.0)
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  if (v20 >= 4294967300.0)
  {
LABEL_61:
    __break(1u);
LABEL_62:
    a6 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, a6[2] + 1, 1, a6);
    goto LABEL_8;
  }
  unint64_t v93 = a2;
  uint64_t v94 = v13;
  uint64_t v95 = v11;
  uint64_t v85 = v14;
  unsigned int v21 = v20;
  uint64_t v22 = type metadata accessor for SessionTicket();
  unsigned int v104 = *(_DWORD *)(a1 + *(int *)(v22 + 24)) + v21;
  uint64_t v23 = (uint64_t *)(a1 + *(int *)(v22 + 32));
  uint64_t v11 = *v23;
  a2 = v23[1];
  uint64_t v103 = v23[2];
  outlined copy of Data._Representation(v11, a2);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v96 = AssociatedTypeWitness;
  uint64_t v91 = AssociatedConformanceWitness;
  uint64_t v25 = dispatch thunk of static Digest.byteCount.getter();
  uint64_t v117 = specialized Data._Representation.init(count:)(v25);
  *(void *)&long long v118 = v26;
  specialized Data._Representation.withUnsafeMutableBytes<A>(_:)(&v117, 0);
  uint64_t v107 = v117;
  unint64_t v105 = v118;
  uint64_t v27 = 0;
  uint64_t AssociatedTypeWitness = v17;
  char v92 = a6;
  switch((unint64_t)v118 >> 62)
  {
    case 1uLL:
      uint64_t v27 = (int)v107;
      break;
    case 2uLL:
      uint64_t v27 = *(void *)(v107 + 16);
      break;
    default:
      break;
  }
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Extension.PreSharedKey.OfferedPSKs.PSKIdentity>);
  uint64_t v28 = swift_allocObject();
  long long v108 = xmmword_1B577F940;
  *(_OWORD *)(v28 + 16) = xmmword_1B577F940;
  *(void *)(v28 + 32) = v11;
  *(void *)(v28 + 40) = a2;
  *(void *)(v28 + 48) = v103;
  *(_DWORD *)(v28 + 56) = v104;
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Extension.PreSharedKey.OfferedPSKs.PSKBinderEntry>);
  a1 = swift_allocObject();
  *(_OWORD *)(a1 + 16) = v108;
  uint64_t v29 = v107;
  unint64_t v30 = v105;
  *(void *)(a1 + 32) = v107;
  *(void *)(a1 + 40) = v30;
  *(void *)(a1 + 48) = v27;
  a6 = *(void **)(a3 + 96);
  outlined copy of Data._Representation(v11, a2);
  uint64_t v102 = v28;
  swift_bridgeObjectRetain();
  unint64_t v101 = a1;
  swift_bridgeObjectRetain();
  outlined copy of Data._Representation(v29, v30);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_62;
  }
LABEL_8:
  unint64_t v32 = a6[2];
  unint64_t v31 = a6[3];
  unint64_t v97 = a2;
  uint64_t v84 = AssociatedTypeWitness;
  uint64_t v90 = v11;
  if (v32 >= v31 >> 1) {
    a6 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v31 > 1), v32 + 1, 1, a6);
  }
  a6[2] = v32 + 1;
  unint64_t v33 = &a6[5 * v32];
  unint64_t v34 = v101;
  v33[4] = v102;
  v33[5] = v34;
  v33[6] = 0;
  v33[7] = 0;
  *((unsigned char *)v33 + 64) = 11;
  long long v115 = xmmword_1B577F280;
  uint64_t v116 = 0;
  uint64_t v35 = *(void *)(a3 + 72);
  uint64_t v36 = *(void *)(a3 + 80);
  uint64_t v37 = *(void *)(a3 + 88);
  LOWORD(v117) = *(_WORD *)a3;
  long long v118 = *(_OWORD *)(a3 + 8);
  long long v119 = *(_OWORD *)(a3 + 24);
  long long v120 = *(_OWORD *)(a3 + 40);
  uint64_t v86 = a3;
  long long v121 = *(_OWORD *)(a3 + 56);
  uint64_t v122 = v35;
  uint64_t v123 = v36;
  uint64_t v124 = v37;
  v125 = a6;
  LOBYTE(v109) = 1;
  uint64_t v38 = MEMORY[0x1E4FBB2B8];
  unint64_t v39 = MEMORY[0x1E4F27EF0];
  uint64_t v113 = MEMORY[0x1E4FBB2B8];
  unint64_t v114 = MEMORY[0x1E4F27EF0];
  uint64_t v111 = &v109;
  uint64_t v112 = (char *)&v109 + 1;
  __swift_project_boxed_opaque_existential_1(&v111, MEMORY[0x1E4FBB2B8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  Data._Representation.append(contentsOf:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v111);
  uint64_t v40 = v96;
  uint64_t v41 = 0;
  switch(*((void *)&v115 + 1) >> 62)
  {
    case 1:
      uint64_t v41 = (uint64_t)v115 >> 32;
      break;
    case 2:
      uint64_t v41 = *(void *)(v115 + 24);
      break;
    case 3:
      break;
    default:
      uint64_t v41 = BYTE14(v115);
      break;
  }
  LOBYTE(v109) = 0;
  unint64_t v42 = &v109;
  uint64_t v113 = v38;
  unint64_t v114 = v39;
  uint64_t v111 = &v109;
  uint64_t v112 = (char *)&v109 + 1;
  __swift_project_boxed_opaque_existential_1(&v111, v38);
  Data._Representation.append(contentsOf:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v111);
  __int16 v109 = 0;
  uint64_t v113 = v38;
  unint64_t v114 = v39;
  uint64_t v111 = &v109;
  uint64_t v112 = &v110;
  __swift_project_boxed_opaque_existential_1(&v111, v38);
  Data._Representation.append(contentsOf:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v111);
  uint64_t v43 = &v117;
  int64_t v44 = ClientHello.write(into:)((uint64_t *)&v115);
  if (v44 > 0xFFFFFF)
  {
    __break(1u);
  }
  else
  {
    unint64_t v42 = (__int16 *)v44;
    uint64_t v43 = (uint64_t *)&v115;
    uint64_t v45 = specialized ByteBuffer.setInteger<A>(_:at:as:)(SBYTE2(v44), v41);
    if (!__OFADD__(v41, v45))
    {
      specialized ByteBuffer.setInteger<A>(_:at:as:)(v42, v41 + v45);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v47 = *((void *)&v115 + 1);
      uint64_t v46 = v115;
      uint64_t v48 = v116;
      unint64_t v49 = *((void *)&v115 + 1);
      uint64_t v87 = *((void *)&v115 + 1) >> 62;
      switch(*((void *)&v115 + 1) >> 62)
      {
        case 1:
          if ((uint64_t)v115 >> 32 < v116) {
            goto LABEL_70;
          }
          if (v116 < (int)v115) {
            goto LABEL_71;
          }
          if (v116) {
            goto LABEL_23;
          }
          if (!DWORD1(v115)) {
            goto LABEL_45;
          }
          if ((uint64_t)v115 > 0xEFFFFFFFFLL)
          {
LABEL_23:
            if (SDWORD1(v115) < (int)v116)
            {
LABEL_75:
              __break(1u);
LABEL_76:
              __break(1u);
LABEL_77:
              __break(1u);
            }
            uint64_t v50 = v115 & 0xFFFFFFFF00000000 | v116;
            outlined copy of Data._Representation(v115, *((unint64_t *)&v115 + 1));
            unint64_t v49 = v47 & 0x3FFFFFFFFFFFFFFFLL | 0x4000000000000000;
          }
          else
          {
            outlined copy of Data._Representation(v115, *((unint64_t *)&v115 + 1));
            uint64_t v50 = specialized Data.InlineData.init(_:count:)(v46, v47 & 0x3FFFFFFFFFFFFFFFLL, v46 >> 32);
            uint64_t v57 = v56;
            outlined consume of Data._Representation(v46, v49);
            unint64_t v49 = v57 & 0xFFFFFFFFFFFFFFLL;
          }
LABEL_46:
          uint64_t v80 = v47;
          uint64_t v81 = v46;
          uint64_t v60 = dispatch thunk of static Digest.byteCount.getter();
          specialized BidirectionalCollection.dropLast(_:)(v60 + 3, v50, v49, (uint64_t *)&v111);
          uint64_t v83 = v111;
          uint64_t v82 = v112;
          lazy protocol witness table accessor for type Data and conformance Data();
          uint64_t v61 = v106;
          uint64_t v37 = (uint64_t)v92;
          static HashFunction.hash<A>(data:)();
          uint64_t v111 = (__int16 *)MEMORY[0x1E4FBC860];
          unint64_t v62 = dispatch thunk of static Digest.byteCount.getter();
          char v63 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UInt8]);
          lazy protocol witness table accessor for type SymmetricKey and conformance SymmetricKey();
          lazy protocol witness table accessor for type [UInt8] and conformance <A> [A](&lazy protocol witness table cache variable for type [UInt8] and conformance <A> [A]);
          a1 = (unint64_t)v99;
          static HKDF.expandLabel<A, B>(secret:label:context:length:)(v93, 0x64656873696E6966, 0xE800000000000000, (uint64_t)&v111, v62, v61, v100, v63);
          uint64_t v43 = v94;
          uint64_t v38 = v40;
          static HMAC.authenticationCode<A>(bytes:using:)();
          uint64_t v64 = v95;
          swift_getWitnessTable();
          uint64_t v36 = ByteBuffer.init<A>(bytes:)((uint64_t)v43, v64);
          unint64_t v39 = v65;
          uint64_t v67 = v66;
          unint64_t v42 = (__int16 *)(v65 >> 62);
          outlined copy of Data._Representation(v36, v65);
          outlined consume of Data._Representation(v107, v105);
          uint64_t v68 = 0;
          switch((int)v87)
          {
            case 1:
              uint64_t v68 = v81 >> 32;
              break;
            case 2:
              uint64_t v68 = *(void *)(v81 + 24);
              break;
            case 3:
              break;
            default:
              uint64_t v68 = BYTE6(v80);
              break;
          }
          uint64_t v69 = 0;
          switch((int)v42)
          {
            case 1:
              uint64_t v69 = v36 >> 32;
              break;
            case 2:
              uint64_t v69 = *(void *)(v36 + 24);
              break;
            case 3:
              break;
            default:
              uint64_t v69 = BYTE6(v39);
              break;
          }
          BOOL v70 = __OFSUB__(v69, v67);
          uint64_t v71 = v69 - v67;
          if (v70) {
            goto LABEL_65;
          }
          ByteBuffer.setImmutableBuffer(_:at:)(v36, v39, v67, v68 - v71);
          a1 = a6[2];
          uint64_t v43 = (uint64_t *)swift_allocObject();
          *((_OWORD *)v43 + 1) = v108;
          uint64_t v37 = v90;
          unint64_t v72 = v97;
          v43[4] = v90;
          v43[5] = v72;
          v43[6] = v103;
          *((_DWORD *)v43 + 14) = v104;
          unint64_t v42 = (__int16 *)swift_allocObject();
          *((_OWORD *)v42 + 1) = v108;
          *((void *)v42 + 4) = v36;
          *((void *)v42 + 5) = v39;
          *((void *)v42 + 6) = v67;
          outlined copy of Data._Representation(v37, v72);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            goto LABEL_66;
          }
          if (a1) {
            goto LABEL_57;
          }
          goto LABEL_67;
        case 2:
          int64_t v53 = *(void *)(v115 + 24);
          if (v53 < v116) {
            goto LABEL_72;
          }
          if (v116 < *(void *)(v115 + 16)) {
            goto LABEL_73;
          }
          uint64_t v54 = *((void *)&v115 + 1) & 0x3FFFFFFFFFFFFFFFLL;
          if (v116) {
            goto LABEL_28;
          }
          if (v53)
          {
            if (v53 > 14)
            {
LABEL_28:
              if (v116 > 2147483646 || v53 > 2147483646)
              {
                type metadata accessor for Data.RangeReference();
                uint64_t v50 = swift_allocObject();
                *(void *)(v50 + 16) = v48;
                *(void *)(v50 + 24) = v53;
                unint64_t v49 = v54 | 0x8000000000000000;
                swift_retain();
              }
              else
              {
                if (v116 < (uint64_t)0xFFFFFFFF80000000 || v53 < (uint64_t)0xFFFFFFFF80000000) {
                  goto LABEL_76;
                }
                if ((int)v53 < (int)v116) {
                  goto LABEL_77;
                }
                unint64_t v55 = v116 | ((unint64_t)v53 << 32);
                unint64_t v49 = v54 | 0x4000000000000000;
                swift_retain();
                uint64_t v50 = v55;
              }
            }
            else
            {
              swift_retain();
              swift_retain();
              uint64_t v50 = specialized Data.InlineData.init(_:count:)(v46, v47 & 0x3FFFFFFFFFFFFFFFLL, v53);
              uint64_t v59 = v58;
              swift_release();
              swift_release();
              unint64_t v49 = v59 & 0xFFFFFFFFFFFFFFLL;
            }
          }
          else
          {
LABEL_45:
            uint64_t v50 = 0;
            unint64_t v49 = 0xC000000000000000;
          }
          goto LABEL_46;
        case 3:
          outlined consume of Data._Representation(v115, *((unint64_t *)&v115 + 1));
          if (v48 > 0) {
            goto LABEL_74;
          }
          uint64_t v50 = v46;
          if (!v48) {
            goto LABEL_46;
          }
          __break(1u);
LABEL_37:
          outlined consume of Data._Representation(v46, v49);
          unint64_t v49 = v47 & 0xFFFFFFFFFFFFFFLL;
          uint64_t v50 = v46;
          goto LABEL_46;
        default:
          if (BYTE14(v115) < v116) {
            goto LABEL_69;
          }
          if (!v116) {
            goto LABEL_37;
          }
          uint64_t v50 = specialized Data.InlineSlice.init(_:range:)(v115, *((void *)&v115 + 1) & 0xFFFFFFFFFFFFFFLL, v116, BYTE14(v115));
          uint64_t v52 = v51;
          outlined consume of Data._Representation(v46, v49);
          unint64_t v49 = v52 | 0x4000000000000000;
          goto LABEL_46;
      }
    }
  }
  __break(1u);
LABEL_65:
  __break(1u);
LABEL_66:
  a6 = specialized _ArrayBuffer._consumeAndCreateNew()(a6);
  if (!a1)
  {
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
LABEL_57:
  if (a1 > a6[2])
  {
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    __break(1u);
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
LABEL_74:
    __break(1u);
    goto LABEL_75;
  }
  uint64_t v73 = (__int16 **)&a6[5 * a1];
  uint64_t v74 = (uint64_t)*(v73 - 1);
  unint64_t v75 = (unint64_t)*v73;
  unint64_t v76 = (unint64_t)v73[1];
  uint64_t v77 = (uint64_t)v73[2];
  *(v73 - 1) = (__int16 *)v43;
  *uint64_t v73 = v42;
  v73[1] = 0;
  v73[2] = 0;
  char v78 = *((unsigned char *)v73 + 24);
  *((unsigned char *)v73 + 24) = 11;
  outlined consume of Extension(v74, v75, v76, v77, v78);
  outlined consume of Data._Representation((uint64_t)v83, (unint64_t)v82);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation(v37, v97);
  *(void *)(v86 + 96) = a6;
  (*(void (**)(char *, unint64_t))(v85 + 8))(v99, v100);
  (*(void (**)(char *, uint64_t))(v84 + 8))(v98, v38);
  outlined consume of Data._Representation(v36, v39);
  return v115;
}

uint64_t specialized BidirectionalCollection.dropLast(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  if (a1 < 0)
  {
LABEL_14:
    __break(1u);
    JUMPOUT(0x1B576C024);
  }
  unint64_t v5 = a3 >> 62;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = a2 >> 32;
      uint64_t v8 = (int)a2;
      break;
    case 2uLL:
      uint64_t v8 = *(void *)(a2 + 16);
      uint64_t v9 = *(void *)(a2 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v8 = 0;
      uint64_t v9 = BYTE6(a3);
      break;
  }
  uint64_t v10 = -a1;
  uint64_t v11 = specialized RandomAccessCollection<>.distance(from:to:)(v9, v8, a2, a3);
  if (v11 > 0 || v11 <= v10)
  {
    uint64_t v12 = specialized RandomAccessCollection<>.index(_:offsetBy:)(v9, v10, a2, a3);
    uint64_t v13 = 0;
    switch((int)v5)
    {
      case 1:
        uint64_t v13 = (int)a2;
        break;
      case 2:
        uint64_t v13 = *(void *)(a2 + 16);
        break;
      default:
        break;
    }
    if (v12 < v13)
    {
      __break(1u);
      goto LABEL_14;
    }
  }
  uint64_t v14 = Data._Representation.subscript.getter();
  uint64_t v16 = v15;
  uint64_t result = outlined consume of Data._Representation(a2, a3);
  *a4 = v14;
  a4[1] = v16;
  return result;
}

uint64_t type metadata instantiation function for SessionKeyManager(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 24);
}

uint64_t type metadata completion function for SessionKeyManager()
{
  uint64_t result = type metadata accessor for SessionKeyManager.State();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for SessionKeyManager()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata instantiation function for SessionKeyManager.State.AllSecrets(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 32);
}

uint64_t type metadata completion function for SessionKeyManager.State.AllSecrets()
{
  uint64_t result = type metadata accessor for SymmetricKey();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for SessionKeyManager.State.AllSecrets(uint64_t *a1, uint64_t *a2, int *a3)
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
    uint64_t v7 = type metadata accessor for SymmetricKey();
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + a3[9]), (uint64_t *)((char *)a2 + a3[9]), v7);
    v8((uint64_t *)((char *)a1 + a3[10]), (uint64_t *)((char *)a2 + a3[10]), v7);
    v8((uint64_t *)((char *)a1 + a3[11]), (uint64_t *)((char *)a2 + a3[11]), v7);
  }
  return a1;
}

uint64_t destroy for SessionKeyManager.State.AllSecrets(uint64_t a1, int *a2)
{
  uint64_t v4 = type metadata accessor for SymmetricKey();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v7)((void *)(v4 - 8), a1, v4);
  v7(a1 + a2[9], v4);
  v7(a1 + a2[10], v4);
  uint64_t v5 = a1 + a2[11];

  return ((uint64_t (*)(uint64_t, uint64_t))v7)(v5, v4);
}

uint64_t initializeWithCopy for SessionKeyManager.State.AllSecrets(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SymmetricKey();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + a3[9], a2 + a3[9], v6);
  v7(a1 + a3[10], a2 + a3[10], v6);
  v7(a1 + a3[11], a2 + a3[11], v6);
  return a1;
}

uint64_t assignWithCopy for SessionKeyManager.State.AllSecrets(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SymmetricKey();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + a3[9], a2 + a3[9], v6);
  v7(a1 + a3[10], a2 + a3[10], v6);
  v7(a1 + a3[11], a2 + a3[11], v6);
  return a1;
}

uint64_t initializeWithTake for SessionKeyManager.State.AllSecrets(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SymmetricKey();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + a3[9], a2 + a3[9], v6);
  v7(a1 + a3[10], a2 + a3[10], v6);
  v7(a1 + a3[11], a2 + a3[11], v6);
  return a1;
}

uint64_t assignWithTake for SessionKeyManager.State.AllSecrets(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SymmetricKey();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + a3[9], a2 + a3[9], v6);
  v7(a1 + a3[10], a2 + a3[10], v6);
  v7(a1 + a3[11], a2 + a3[11], v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SessionKeyManager.State.AllSecrets(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B576C708);
}

uint64_t sub_1B576C708(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SymmetricKey();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for SessionKeyManager.State.AllSecrets(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B576C788);
}

uint64_t sub_1B576C788(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SymmetricKey();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata instantiation function for SessionKeyManager.State.MasterSecret(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 48);
}

uint64_t type metadata completion function for SessionKeyManager.State.MasterSecret()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for SymmetricKey();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for SessionKeyManager.State.MasterSecret(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = type metadata accessor for SymmetricKey();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(_DWORD *)(v9 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = (v7 + v10) & ~v10;
  uint64_t v13 = *(void *)(v9 + 64);
  uint64_t v14 = v13 + v10;
  unint64_t v15 = ((v13 + v10 + ((v13 + v10 + ((v13 + v10 + ((v13 + v10 + ((v13 + v10 + v12) & ~v10)) & ~v10)) & ~v10)) & ~v10)) & ~v10)
      + v13;
  uint64_t v16 = (*(unsigned char *)(v6 + 80) | *(unsigned char *)(v9 + 80));
  if (v16 > 7 || ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v9 + 80)) & 0x100000) != 0 || v15 > 0x18)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v16 + 16) & ~v16));
    swift_retain();
  }
  else
  {
    uint64_t v20 = v8;
    uint64_t v21 = ~v10;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    unint64_t v22 = ((unint64_t)a2 + v11) & v21;
    uint64_t v23 = *(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16);
    v23(((unint64_t)a1 + v11) & v21, v22, v20);
    unint64_t v24 = (v14 + v22) & v21;
    v23((v14 + (((unint64_t)a1 + v11) & v21)) & v21, v24, v20);
    unint64_t v25 = (v14 + v24) & v21;
    v23((v14 + ((v14 + (((unint64_t)a1 + v11) & v21)) & v21)) & v21, v25, v20);
    uint64_t v26 = (v14 + v25) & v21;
    v23((v14 + ((v14 + ((v14 + (((unint64_t)a1 + v11) & v21)) & v21)) & v21)) & v21, v26, v20);
    uint64_t v27 = (v14 + v26) & v21;
    v23((v14 + ((v14 + ((v14 + ((v14 + (((unint64_t)a1 + v11) & v21)) & v21)) & v21)) & v21)) & v21, v27, v20);
    v23((v14 + ((v14 + ((v14 + ((v14 + ((v14 + (((unint64_t)a1 + v11) & v21)) & v21)) & v21)) & v21)) & v21)) & v21, (v14 + v27) & v21, v20);
  }
  return a1;
}

uint64_t destroy for SessionKeyManager.State.MasterSecret(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v3)();
  uint64_t v4 = *(void *)(v3 + 56);
  uint64_t v5 = type metadata accessor for SymmetricKey();
  uint64_t v6 = *(void *)(v5 - 8);
  unint64_t v15 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  uint64_t v16 = v6 + 8;
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v4 + a1 + v7) & ~v7;
  v15(v8, v5);
  uint64_t v9 = *(void *)(v16 + 56) + v7;
  uint64_t v10 = (v9 + v8) & ~v7;
  v15(v10, v5);
  uint64_t v11 = (v9 + v10) & ~v7;
  v15(v11, v5);
  uint64_t v12 = (v9 + v11) & ~v7;
  v15(v12, v5);
  uint64_t v13 = (v9 + v12) & ~v7;
  v15(v13, v5);

  return ((uint64_t (*)(uint64_t, uint64_t))v15)((v9 + v13) & ~v7, v5);
}

uint64_t initializeWithCopy for SessionKeyManager.State.MasterSecret(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48);
  uint64_t v7 = type metadata accessor for SymmetricKey();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  uint64_t v10 = v8 + 16;
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = v6 + v11;
  uint64_t v13 = (v6 + v11 + a1) & ~v11;
  uint64_t v14 = (v12 + a2) & ~v11;
  v9(v13, v14, v7);
  uint64_t v15 = *(void *)(v10 + 48) + v11;
  uint64_t v16 = (v15 + v13) & ~v11;
  uint64_t v17 = (v15 + v14) & ~v11;
  v9(v16, v17, v7);
  uint64_t v18 = (v15 + v16) & ~v11;
  uint64_t v19 = (v15 + v17) & ~v11;
  v9(v18, v19, v7);
  uint64_t v20 = (v15 + v18) & ~v11;
  uint64_t v21 = (v15 + v19) & ~v11;
  v9(v20, v21, v7);
  uint64_t v22 = (v15 + v20) & ~v11;
  uint64_t v23 = (v15 + v21) & ~v11;
  v9(v22, v23, v7);
  v9((v15 + v22) & ~v11, (v15 + v23) & ~v11, v7);
  return a1;
}

uint64_t assignWithCopy for SessionKeyManager.State.MasterSecret(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40);
  uint64_t v7 = type metadata accessor for SymmetricKey();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 24);
  uint64_t v10 = v8 + 24;
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = v6 + v11;
  uint64_t v13 = (v6 + v11 + a1) & ~v11;
  uint64_t v14 = (v12 + a2) & ~v11;
  v9(v13, v14, v7);
  uint64_t v15 = *(void *)(v10 + 40) + v11;
  uint64_t v16 = (v15 + v13) & ~v11;
  uint64_t v17 = (v15 + v14) & ~v11;
  v9(v16, v17, v7);
  uint64_t v18 = (v15 + v16) & ~v11;
  uint64_t v19 = (v15 + v17) & ~v11;
  v9(v18, v19, v7);
  uint64_t v20 = (v15 + v18) & ~v11;
  uint64_t v21 = (v15 + v19) & ~v11;
  v9(v20, v21, v7);
  uint64_t v22 = (v15 + v20) & ~v11;
  uint64_t v23 = (v15 + v21) & ~v11;
  v9(v22, v23, v7);
  v9((v15 + v22) & ~v11, (v15 + v23) & ~v11, v7);
  return a1;
}

uint64_t initializeWithTake for SessionKeyManager.State.MasterSecret(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32);
  uint64_t v7 = type metadata accessor for SymmetricKey();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32);
  uint64_t v10 = v8 + 32;
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = v6 + v11;
  uint64_t v13 = (v6 + v11 + a1) & ~v11;
  uint64_t v14 = (v12 + a2) & ~v11;
  v9(v13, v14, v7);
  uint64_t v15 = *(void *)(v10 + 32) + v11;
  uint64_t v16 = (v15 + v13) & ~v11;
  uint64_t v17 = (v15 + v14) & ~v11;
  v9(v16, v17, v7);
  uint64_t v18 = (v15 + v16) & ~v11;
  uint64_t v19 = (v15 + v17) & ~v11;
  v9(v18, v19, v7);
  uint64_t v20 = (v15 + v18) & ~v11;
  uint64_t v21 = (v15 + v19) & ~v11;
  v9(v20, v21, v7);
  uint64_t v22 = (v15 + v20) & ~v11;
  uint64_t v23 = (v15 + v21) & ~v11;
  v9(v22, v23, v7);
  v9((v15 + v22) & ~v11, (v15 + v23) & ~v11, v7);
  return a1;
}

uint64_t assignWithTake for SessionKeyManager.State.MasterSecret(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24);
  uint64_t v7 = type metadata accessor for SymmetricKey();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 40);
  uint64_t v10 = v8 + 40;
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = v6 + v11;
  uint64_t v13 = (v6 + v11 + a1) & ~v11;
  uint64_t v14 = (v12 + a2) & ~v11;
  v9(v13, v14, v7);
  uint64_t v15 = *(void *)(v10 + 24) + v11;
  uint64_t v16 = (v15 + v13) & ~v11;
  uint64_t v17 = (v15 + v14) & ~v11;
  v9(v16, v17, v7);
  uint64_t v18 = (v15 + v16) & ~v11;
  uint64_t v19 = (v15 + v17) & ~v11;
  v9(v18, v19, v7);
  uint64_t v20 = (v15 + v18) & ~v11;
  uint64_t v21 = (v15 + v19) & ~v11;
  v9(v20, v21, v7);
  uint64_t v22 = (v15 + v20) & ~v11;
  uint64_t v23 = (v15 + v21) & ~v11;
  v9(v22, v23, v7);
  v9((v15 + v22) & ~v11, (v15 + v23) & ~v11, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for SessionKeyManager.State.MasterSecret(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  uint64_t v8 = type metadata accessor for SymmetricKey();
  uint64_t v9 = *(void *)(v8 - 8);
  unsigned int v10 = *(_DWORD *)(v9 + 84);
  if (v10 <= v7) {
    unsigned int v11 = v7;
  }
  else {
    unsigned int v11 = *(_DWORD *)(v9 + 84);
  }
  uint64_t v12 = *(unsigned __int8 *)(v9 + 80);
  if (!a2) {
    return 0;
  }
  uint64_t v14 = *(void *)(v6 + 64) + v12;
  if (a2 <= v11) {
    goto LABEL_24;
  }
  uint64_t v13 = *(void *)(*(void *)(v8 - 8) + 64);
  uint64_t v15 = ((v13
        + v12
        + ((v13 + v12 + ((v13 + v12 + ((v13 + v12 + ((v13 + v12 + (v14 & ~v12)) & ~v12)) & ~v12)) & ~v12)) & ~v12)) & ~v12)
      + v13;
  char v16 = 8 * v15;
  if (v15 <= 3)
  {
    unsigned int v18 = ((a2 - v11 + ~(-1 << v16)) >> v16) + 1;
    if (HIWORD(v18))
    {
      int v17 = *(_DWORD *)((char *)a1 + v15);
      if (!v17) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v18 > 0xFF)
    {
      int v17 = *(unsigned __int16 *)((char *)a1 + v15);
      if (!*(unsigned __int16 *)((char *)a1 + v15)) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v18 < 2)
    {
LABEL_24:
      if (v11)
      {
        if (v7 >= v10)
        {
          unint64_t v24 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v6 + 48);
          return v24(a1, v7, v5);
        }
        else
        {
          uint64_t v22 = *(uint64_t (**)(unint64_t))(v9 + 48);
          return v22(((unint64_t)a1 + v14) & ~v12);
        }
      }
      return 0;
    }
  }
  int v17 = *((unsigned __int8 *)a1 + v15);
  if (!*((unsigned char *)a1 + v15)) {
    goto LABEL_24;
  }
LABEL_14:
  int v19 = (v17 - 1) << v16;
  if (v15 > 3) {
    int v19 = 0;
  }
  if (v15)
  {
    if (v15 <= 3) {
      int v20 = v15;
    }
    else {
      int v20 = 4;
    }
    switch(v20)
    {
      case 2:
        int v21 = *a1;
        break;
      case 3:
        int v21 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v21 = *(_DWORD *)a1;
        break;
      default:
        int v21 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v21 = 0;
  }
  return v11 + (v21 | v19) + 1;
}

void storeEnumTagSinglePayload for SessionKeyManager.State.MasterSecret(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v25 = v8;
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  uint64_t v10 = *(void *)(type metadata accessor for SymmetricKey() - 8);
  uint64_t v11 = v10;
  unsigned int v12 = *(_DWORD *)(v10 + 84);
  if (v12 <= v9) {
    unsigned int v13 = v9;
  }
  else {
    unsigned int v13 = *(_DWORD *)(v10 + 84);
  }
  uint64_t v14 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v15 = *(void *)(v8 + 64) + v14;
  uint64_t v16 = *(void *)(v10 + 64);
  size_t v17 = ((v16
        + v14
        + ((v16 + v14 + ((v16 + v14 + ((v16 + v14 + ((v16 + v14 + (v15 & ~v14)) & ~v14)) & ~v14)) & ~v14)) & ~v14)) & ~v14)
      + v16;
  if (a3 <= v13)
  {
    int v18 = 0;
  }
  else if (v17 <= 3)
  {
    unsigned int v21 = ((a3 - v13 + ~(-1 << (8 * v17))) >> (8 * v17)) + 1;
    if (HIWORD(v21))
    {
      int v18 = 4;
    }
    else if (v21 >= 0x100)
    {
      int v18 = 2;
    }
    else
    {
      int v18 = v21 > 1;
    }
  }
  else
  {
    int v18 = 1;
  }
  if (v13 < a2)
  {
    unsigned int v19 = ~v13 + a2;
    if (v17 < 4)
    {
      int v20 = (v19 >> (8 * v17)) + 1;
      if (v17)
      {
        int v22 = v19 & ~(-1 << (8 * v17));
        bzero(a1, v17);
        if (v17 == 3)
        {
          *(_WORD *)a1 = v22;
          a1[2] = BYTE2(v22);
        }
        else if (v17 == 2)
        {
          *(_WORD *)a1 = v22;
        }
        else
        {
          *a1 = v22;
        }
      }
    }
    else
    {
      bzero(a1, v17);
      *(_DWORD *)a1 = v19;
      int v20 = 1;
    }
    switch(v18)
    {
      case 1:
        a1[v17] = v20;
        return;
      case 2:
        *(_WORD *)&a1[v17] = v20;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v17] = v20;
        return;
      default:
        return;
    }
  }
  switch(v18)
  {
    case 1:
      a1[v17] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v17] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x1B576D8BCLL);
    case 4:
      *(_DWORD *)&a1[v17] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if (v9 >= v12)
        {
          unint64_t v24 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v25 + 56);
          v24(a1, a2, v9, v7);
        }
        else
        {
          uint64_t v23 = *(void (**)(unint64_t, uint64_t))(v11 + 56);
          v23((unint64_t)&a1[v15] & ~v14, a2);
        }
      }
      return;
  }
}

uint64_t type metadata instantiation function for SessionKeyManager.State.EarlySecret(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 40);
}

uint64_t type metadata completion function for SessionKeyManager.State.EarlySecret()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for SymmetricKey();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for SessionKeyManager.State.EarlySecret(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = type metadata accessor for SymmetricKey();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(_DWORD *)(v9 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = (v7 + v10) & ~v10;
  uint64_t v13 = *(void *)(v9 + 64);
  uint64_t v14 = v13 + v10;
  unint64_t v15 = ((v13 + v10 + ((v13 + v10 + ((v13 + v10 + v12) & ~v10)) & ~v10)) & ~v10) + v13;
  uint64_t v16 = (*(unsigned char *)(v6 + 80) | *(unsigned char *)(v9 + 80));
  if (v16 > 7 || ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v9 + 80)) & 0x100000) != 0 || v15 > 0x18)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v16 + 16) & ~v16));
    swift_retain();
  }
  else
  {
    uint64_t v20 = v8;
    uint64_t v21 = ~v10;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    unint64_t v22 = ((unint64_t)a2 + v11) & v21;
    uint64_t v23 = *(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16);
    v23(((unint64_t)a1 + v11) & v21, v22, v20);
    unint64_t v24 = (v14 + v22) & v21;
    v23((v14 + (((unint64_t)a1 + v11) & v21)) & v21, v24, v20);
    unint64_t v25 = (v14 + v24) & v21;
    v23((v14 + ((v14 + (((unint64_t)a1 + v11) & v21)) & v21)) & v21, v25, v20);
    v23((v14 + ((v14 + ((v14 + (((unint64_t)a1 + v11) & v21)) & v21)) & v21)) & v21, (v14 + v25) & v21, v20);
  }
  return a1;
}

uint64_t destroy for SessionKeyManager.State.EarlySecret(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v3)();
  uint64_t v4 = *(void *)(v3 + 56);
  uint64_t v5 = type metadata accessor for SymmetricKey();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  uint64_t v14 = v6 + 8;
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v4 + a1 + v7) & ~v7;
  v13(v8, v5);
  uint64_t v9 = *(void *)(v14 + 56) + v7;
  uint64_t v10 = (v9 + v8) & ~v7;
  v13(v10, v5);
  uint64_t v11 = (v9 + v10) & ~v7;
  v13(v11, v5);

  return ((uint64_t (*)(uint64_t, uint64_t))v13)((v9 + v11) & ~v7, v5);
}

uint64_t initializeWithCopy for SessionKeyManager.State.EarlySecret(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48);
  uint64_t v7 = type metadata accessor for SymmetricKey();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  uint64_t v10 = v8 + 16;
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = v6 + v11;
  uint64_t v13 = (v6 + v11 + a1) & ~v11;
  uint64_t v14 = (v12 + a2) & ~v11;
  v9(v13, v14, v7);
  uint64_t v15 = *(void *)(v10 + 48) + v11;
  uint64_t v16 = (v15 + v13) & ~v11;
  uint64_t v17 = (v15 + v14) & ~v11;
  v9(v16, v17, v7);
  uint64_t v18 = (v15 + v16) & ~v11;
  uint64_t v19 = (v15 + v17) & ~v11;
  v9(v18, v19, v7);
  v9((v15 + v18) & ~v11, (v15 + v19) & ~v11, v7);
  return a1;
}

uint64_t assignWithCopy for SessionKeyManager.State.EarlySecret(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40);
  uint64_t v7 = type metadata accessor for SymmetricKey();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 24);
  uint64_t v10 = v8 + 24;
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = v6 + v11;
  uint64_t v13 = (v6 + v11 + a1) & ~v11;
  uint64_t v14 = (v12 + a2) & ~v11;
  v9(v13, v14, v7);
  uint64_t v15 = *(void *)(v10 + 40) + v11;
  uint64_t v16 = (v15 + v13) & ~v11;
  uint64_t v17 = (v15 + v14) & ~v11;
  v9(v16, v17, v7);
  uint64_t v18 = (v15 + v16) & ~v11;
  uint64_t v19 = (v15 + v17) & ~v11;
  v9(v18, v19, v7);
  v9((v15 + v18) & ~v11, (v15 + v19) & ~v11, v7);
  return a1;
}

uint64_t initializeWithTake for SessionKeyManager.State.EarlySecret(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32);
  uint64_t v7 = type metadata accessor for SymmetricKey();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32);
  uint64_t v10 = v8 + 32;
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = v6 + v11;
  uint64_t v13 = (v6 + v11 + a1) & ~v11;
  uint64_t v14 = (v12 + a2) & ~v11;
  v9(v13, v14, v7);
  uint64_t v15 = *(void *)(v10 + 32) + v11;
  uint64_t v16 = (v15 + v13) & ~v11;
  uint64_t v17 = (v15 + v14) & ~v11;
  v9(v16, v17, v7);
  uint64_t v18 = (v15 + v16) & ~v11;
  uint64_t v19 = (v15 + v17) & ~v11;
  v9(v18, v19, v7);
  v9((v15 + v18) & ~v11, (v15 + v19) & ~v11, v7);
  return a1;
}

uint64_t assignWithTake for SessionKeyManager.State.EarlySecret(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24);
  uint64_t v7 = type metadata accessor for SymmetricKey();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 40);
  uint64_t v10 = v8 + 40;
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = v6 + v11;
  uint64_t v13 = (v6 + v11 + a1) & ~v11;
  uint64_t v14 = (v12 + a2) & ~v11;
  v9(v13, v14, v7);
  uint64_t v15 = *(void *)(v10 + 24) + v11;
  uint64_t v16 = (v15 + v13) & ~v11;
  uint64_t v17 = (v15 + v14) & ~v11;
  v9(v16, v17, v7);
  uint64_t v18 = (v15 + v16) & ~v11;
  uint64_t v19 = (v15 + v17) & ~v11;
  v9(v18, v19, v7);
  v9((v15 + v18) & ~v11, (v15 + v19) & ~v11, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for SessionKeyManager.State.EarlySecret(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  uint64_t v8 = type metadata accessor for SymmetricKey();
  uint64_t v9 = *(void *)(v8 - 8);
  unsigned int v10 = *(_DWORD *)(v9 + 84);
  if (v10 <= v7) {
    unsigned int v11 = v7;
  }
  else {
    unsigned int v11 = *(_DWORD *)(v9 + 84);
  }
  uint64_t v12 = *(unsigned __int8 *)(v9 + 80);
  if (!a2) {
    return 0;
  }
  uint64_t v13 = *(void *)(v6 + 64) + v12;
  if (a2 <= v11) {
    goto LABEL_24;
  }
  uint64_t v14 = ((*(void *)(*(void *)(v8 - 8) + 64)
        + v12
        + ((*(void *)(*(void *)(v8 - 8) + 64)
          + v12
          + ((*(void *)(*(void *)(v8 - 8) + 64) + v12 + (v13 & ~v12)) & ~v12)) & ~v12)) & ~v12)
      + *(void *)(*(void *)(v8 - 8) + 64);
  char v15 = 8 * v14;
  if (v14 <= 3)
  {
    unsigned int v17 = ((a2 - v11 + ~(-1 << v15)) >> v15) + 1;
    if (HIWORD(v17))
    {
      int v16 = *(_DWORD *)((char *)a1 + v14);
      if (!v16) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v17 > 0xFF)
    {
      int v16 = *(unsigned __int16 *)((char *)a1 + v14);
      if (!*(unsigned __int16 *)((char *)a1 + v14)) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v17 < 2)
    {
LABEL_24:
      if (v11)
      {
        if (v7 >= v10)
        {
          uint64_t v23 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v6 + 48);
          return v23(a1, v7, v5);
        }
        else
        {
          uint64_t v21 = *(uint64_t (**)(unint64_t))(v9 + 48);
          return v21(((unint64_t)a1 + v13) & ~v12);
        }
      }
      return 0;
    }
  }
  int v16 = *((unsigned __int8 *)a1 + v14);
  if (!*((unsigned char *)a1 + v14)) {
    goto LABEL_24;
  }
LABEL_14:
  int v18 = (v16 - 1) << v15;
  if (v14 > 3) {
    int v18 = 0;
  }
  if (v14)
  {
    if (v14 <= 3) {
      int v19 = v14;
    }
    else {
      int v19 = 4;
    }
    switch(v19)
    {
      case 2:
        int v20 = *a1;
        break;
      case 3:
        int v20 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v20 = *(_DWORD *)a1;
        break;
      default:
        int v20 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v20 = 0;
  }
  return v11 + (v20 | v18) + 1;
}

void storeEnumTagSinglePayload for SessionKeyManager.State.EarlySecret(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v24 = v8;
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  uint64_t v10 = *(void *)(type metadata accessor for SymmetricKey() - 8);
  uint64_t v11 = v10;
  unsigned int v12 = *(_DWORD *)(v10 + 84);
  if (v12 <= v9) {
    unsigned int v13 = v9;
  }
  else {
    unsigned int v13 = *(_DWORD *)(v10 + 84);
  }
  uint64_t v14 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v15 = *(void *)(v8 + 64) + v14;
  size_t v16 = ((*(void *)(v10 + 64)
        + v14
        + ((*(void *)(v10 + 64) + v14 + ((*(void *)(v10 + 64) + v14 + (v15 & ~v14)) & ~v14)) & ~v14)) & ~v14)
      + *(void *)(v10 + 64);
  if (a3 <= v13)
  {
    int v17 = 0;
  }
  else if (v16 <= 3)
  {
    unsigned int v20 = ((a3 - v13 + ~(-1 << (8 * v16))) >> (8 * v16)) + 1;
    if (HIWORD(v20))
    {
      int v17 = 4;
    }
    else if (v20 >= 0x100)
    {
      int v17 = 2;
    }
    else
    {
      int v17 = v20 > 1;
    }
  }
  else
  {
    int v17 = 1;
  }
  if (v13 < a2)
  {
    unsigned int v18 = ~v13 + a2;
    if (v16 < 4)
    {
      int v19 = (v18 >> (8 * v16)) + 1;
      if (v16)
      {
        int v21 = v18 & ~(-1 << (8 * v16));
        bzero(a1, v16);
        if (v16 == 3)
        {
          *(_WORD *)a1 = v21;
          a1[2] = BYTE2(v21);
        }
        else if (v16 == 2)
        {
          *(_WORD *)a1 = v21;
        }
        else
        {
          *a1 = v21;
        }
      }
    }
    else
    {
      bzero(a1, v16);
      *(_DWORD *)a1 = v18;
      int v19 = 1;
    }
    switch(v17)
    {
      case 1:
        a1[v16] = v19;
        return;
      case 2:
        *(_WORD *)&a1[v16] = v19;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v16] = v19;
        return;
      default:
        return;
    }
  }
  switch(v17)
  {
    case 1:
      a1[v16] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v16] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x1B576E7A4);
    case 4:
      *(_DWORD *)&a1[v16] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if (v9 >= v12)
        {
          uint64_t v23 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v24 + 56);
          v23(a1, a2, v9, v7);
        }
        else
        {
          unint64_t v22 = *(void (**)(unint64_t, uint64_t))(v11 + 56);
          v22((unint64_t)&a1[v15] & ~v14, a2);
        }
      }
      return;
  }
}

uint64_t type metadata completion function for SessionKeyManager.State()
{
  uint64_t result = type metadata accessor for SessionKeyManager.State.EarlySecret();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for SessionKeyManager.State.HandshakeSecret();
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for SessionKeyManager.State.MasterSecret();
      if (v3 <= 0x3F)
      {
        uint64_t result = type metadata accessor for SessionKeyManager.State.AllSecrets();
        if (v4 <= 0x3F)
        {
          swift_initEnumMetadataMultiPayload();
          return 0;
        }
      }
    }
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for SessionKeyManager(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = type metadata accessor for SymmetricKey();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(_DWORD *)(v9 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = *(void *)(v9 + 64);
  uint64_t v13 = v12 + v10;
  unint64_t v14 = ((v12 + v10 + ((v12 + v10 + ((v7 + v10) & ~v10)) & ~v10)) & ~v10) + v12;
  unint64_t v15 = ((v14 + v10) & ~v10) + v12;
  if (v14 <= v15) {
    unint64_t v14 = ((v14 + v10) & ~v10) + v12;
  }
  unint64_t v16 = ((v13 + ((v15 + v10) & ~v10)) & ~v10) + v12;
  if (v16 > v14) {
    unint64_t v14 = v16;
  }
  unint64_t v17 = ((v13 + ((v13 + (v13 & ~v10)) & ~v10)) & ~v10) + v12;
  if (v17 <= v14) {
    unint64_t v18 = v14;
  }
  else {
    unint64_t v18 = v17;
  }
  uint64_t v19 = (*(unsigned char *)(v6 + 80) | *(unsigned char *)(v9 + 80));
  BOOL v20 = v19 <= 7 && ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v9 + 80)) & 0x100000) == 0;
  if (v20 && v18 + 1 <= 0x18)
  {
    uint64_t v21 = v8;
    unsigned int v22 = a2[v18];
    unsigned int v23 = v22 - 4;
    if (v22 < 4)
    {
LABEL_27:
      uint64_t v28 = ~v10;
      switch(v22)
      {
        case 0u:
          (*(void (**)(void *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
          unint64_t v29 = (unint64_t)&a2[v11] & v28;
          unint64_t v30 = *(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16);
          v30(((unint64_t)a1 + v11) & v28, v29, v21);
          unint64_t v31 = (v13 + v29) & v28;
          v30((v13 + (((unint64_t)a1 + v11) & v28)) & v28, v31, v21);
          unint64_t v32 = (v13 + v31) & v28;
          v30((v13 + ((v13 + (((unint64_t)a1 + v11) & v28)) & v28)) & v28, v32, v21);
          v30((v13 + ((v13 + ((v13 + (((unint64_t)a1 + v11) & v28)) & v28)) & v28)) & v28, (v13 + v32) & v28, v21);
          *((unsigned char *)a1 + v18) = 0;
          break;
        case 1u:
          (*(void (**)(void *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
          unint64_t v33 = (unint64_t)&a2[v11] & v28;
          unint64_t v34 = *(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16);
          v34(((unint64_t)a1 + v11) & v28, v33, v21);
          unint64_t v35 = (v13 + v33) & v28;
          v34((v13 + (((unint64_t)a1 + v11) & v28)) & v28, v35, v21);
          v34((v13 + ((v13 + (((unint64_t)a1 + v11) & v28)) & v28)) & v28, (v13 + v35) & v28, v21);
          *((unsigned char *)a1 + v18) = 1;
          break;
        case 2u:
          (*(void (**)(void *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
          unint64_t v36 = (unint64_t)&a2[v11] & v28;
          uint64_t v37 = *(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16);
          v37(((unint64_t)a1 + v11) & v28, v36, v21);
          unint64_t v38 = (v13 + v36) & v28;
          v37((v13 + (((unint64_t)a1 + v11) & v28)) & v28, v38, v21);
          unint64_t v39 = (v13 + v38) & v28;
          v37((v13 + ((v13 + (((unint64_t)a1 + v11) & v28)) & v28)) & v28, v39, v21);
          uint64_t v40 = (v13 + v39) & v28;
          v37((v13 + ((v13 + ((v13 + (((unint64_t)a1 + v11) & v28)) & v28)) & v28)) & v28, v40, v21);
          uint64_t v41 = (v13 + v40) & v28;
          v37((v13 + ((v13 + ((v13 + ((v13 + (((unint64_t)a1 + v11) & v28)) & v28)) & v28)) & v28)) & v28, v41, v21);
          v37((v13 + ((v13 + ((v13 + ((v13 + ((v13 + (((unint64_t)a1 + v11) & v28)) & v28)) & v28)) & v28)) & v28)) & v28, (v13 + v41) & v28, v21);
          *((unsigned char *)a1 + v18) = 2;
          break;
        case 3u:
          unint64_t v42 = *(void (**)(void *, unsigned __int8 *, uint64_t))(v9 + 16);
          v42(a1, a2, v8);
          unint64_t v43 = (unint64_t)&a2[v13] & v28;
          v42((void *)(((unint64_t)a1 + v13) & v28), (unsigned __int8 *)v43, v21);
          unint64_t v44 = (v13 + v43) & v28;
          v42((void *)((v13 + (((unint64_t)a1 + v13) & v28)) & v28), (unsigned __int8 *)v44, v21);
          v42((void *)((v13 + ((v13 + (((unint64_t)a1 + v13) & v28)) & v28)) & v28), (unsigned __int8 *)((v13 + v44) & v28), v21);
          *((unsigned char *)a1 + v18) = 3;
          break;
        default:
          goto LABEL_34;
      }
    }
    else
    {
      if (v18 <= 3) {
        uint64_t v24 = v18;
      }
      else {
        uint64_t v24 = 4;
      }
      switch(v24)
      {
        case 1:
          int v25 = *a2;
          if (v18 >= 4) {
            goto LABEL_33;
          }
          goto LABEL_26;
        case 2:
          int v25 = *(unsigned __int16 *)a2;
          if (v18 >= 4) {
            goto LABEL_33;
          }
          goto LABEL_26;
        case 3:
          int v25 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          if (v18 < 4) {
            goto LABEL_26;
          }
          goto LABEL_33;
        case 4:
          int v25 = *(_DWORD *)a2;
          if (v18 < 4)
          {
LABEL_26:
            unsigned int v22 = (v25 | (v23 << (8 * v18))) + 4;
            goto LABEL_27;
          }
LABEL_33:
          unsigned int v22 = v25 + 4;
          if (v22 <= 3) {
            goto LABEL_27;
          }
LABEL_34:
          memcpy(a1, a2, v18 + 1);
          break;
        default:
          goto LABEL_27;
      }
    }
  }
  else
  {
    uint64_t v26 = *(void *)a2;
    *a1 = *(void *)a2;
    a1 = (void *)(v26 + ((v19 + 16) & ~v19));
    swift_retain();
  }
  return a1;
}

uint64_t destroy for SessionKeyManager(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = type metadata accessor for SymmetricKey();
  uint64_t result = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(result + 80);
  uint64_t v9 = v5 + v8;
  uint64_t v10 = (v5 + v8) & ~v8;
  uint64_t v11 = *(void *)(result + 64);
  uint64_t v12 = v11 + v8;
  unint64_t v13 = ((v11 + v8 + ((v11 + v8 + v10) & ~v8)) & ~v8) + v11;
  unint64_t v14 = ((v13 + v8) & ~v8) + v11;
  if (v13 <= v14) {
    unint64_t v13 = ((v13 + v8) & ~v8) + v11;
  }
  unint64_t v15 = ((v12 + ((v14 + v8) & ~v8)) & ~v8) + v11;
  if (v15 > v13) {
    unint64_t v13 = v15;
  }
  unint64_t v16 = ((v12 + ((v12 + (v12 & ~v8)) & ~v8)) & ~v8) + v11;
  if (v16 <= v13) {
    unint64_t v16 = v13;
  }
  unsigned int v17 = a1[v16];
  unsigned int v18 = v17 - 4;
  if (v17 >= 4)
  {
    if (v16 <= 3) {
      uint64_t v19 = v16;
    }
    else {
      uint64_t v19 = 4;
    }
    switch(v19)
    {
      case 1:
        int v20 = *a1;
        goto LABEL_16;
      case 2:
        int v20 = *(unsigned __int16 *)a1;
        goto LABEL_16;
      case 3:
        int v20 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_16;
      case 4:
        int v20 = *(_DWORD *)a1;
LABEL_16:
        int v21 = (v20 | (v18 << (8 * v16))) + 4;
        unsigned int v17 = v20 + 4;
        if (v16 < 4) {
          unsigned int v17 = v21;
        }
        break;
      default:
        break;
    }
  }
  uint64_t v22 = ~v8;
  switch(v17)
  {
    case 0u:
      uint64_t v33 = *(void *)(v6 - 8);
      (*(void (**)(unsigned __int8 *, uint64_t))(v4 + 8))(a1, v3);
      unint64_t v23 = (unint64_t)&a1[v9] & v22;
      unint64_t v32 = *(void (**)(unint64_t, uint64_t))(v33 + 8);
      v32(v23, v6);
      goto LABEL_22;
    case 1u:
      uint64_t v34 = *(void *)(v6 - 8);
      (*(void (**)(unsigned __int8 *, uint64_t))(v4 + 8))(a1, v3);
      unint64_t v24 = (unint64_t)&a1[v9] & v22;
      unint64_t v32 = *(void (**)(unint64_t, uint64_t))(v34 + 8);
      v32(v24, v6);
      goto LABEL_23;
    case 2u:
      uint64_t v35 = *(void *)(v6 - 8);
      (*(void (**)(unsigned __int8 *, uint64_t))(v4 + 8))(a1, v3);
      unint64_t v25 = (unint64_t)&a1[v9] & v22;
      unint64_t v32 = *(void (**)(unint64_t, uint64_t))(v35 + 8);
      v32(v25, v6);
      unint64_t v26 = (v12 + v25) & v22;
      v32(v26, v6);
      unint64_t v23 = (v12 + v26) & v22;
      v32(v23, v6);
LABEL_22:
      unint64_t v24 = (v12 + v23) & v22;
      v32(v24, v6);
LABEL_23:
      unint64_t v27 = (v12 + v24) & v22;
      v32(v27, v6);
      unint64_t v28 = (v12 + v27) & v22;
      uint64_t v29 = v6;
      goto LABEL_25;
    case 3u:
      unint64_t v32 = *(void (**)(unint64_t, uint64_t))(result + 8);
      v32((unint64_t)a1, v6);
      unint64_t v30 = (unint64_t)&a1[v12] & v22;
      v32(v30, v6);
      unint64_t v31 = (v12 + v30) & v22;
      v32(v31, v6);
      unint64_t v28 = (v12 + v31) & v22;
      uint64_t v29 = v6;
LABEL_25:
      uint64_t result = ((uint64_t (*)(unint64_t, uint64_t))v32)(v28, v29);
      break;
    default:
      return result;
  }
  return result;
}

unsigned char *initializeWithCopy for SessionKeyManager(unsigned char *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = type metadata accessor for SymmetricKey();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = *(void *)(v9 + 64);
  uint64_t v13 = v12 + v10;
  unint64_t v14 = ((v12 + v10 + ((v12 + v10 + ((v7 + v10) & ~v10)) & ~v10)) & ~v10) + v12;
  unint64_t v15 = ((v14 + v10) & ~v10) + v12;
  if (v14 <= v15) {
    unint64_t v14 = ((v14 + v10) & ~v10) + v12;
  }
  unint64_t v16 = ((v13 + ((v15 + v10) & ~v10)) & ~v10) + v12;
  if (v16 > v14) {
    unint64_t v14 = v16;
  }
  unint64_t v17 = ((v13 + ((v13 + (v13 & ~v10)) & ~v10)) & ~v10) + v12;
  if (v17 <= v14) {
    unint64_t v18 = v14;
  }
  else {
    unint64_t v18 = v17;
  }
  unsigned int v19 = a2[v18];
  unsigned int v20 = v19 - 4;
  if (v19 < 4)
  {
LABEL_19:
    uint64_t v23 = ~v10;
    switch(v19)
    {
      case 0u:
        (*(void (**)(unsigned char *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
        unint64_t v24 = (unint64_t)&a2[v11] & v23;
        unint64_t v25 = *(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16);
        v25((unint64_t)&a1[v11] & v23, v24, v8);
        unint64_t v26 = (v13 + v24) & v23;
        v25((v13 + ((unint64_t)&a1[v11] & v23)) & v23, v26, v8);
        unint64_t v27 = (v13 + v26) & v23;
        v25((v13 + ((v13 + ((unint64_t)&a1[v11] & v23)) & v23)) & v23, v27, v8);
        v25((v13 + ((v13 + ((v13 + ((unint64_t)&a1[v11] & v23)) & v23)) & v23)) & v23, (v13 + v27) & v23, v8);
        a1[v18] = 0;
        break;
      case 1u:
        (*(void (**)(unsigned char *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
        unint64_t v28 = (unint64_t)&a2[v11] & v23;
        uint64_t v29 = *(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16);
        v29((unint64_t)&a1[v11] & v23, v28, v8);
        unint64_t v30 = (v13 + v28) & v23;
        v29((v13 + ((unint64_t)&a1[v11] & v23)) & v23, v30, v8);
        v29((v13 + ((v13 + ((unint64_t)&a1[v11] & v23)) & v23)) & v23, (v13 + v30) & v23, v8);
        a1[v18] = 1;
        break;
      case 2u:
        (*(void (**)(unsigned char *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
        unint64_t v31 = (unint64_t)&a2[v11] & v23;
        unint64_t v32 = *(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16);
        v32((unint64_t)&a1[v11] & v23, v31, v8);
        unint64_t v33 = (v13 + v31) & v23;
        v32((v13 + ((unint64_t)&a1[v11] & v23)) & v23, v33, v8);
        unint64_t v34 = (v13 + v33) & v23;
        v32((v13 + ((v13 + ((unint64_t)&a1[v11] & v23)) & v23)) & v23, v34, v8);
        uint64_t v35 = (v13 + v34) & v23;
        v32((v13 + ((v13 + ((v13 + ((unint64_t)&a1[v11] & v23)) & v23)) & v23)) & v23, v35, v8);
        uint64_t v36 = (v13 + v35) & v23;
        v32((v13 + ((v13 + ((v13 + ((v13 + ((unint64_t)&a1[v11] & v23)) & v23)) & v23)) & v23)) & v23, v36, v8);
        v32((v13 + ((v13 + ((v13 + ((v13 + ((v13 + ((unint64_t)&a1[v11] & v23)) & v23)) & v23)) & v23)) & v23)) & v23, (v13 + v36) & v23, v8);
        a1[v18] = 2;
        break;
      case 3u:
        uint64_t v37 = *(void (**)(unsigned char *, unsigned __int8 *, uint64_t))(v9 + 16);
        v37(a1, a2, v8);
        unint64_t v38 = (unint64_t)&a2[v13] & v23;
        v37((unsigned char *)((unint64_t)&a1[v13] & v23), (unsigned __int8 *)v38, v8);
        unint64_t v39 = (v13 + v38) & v23;
        v37((unsigned char *)((v13 + ((unint64_t)&a1[v13] & v23)) & v23), (unsigned __int8 *)v39, v8);
        v37((unsigned char *)((v13 + ((v13 + ((unint64_t)&a1[v13] & v23)) & v23)) & v23), (unsigned __int8 *)((v13 + v39) & v23), v8);
        a1[v18] = 3;
        break;
      default:
        goto LABEL_26;
    }
  }
  else
  {
    if (v18 <= 3) {
      uint64_t v21 = v18;
    }
    else {
      uint64_t v21 = 4;
    }
    switch(v21)
    {
      case 1:
        int v22 = *a2;
        if (v18 >= 4) {
          goto LABEL_25;
        }
        goto LABEL_18;
      case 2:
        int v22 = *(unsigned __int16 *)a2;
        if (v18 >= 4) {
          goto LABEL_25;
        }
        goto LABEL_18;
      case 3:
        int v22 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        if (v18 < 4) {
          goto LABEL_18;
        }
        goto LABEL_25;
      case 4:
        int v22 = *(_DWORD *)a2;
        if (v18 < 4)
        {
LABEL_18:
          unsigned int v19 = (v22 | (v20 << (8 * v18))) + 4;
          goto LABEL_19;
        }
LABEL_25:
        unsigned int v19 = v22 + 4;
        if (v19 <= 3) {
          goto LABEL_19;
        }
LABEL_26:
        memcpy(a1, a2, v18 + 1);
        break;
      default:
        goto LABEL_19;
    }
  }
  return a1;
}

unsigned __int8 *assignWithCopy for SessionKeyManager(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    uint64_t v7 = *(void *)(v6 + 64);
    uint64_t v8 = type metadata accessor for SymmetricKey();
    uint64_t v9 = *(void *)(v8 - 8);
    uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
    uint64_t v11 = v7 + v10;
    uint64_t v12 = *(void *)(v9 + 64);
    uint64_t v13 = v12 + v10;
    unint64_t v14 = ((v12 + v10 + ((v12 + v10 + (v11 & ~v10)) & ~v10)) & ~v10) + v12;
    unint64_t v15 = ((v14 + v10) & ~v10) + v12;
    if (v14 <= v15) {
      unint64_t v14 = ((v14 + v10) & ~v10) + v12;
    }
    unint64_t v16 = ((v13 + ((v15 + v10) & ~v10)) & ~v10) + v12;
    if (v16 > v14) {
      unint64_t v14 = v16;
    }
    unint64_t v17 = ((v13 + ((v13 + (v13 & ~v10)) & ~v10)) & ~v10) + v12;
    if (v17 <= v14) {
      unint64_t v18 = v14;
    }
    else {
      unint64_t v18 = v17;
    }
    unsigned int v19 = a1[v18];
    unsigned int v20 = v19 - 4;
    if (v19 >= 4)
    {
      if (v18 <= 3) {
        uint64_t v21 = v18;
      }
      else {
        uint64_t v21 = 4;
      }
      switch(v21)
      {
        case 1:
          int v22 = *a1;
          if (v18 < 4) {
            goto LABEL_19;
          }
          goto LABEL_21;
        case 2:
          int v22 = *(unsigned __int16 *)a1;
          if (v18 >= 4) {
            goto LABEL_21;
          }
          goto LABEL_19;
        case 3:
          int v22 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          if (v18 < 4) {
            goto LABEL_19;
          }
          goto LABEL_21;
        case 4:
          int v22 = *(_DWORD *)a1;
          if (v18 < 4) {
LABEL_19:
          }
            unsigned int v19 = (v22 | (v20 << (8 * v18))) + 4;
          else {
LABEL_21:
          }
            unsigned int v19 = v22 + 4;
          break;
        default:
          break;
      }
    }
    uint64_t v23 = ~v10;
    uint64_t v69 = v6;
    uint64_t v70 = v5;
    uint64_t v68 = v11;
    switch(v19)
    {
      case 0u:
        (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
        unint64_t v24 = (unint64_t)&a1[v11] & v23;
        unint64_t v25 = *(void (**)(unint64_t, uint64_t))(v9 + 8);
        v25(v24, v8);
        unint64_t v26 = (v13 + v24) & v23;
        v25(v26, v8);
        unint64_t v27 = (v13 + v26) & v23;
        v25(v27, v8);
        uint64_t v28 = v13 + v27;
        uint64_t v11 = v68;
        v25(v28 & v23, v8);
        goto LABEL_29;
      case 1u:
        (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
        unint64_t v29 = (unint64_t)&a1[v11] & v23;
        unint64_t v30 = *(void (**)(unint64_t, uint64_t))(v9 + 8);
        v30(v29, v8);
        goto LABEL_28;
      case 2u:
        (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
        unint64_t v31 = (unint64_t)&a1[v11] & v23;
        unint64_t v30 = *(void (**)(unint64_t, uint64_t))(v9 + 8);
        v30(v31, v8);
        unint64_t v32 = (v13 + v31) & v23;
        v30(v32, v8);
        unint64_t v33 = (v13 + v32) & v23;
        v30(v33, v8);
        unint64_t v34 = v13 + v33;
        goto LABEL_27;
      case 3u:
        unint64_t v30 = *(void (**)(unint64_t, uint64_t))(v9 + 8);
        v30((unint64_t)a1, v8);
        unint64_t v34 = (unint64_t)&a1[v13];
LABEL_27:
        unint64_t v29 = v34 & v23;
        v30(v34 & v23, v8);
LABEL_28:
        unint64_t v35 = (v13 + v29) & v23;
        v30(v35, v8);
        uint64_t v36 = v13 + v35;
        uint64_t v11 = v68;
        v30(v36 & v23, v8);
LABEL_29:
        uint64_t v6 = v69;
        uint64_t v5 = v70;
        break;
      default:
        break;
    }
    unsigned int v37 = a2[v18];
    unsigned int v38 = v37 - 4;
    if (v37 < 4)
    {
LABEL_41:
      switch(v37)
      {
        case 0u:
          (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
          unint64_t v41 = (unint64_t)&a1[v11] & v23;
          unint64_t v42 = (unint64_t)&a2[v11] & v23;
          unint64_t v43 = *(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16);
          v43(v41, v42, v8);
          unint64_t v44 = (v13 + v41) & v23;
          unint64_t v45 = (v13 + v42) & v23;
          v43(v44, v45, v8);
          unint64_t v46 = (v13 + v44) & v23;
          unint64_t v47 = (v13 + v45) & v23;
          v43(v46, v47, v8);
          v43((v13 + v46) & v23, (v13 + v47) & v23, v8);
          a1[v18] = 0;
          break;
        case 1u:
          (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
          unint64_t v48 = (unint64_t)&a1[v11] & v23;
          unint64_t v49 = (unint64_t)&a2[v11] & v23;
          uint64_t v50 = *(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16);
          v50(v48, v49, v8);
          unint64_t v51 = (v13 + v48) & v23;
          unint64_t v52 = (v13 + v49) & v23;
          v50(v51, v52, v8);
          v50((v13 + v51) & v23, (v13 + v52) & v23, v8);
          a1[v18] = 1;
          break;
        case 2u:
          (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
          unint64_t v53 = (unint64_t)&a1[v11] & v23;
          unint64_t v54 = (unint64_t)&a2[v11] & v23;
          unint64_t v55 = *(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16);
          v55(v53, v54, v8);
          unint64_t v56 = (v13 + v53) & v23;
          unint64_t v57 = (v13 + v54) & v23;
          v55(v56, v57, v8);
          unint64_t v58 = (v13 + v56) & v23;
          unint64_t v59 = (v13 + v57) & v23;
          v55(v58, v59, v8);
          uint64_t v60 = (v13 + v58) & v23;
          uint64_t v61 = (v13 + v59) & v23;
          v55(v60, v61, v8);
          uint64_t v62 = (v13 + v60) & v23;
          uint64_t v63 = (v13 + v61) & v23;
          v55(v62, v63, v8);
          v55((v13 + v62) & v23, (v13 + v63) & v23, v8);
          a1[v18] = 2;
          break;
        case 3u:
          uint64_t v64 = *(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v9 + 16);
          v64(a1, a2, v8);
          unint64_t v65 = (unint64_t)&a2[v13] & v23;
          v64((unsigned __int8 *)((unint64_t)&a1[v13] & v23), (unsigned __int8 *)v65, v8);
          unint64_t v66 = (v13 + v65) & v23;
          v64((unsigned __int8 *)((v13 + ((unint64_t)&a1[v13] & v23)) & v23), (unsigned __int8 *)v66, v8);
          v64((unsigned __int8 *)((v13 + ((v13 + ((unint64_t)&a1[v13] & v23)) & v23)) & v23), (unsigned __int8 *)((v13 + v66) & v23), v8);
          a1[v18] = 3;
          break;
        default:
          goto LABEL_48;
      }
    }
    else
    {
      if (v18 <= 3) {
        uint64_t v39 = v18;
      }
      else {
        uint64_t v39 = 4;
      }
      switch(v39)
      {
        case 1:
          int v40 = *a2;
          if (v18 >= 4) {
            goto LABEL_47;
          }
          goto LABEL_40;
        case 2:
          int v40 = *(unsigned __int16 *)a2;
          if (v18 >= 4) {
            goto LABEL_47;
          }
          goto LABEL_40;
        case 3:
          int v40 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          if (v18 < 4) {
            goto LABEL_40;
          }
          goto LABEL_47;
        case 4:
          int v40 = *(_DWORD *)a2;
          if (v18 < 4)
          {
LABEL_40:
            unsigned int v37 = (v40 | (v38 << (8 * v18))) + 4;
            goto LABEL_41;
          }
LABEL_47:
          unsigned int v37 = v40 + 4;
          if (v37 <= 3) {
            goto LABEL_41;
          }
LABEL_48:
          memcpy(a1, a2, v18 + 1);
          break;
        default:
          goto LABEL_41;
      }
    }
  }
  return a1;
}

unsigned char *initializeWithTake for SessionKeyManager(unsigned char *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = type metadata accessor for SymmetricKey();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = *(void *)(v9 + 64);
  uint64_t v13 = v12 + v10;
  unint64_t v14 = ((v12 + v10 + ((v12 + v10 + ((v7 + v10) & ~v10)) & ~v10)) & ~v10) + v12;
  unint64_t v15 = ((v14 + v10) & ~v10) + v12;
  if (v14 <= v15) {
    unint64_t v14 = ((v14 + v10) & ~v10) + v12;
  }
  unint64_t v16 = ((v13 + ((v15 + v10) & ~v10)) & ~v10) + v12;
  if (v16 > v14) {
    unint64_t v14 = v16;
  }
  unint64_t v17 = ((v13 + ((v13 + (v13 & ~v10)) & ~v10)) & ~v10) + v12;
  if (v17 <= v14) {
    unint64_t v18 = v14;
  }
  else {
    unint64_t v18 = v17;
  }
  unsigned int v19 = a2[v18];
  unsigned int v20 = v19 - 4;
  if (v19 < 4)
  {
LABEL_19:
    uint64_t v23 = ~v10;
    switch(v19)
    {
      case 0u:
        (*(void (**)(unsigned char *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
        unint64_t v24 = (unint64_t)&a2[v11] & v23;
        unint64_t v25 = *(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 32);
        v25((unint64_t)&a1[v11] & v23, v24, v8);
        unint64_t v26 = (v13 + v24) & v23;
        v25((v13 + ((unint64_t)&a1[v11] & v23)) & v23, v26, v8);
        unint64_t v27 = (v13 + v26) & v23;
        v25((v13 + ((v13 + ((unint64_t)&a1[v11] & v23)) & v23)) & v23, v27, v8);
        v25((v13 + ((v13 + ((v13 + ((unint64_t)&a1[v11] & v23)) & v23)) & v23)) & v23, (v13 + v27) & v23, v8);
        a1[v18] = 0;
        break;
      case 1u:
        (*(void (**)(unsigned char *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
        unint64_t v28 = (unint64_t)&a2[v11] & v23;
        unint64_t v29 = *(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 32);
        v29((unint64_t)&a1[v11] & v23, v28, v8);
        unint64_t v30 = (v13 + v28) & v23;
        v29((v13 + ((unint64_t)&a1[v11] & v23)) & v23, v30, v8);
        v29((v13 + ((v13 + ((unint64_t)&a1[v11] & v23)) & v23)) & v23, (v13 + v30) & v23, v8);
        a1[v18] = 1;
        break;
      case 2u:
        (*(void (**)(unsigned char *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
        unint64_t v31 = (unint64_t)&a2[v11] & v23;
        unint64_t v32 = *(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 32);
        v32((unint64_t)&a1[v11] & v23, v31, v8);
        unint64_t v33 = (v13 + v31) & v23;
        v32((v13 + ((unint64_t)&a1[v11] & v23)) & v23, v33, v8);
        unint64_t v34 = (v13 + v33) & v23;
        v32((v13 + ((v13 + ((unint64_t)&a1[v11] & v23)) & v23)) & v23, v34, v8);
        uint64_t v35 = (v13 + v34) & v23;
        v32((v13 + ((v13 + ((v13 + ((unint64_t)&a1[v11] & v23)) & v23)) & v23)) & v23, v35, v8);
        uint64_t v36 = (v13 + v35) & v23;
        v32((v13 + ((v13 + ((v13 + ((v13 + ((unint64_t)&a1[v11] & v23)) & v23)) & v23)) & v23)) & v23, v36, v8);
        v32((v13 + ((v13 + ((v13 + ((v13 + ((v13 + ((unint64_t)&a1[v11] & v23)) & v23)) & v23)) & v23)) & v23)) & v23, (v13 + v36) & v23, v8);
        a1[v18] = 2;
        break;
      case 3u:
        unsigned int v37 = *(void (**)(unsigned char *, unsigned __int8 *, uint64_t))(v9 + 32);
        v37(a1, a2, v8);
        unint64_t v38 = (unint64_t)&a2[v13] & v23;
        v37((unsigned char *)((unint64_t)&a1[v13] & v23), (unsigned __int8 *)v38, v8);
        unint64_t v39 = (v13 + v38) & v23;
        v37((unsigned char *)((v13 + ((unint64_t)&a1[v13] & v23)) & v23), (unsigned __int8 *)v39, v8);
        v37((unsigned char *)((v13 + ((v13 + ((unint64_t)&a1[v13] & v23)) & v23)) & v23), (unsigned __int8 *)((v13 + v39) & v23), v8);
        a1[v18] = 3;
        break;
      default:
        goto LABEL_26;
    }
  }
  else
  {
    if (v18 <= 3) {
      uint64_t v21 = v18;
    }
    else {
      uint64_t v21 = 4;
    }
    switch(v21)
    {
      case 1:
        int v22 = *a2;
        if (v18 >= 4) {
          goto LABEL_25;
        }
        goto LABEL_18;
      case 2:
        int v22 = *(unsigned __int16 *)a2;
        if (v18 >= 4) {
          goto LABEL_25;
        }
        goto LABEL_18;
      case 3:
        int v22 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        if (v18 < 4) {
          goto LABEL_18;
        }
        goto LABEL_25;
      case 4:
        int v22 = *(_DWORD *)a2;
        if (v18 < 4)
        {
LABEL_18:
          unsigned int v19 = (v22 | (v20 << (8 * v18))) + 4;
          goto LABEL_19;
        }
LABEL_25:
        unsigned int v19 = v22 + 4;
        if (v19 <= 3) {
          goto LABEL_19;
        }
LABEL_26:
        memcpy(a1, a2, v18 + 1);
        break;
      default:
        goto LABEL_19;
    }
  }
  return a1;
}

unsigned __int8 *assignWithTake for SessionKeyManager(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    uint64_t v7 = *(void *)(v6 + 64);
    uint64_t v8 = type metadata accessor for SymmetricKey();
    uint64_t v9 = *(void *)(v8 - 8);
    uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
    uint64_t v11 = v7 + v10;
    uint64_t v12 = *(void *)(v9 + 64);
    uint64_t v13 = v12 + v10;
    unint64_t v14 = ((v12 + v10 + ((v12 + v10 + (v11 & ~v10)) & ~v10)) & ~v10) + v12;
    unint64_t v15 = ((v14 + v10) & ~v10) + v12;
    if (v14 <= v15) {
      unint64_t v14 = ((v14 + v10) & ~v10) + v12;
    }
    unint64_t v16 = ((v13 + ((v15 + v10) & ~v10)) & ~v10) + v12;
    if (v16 > v14) {
      unint64_t v14 = v16;
    }
    unint64_t v17 = ((v13 + ((v13 + (v13 & ~v10)) & ~v10)) & ~v10) + v12;
    if (v17 <= v14) {
      unint64_t v18 = v14;
    }
    else {
      unint64_t v18 = v17;
    }
    unsigned int v19 = a1[v18];
    unsigned int v20 = v19 - 4;
    if (v19 >= 4)
    {
      if (v18 <= 3) {
        uint64_t v21 = v18;
      }
      else {
        uint64_t v21 = 4;
      }
      switch(v21)
      {
        case 1:
          int v22 = *a1;
          if (v18 < 4) {
            goto LABEL_19;
          }
          goto LABEL_21;
        case 2:
          int v22 = *(unsigned __int16 *)a1;
          if (v18 >= 4) {
            goto LABEL_21;
          }
          goto LABEL_19;
        case 3:
          int v22 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          if (v18 < 4) {
            goto LABEL_19;
          }
          goto LABEL_21;
        case 4:
          int v22 = *(_DWORD *)a1;
          if (v18 < 4) {
LABEL_19:
          }
            unsigned int v19 = (v22 | (v20 << (8 * v18))) + 4;
          else {
LABEL_21:
          }
            unsigned int v19 = v22 + 4;
          break;
        default:
          break;
      }
    }
    uint64_t v23 = ~v10;
    uint64_t v69 = v6;
    uint64_t v70 = v5;
    uint64_t v68 = v11;
    switch(v19)
    {
      case 0u:
        (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
        unint64_t v24 = (unint64_t)&a1[v11] & v23;
        unint64_t v25 = *(void (**)(unint64_t, uint64_t))(v9 + 8);
        v25(v24, v8);
        unint64_t v26 = (v13 + v24) & v23;
        v25(v26, v8);
        unint64_t v27 = (v13 + v26) & v23;
        v25(v27, v8);
        uint64_t v28 = v13 + v27;
        uint64_t v11 = v68;
        v25(v28 & v23, v8);
        goto LABEL_29;
      case 1u:
        (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
        unint64_t v29 = (unint64_t)&a1[v11] & v23;
        unint64_t v30 = *(void (**)(unint64_t, uint64_t))(v9 + 8);
        v30(v29, v8);
        goto LABEL_28;
      case 2u:
        (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
        unint64_t v31 = (unint64_t)&a1[v11] & v23;
        unint64_t v30 = *(void (**)(unint64_t, uint64_t))(v9 + 8);
        v30(v31, v8);
        unint64_t v32 = (v13 + v31) & v23;
        v30(v32, v8);
        unint64_t v33 = (v13 + v32) & v23;
        v30(v33, v8);
        unint64_t v34 = v13 + v33;
        goto LABEL_27;
      case 3u:
        unint64_t v30 = *(void (**)(unint64_t, uint64_t))(v9 + 8);
        v30((unint64_t)a1, v8);
        unint64_t v34 = (unint64_t)&a1[v13];
LABEL_27:
        unint64_t v29 = v34 & v23;
        v30(v34 & v23, v8);
LABEL_28:
        unint64_t v35 = (v13 + v29) & v23;
        v30(v35, v8);
        uint64_t v36 = v13 + v35;
        uint64_t v11 = v68;
        v30(v36 & v23, v8);
LABEL_29:
        uint64_t v6 = v69;
        uint64_t v5 = v70;
        break;
      default:
        break;
    }
    unsigned int v37 = a2[v18];
    unsigned int v38 = v37 - 4;
    if (v37 < 4)
    {
LABEL_41:
      switch(v37)
      {
        case 0u:
          (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
          unint64_t v41 = (unint64_t)&a1[v11] & v23;
          unint64_t v42 = (unint64_t)&a2[v11] & v23;
          unint64_t v43 = *(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 32);
          v43(v41, v42, v8);
          unint64_t v44 = (v13 + v41) & v23;
          unint64_t v45 = (v13 + v42) & v23;
          v43(v44, v45, v8);
          unint64_t v46 = (v13 + v44) & v23;
          unint64_t v47 = (v13 + v45) & v23;
          v43(v46, v47, v8);
          v43((v13 + v46) & v23, (v13 + v47) & v23, v8);
          a1[v18] = 0;
          break;
        case 1u:
          (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
          unint64_t v48 = (unint64_t)&a1[v11] & v23;
          unint64_t v49 = (unint64_t)&a2[v11] & v23;
          uint64_t v50 = *(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 32);
          v50(v48, v49, v8);
          unint64_t v51 = (v13 + v48) & v23;
          unint64_t v52 = (v13 + v49) & v23;
          v50(v51, v52, v8);
          v50((v13 + v51) & v23, (v13 + v52) & v23, v8);
          a1[v18] = 1;
          break;
        case 2u:
          (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
          unint64_t v53 = (unint64_t)&a1[v11] & v23;
          unint64_t v54 = (unint64_t)&a2[v11] & v23;
          unint64_t v55 = *(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 32);
          v55(v53, v54, v8);
          unint64_t v56 = (v13 + v53) & v23;
          unint64_t v57 = (v13 + v54) & v23;
          v55(v56, v57, v8);
          unint64_t v58 = (v13 + v56) & v23;
          unint64_t v59 = (v13 + v57) & v23;
          v55(v58, v59, v8);
          uint64_t v60 = (v13 + v58) & v23;
          uint64_t v61 = (v13 + v59) & v23;
          v55(v60, v61, v8);
          uint64_t v62 = (v13 + v60) & v23;
          uint64_t v63 = (v13 + v61) & v23;
          v55(v62, v63, v8);
          v55((v13 + v62) & v23, (v13 + v63) & v23, v8);
          a1[v18] = 2;
          break;
        case 3u:
          uint64_t v64 = *(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v9 + 32);
          v64(a1, a2, v8);
          unint64_t v65 = (unint64_t)&a2[v13] & v23;
          v64((unsigned __int8 *)((unint64_t)&a1[v13] & v23), (unsigned __int8 *)v65, v8);
          unint64_t v66 = (v13 + v65) & v23;
          v64((unsigned __int8 *)((v13 + ((unint64_t)&a1[v13] & v23)) & v23), (unsigned __int8 *)v66, v8);
          v64((unsigned __int8 *)((v13 + ((v13 + ((unint64_t)&a1[v13] & v23)) & v23)) & v23), (unsigned __int8 *)((v13 + v66) & v23), v8);
          a1[v18] = 3;
          break;
        default:
          goto LABEL_48;
      }
    }
    else
    {
      if (v18 <= 3) {
        uint64_t v39 = v18;
      }
      else {
        uint64_t v39 = 4;
      }
      switch(v39)
      {
        case 1:
          int v40 = *a2;
          if (v18 >= 4) {
            goto LABEL_47;
          }
          goto LABEL_40;
        case 2:
          int v40 = *(unsigned __int16 *)a2;
          if (v18 >= 4) {
            goto LABEL_47;
          }
          goto LABEL_40;
        case 3:
          int v40 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          if (v18 < 4) {
            goto LABEL_40;
          }
          goto LABEL_47;
        case 4:
          int v40 = *(_DWORD *)a2;
          if (v18 < 4)
          {
LABEL_40:
            unsigned int v37 = (v40 | (v38 << (8 * v18))) + 4;
            goto LABEL_41;
          }
LABEL_47:
          unsigned int v37 = v40 + 4;
          if (v37 <= 3) {
            goto LABEL_41;
          }
LABEL_48:
          memcpy(a1, a2, v18 + 1);
          break;
        default:
          goto LABEL_41;
      }
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for SessionKeyManager(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  uint64_t v6 = *(void *)(type metadata accessor for SymmetricKey() - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = v8 + v7;
  unint64_t v10 = ((v8 + v7 + ((v8 + v7 + ((v5 + v7) & ~v7)) & ~v7)) & ~v7) + v8;
  unint64_t v11 = ((v10 + v7) & ~v7) + v8;
  if (v10 <= v11) {
    unint64_t v10 = ((v10 + v7) & ~v7) + v8;
  }
  unint64_t v12 = ((v9 + ((v11 + v7) & ~v7)) & ~v7) + v8;
  if (v12 > v10) {
    unint64_t v10 = v12;
  }
  unint64_t v13 = ((v9 + ((v9 + (v9 & ~v7)) & ~v7)) & ~v7) + v8;
  if (v13 > v10) {
    unint64_t v10 = v13;
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_26;
  }
  unint64_t v14 = v10 + 1;
  char v15 = 8 * (v10 + 1);
  if ((v10 + 1) <= 3)
  {
    unsigned int v18 = ((a2 + ~(-1 << v15) - 251) >> v15) + 1;
    if (HIWORD(v18))
    {
      int v16 = *(_DWORD *)((char *)a1 + v14);
      if (!v16) {
        goto LABEL_26;
      }
      goto LABEL_18;
    }
    if (v18 > 0xFF)
    {
      int v16 = *(unsigned __int16 *)((char *)a1 + v14);
      if (!*(unsigned __int16 *)((char *)a1 + v14)) {
        goto LABEL_26;
      }
      goto LABEL_18;
    }
    if (v18 < 2)
    {
LABEL_26:
      unsigned int v20 = *((unsigned __int8 *)a1 + v10);
      if (v20 >= 5) {
        return (v20 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v16 = *((unsigned __int8 *)a1 + v14);
  if (!*((unsigned char *)a1 + v14)) {
    goto LABEL_26;
  }
LABEL_18:
  int v19 = (v16 - 1) << v15;
  if (v14 > 3) {
    int v19 = 0;
  }
  if (v14)
  {
    if (v14 > 3) {
      LODWORD(v14) = 4;
    }
    switch((int)v14)
    {
      case 2:
        LODWORD(v14) = *a1;
        break;
      case 3:
        LODWORD(v14) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v14) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v14) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return (v14 | v19) + 252;
}

void storeEnumTagSinglePayload for SessionKeyManager(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  uint64_t v8 = *(void *)(type metadata accessor for SymmetricKey() - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(v8 + 64);
  uint64_t v11 = v10 + v9;
  unint64_t v12 = ((v10 + v9 + ((v10 + v9 + ((v7 + v9) & ~v9)) & ~v9)) & ~v9) + v10;
  unint64_t v13 = ((v12 + v9) & ~v9) + v10;
  if (v12 <= v13) {
    unint64_t v12 = ((v12 + v9) & ~v9) + v10;
  }
  unint64_t v14 = ((v11 + ((v13 + v9) & ~v9)) & ~v9) + v10;
  if (v14 > v12) {
    unint64_t v12 = v14;
  }
  unint64_t v15 = ((v11 + ((v11 + (v11 & ~v9)) & ~v9)) & ~v9) + v10;
  if (v15 <= v12) {
    unint64_t v15 = v12;
  }
  size_t v16 = v15 + 1;
  if (a3 < 0xFC)
  {
    int v17 = 0;
  }
  else if (v16 <= 3)
  {
    unsigned int v20 = ((a3 + ~(-1 << (8 * v16)) - 251) >> (8 * v16)) + 1;
    if (HIWORD(v20))
    {
      int v17 = 4;
    }
    else if (v20 >= 0x100)
    {
      int v17 = 2;
    }
    else
    {
      int v17 = v20 > 1;
    }
  }
  else
  {
    int v17 = 1;
  }
  if (a2 > 0xFB)
  {
    unsigned int v18 = a2 - 252;
    if (v16 < 4)
    {
      int v19 = (v18 >> (8 * v16)) + 1;
      if (v15 != -1)
      {
        int v21 = v18 & ~(-1 << (8 * v16));
        bzero(a1, v16);
        if (v16 == 3)
        {
          *(_WORD *)a1 = v21;
          a1[2] = BYTE2(v21);
        }
        else if (v16 == 2)
        {
          *(_WORD *)a1 = v21;
        }
        else
        {
          *a1 = v21;
        }
      }
    }
    else
    {
      bzero(a1, v15 + 1);
      *(_DWORD *)a1 = v18;
      int v19 = 1;
    }
    switch(v17)
    {
      case 1:
        a1[v16] = v19;
        break;
      case 2:
        *(_WORD *)&a1[v16] = v19;
        break;
      case 3:
LABEL_38:
        __break(1u);
        JUMPOUT(0x1B5771240);
      case 4:
        *(_DWORD *)&a1[v16] = v19;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v17)
    {
      case 1:
        a1[v16] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_27;
      case 2:
        *(_WORD *)&a1[v16] = 0;
        goto LABEL_26;
      case 3:
        goto LABEL_38;
      case 4:
        *(_DWORD *)&a1[v16] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_27;
      default:
LABEL_26:
        if (a2) {
LABEL_27:
        }
          a1[v15] = -(char)a2;
        break;
    }
  }
}

uint64_t getEnumTag for SessionKeyManager.State(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  uint64_t v4 = *(void *)(type metadata accessor for SymmetricKey() - 8);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v7 = v6 + v5;
  unint64_t v8 = ((v6 + v5 + ((v6 + v5 + ((v3 + v5) & ~v5)) & ~v5)) & ~v5) + v6;
  unint64_t v9 = ((v8 + v5) & ~v5) + v6;
  if (v8 <= v9) {
    unint64_t v8 = ((v8 + v5) & ~v5) + v6;
  }
  unint64_t v10 = ((v7 + ((v9 + v5) & ~v5)) & ~v5) + v6;
  if (v10 > v8) {
    unint64_t v8 = v10;
  }
  unint64_t v11 = ((v7 + ((v7 + (v7 & ~v5)) & ~v5)) & ~v5) + v6;
  if (v11 <= v8) {
    unint64_t v11 = v8;
  }
  uint64_t result = a1[v11];
  if (result >= 4)
  {
    if (v11 <= 3) {
      uint64_t v13 = v11;
    }
    else {
      uint64_t v13 = 4;
    }
    switch(v13)
    {
      case 1:
        int v14 = *a1;
        if (v11 < 4) {
          goto LABEL_17;
        }
        goto LABEL_19;
      case 2:
        int v14 = *(unsigned __int16 *)a1;
        if (v11 >= 4) {
          goto LABEL_19;
        }
        goto LABEL_17;
      case 3:
        int v14 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        if (v11 < 4) {
          goto LABEL_17;
        }
        goto LABEL_19;
      case 4:
        int v14 = *(_DWORD *)a1;
        if (v11 < 4) {
LABEL_17:
        }
          uint64_t result = (v14 | ((result - 4) << (8 * v11))) + 4;
        else {
LABEL_19:
        }
          uint64_t result = (v14 + 4);
        break;
      default:
        return result;
    }
  }
  return result;
}

void destructiveInjectEnumTag for SessionKeyManager.State(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  uint64_t v6 = *(void *)(type metadata accessor for SymmetricKey() - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = v8 + v7;
  size_t v10 = ((v8 + v7 + ((v8 + v7 + ((v5 + v7) & ~v7)) & ~v7)) & ~v7) + v8;
  size_t v11 = ((v10 + v7) & ~v7) + v8;
  if (v10 <= v11) {
    size_t v10 = ((v10 + v7) & ~v7) + v8;
  }
  size_t v12 = ((v9 + ((v11 + v7) & ~v7)) & ~v7) + v8;
  if (v12 > v10) {
    size_t v10 = v12;
  }
  size_t v13 = ((v9 + ((v9 + (v9 & ~v7)) & ~v7)) & ~v7) + v8;
  if (v13 <= v10) {
    size_t v14 = v10;
  }
  else {
    size_t v14 = v13;
  }
  if (a2 > 3)
  {
    unsigned int v15 = a2 - 4;
    if (v14 < 4)
    {
      unsigned int v16 = v15 >> (8 * v14);
      int v17 = v15 & ~(-1 << (8 * v14));
      a1[v14] = v16 + 4;
      bzero(a1, v14);
      if (v14 == 3)
      {
        *(_WORD *)a1 = v17;
        a1[2] = BYTE2(v17);
      }
      else if (v14 == 2)
      {
        *(_WORD *)a1 = v17;
      }
      else
      {
        *a1 = v17;
      }
    }
    else
    {
      a1[v14] = 4;
      bzero(a1, v14);
      *(_DWORD *)a1 = v15;
    }
  }
  else
  {
    a1[v14] = a2;
  }
}

uint64_t type metadata completion function for SessionKeyManager.State.HandshakeSecret()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for SymmetricKey();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for SessionKeyManager.State.HandshakeSecret(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = type metadata accessor for SymmetricKey();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(_DWORD *)(v9 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = (v7 + v10) & ~v10;
  uint64_t v13 = *(void *)(v9 + 64);
  uint64_t v14 = v13 + v10;
  unint64_t v15 = ((v13 + v10 + ((v13 + v10 + v12) & ~v10)) & ~v10) + v13;
  uint64_t v16 = (*(unsigned char *)(v6 + 80) | *(unsigned char *)(v9 + 80));
  if (v16 > 7 || ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v9 + 80)) & 0x100000) != 0 || v15 > 0x18)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v16 + 16) & ~v16));
    swift_retain();
  }
  else
  {
    uint64_t v20 = v8;
    uint64_t v21 = ~v10;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    unint64_t v22 = ((unint64_t)a2 + v11) & v21;
    uint64_t v23 = *(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16);
    v23(((unint64_t)a1 + v11) & v21, v22, v20);
    unint64_t v24 = (v14 + v22) & v21;
    v23((v14 + (((unint64_t)a1 + v11) & v21)) & v21, v24, v20);
    v23((v14 + ((v14 + (((unint64_t)a1 + v11) & v21)) & v21)) & v21, (v14 + v24) & v21, v20);
  }
  return a1;
}

uint64_t destroy for SessionKeyManager.State.HandshakeSecret(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v3)();
  uint64_t v4 = *(void *)(v3 + 56);
  uint64_t v5 = type metadata accessor for SymmetricKey();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  uint64_t v13 = v6 + 8;
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v4 + a1 + v7) & ~v7;
  v12(v8, v5);
  uint64_t v9 = *(void *)(v13 + 56) + v7;
  uint64_t v10 = (v9 + v8) & ~v7;
  v12(v10, v5);

  return ((uint64_t (*)(uint64_t, uint64_t))v12)((v9 + v10) & ~v7, v5);
}

uint64_t initializeWithCopy for SessionKeyManager.State.HandshakeSecret(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48);
  uint64_t v7 = type metadata accessor for SymmetricKey();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  uint64_t v10 = v8 + 16;
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = v6 + v11;
  uint64_t v13 = (v6 + v11 + a1) & ~v11;
  uint64_t v14 = (v12 + a2) & ~v11;
  v9(v13, v14, v7);
  uint64_t v15 = *(void *)(v10 + 48) + v11;
  uint64_t v16 = (v15 + v13) & ~v11;
  uint64_t v17 = (v15 + v14) & ~v11;
  v9(v16, v17, v7);
  v9((v15 + v16) & ~v11, (v15 + v17) & ~v11, v7);
  return a1;
}

uint64_t assignWithCopy for SessionKeyManager.State.HandshakeSecret(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40);
  uint64_t v7 = type metadata accessor for SymmetricKey();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 24);
  uint64_t v10 = v8 + 24;
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = v6 + v11;
  uint64_t v13 = (v6 + v11 + a1) & ~v11;
  uint64_t v14 = (v12 + a2) & ~v11;
  v9(v13, v14, v7);
  uint64_t v15 = *(void *)(v10 + 40) + v11;
  uint64_t v16 = (v15 + v13) & ~v11;
  uint64_t v17 = (v15 + v14) & ~v11;
  v9(v16, v17, v7);
  v9((v15 + v16) & ~v11, (v15 + v17) & ~v11, v7);
  return a1;
}

uint64_t initializeWithTake for SessionKeyManager.State.HandshakeSecret(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32);
  uint64_t v7 = type metadata accessor for SymmetricKey();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32);
  uint64_t v10 = v8 + 32;
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = v6 + v11;
  uint64_t v13 = (v6 + v11 + a1) & ~v11;
  uint64_t v14 = (v12 + a2) & ~v11;
  v9(v13, v14, v7);
  uint64_t v15 = *(void *)(v10 + 32) + v11;
  uint64_t v16 = (v15 + v13) & ~v11;
  uint64_t v17 = (v15 + v14) & ~v11;
  v9(v16, v17, v7);
  v9((v15 + v16) & ~v11, (v15 + v17) & ~v11, v7);
  return a1;
}

uint64_t assignWithTake for SessionKeyManager.State.HandshakeSecret(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24);
  uint64_t v7 = type metadata accessor for SymmetricKey();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 40);
  uint64_t v10 = v8 + 40;
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = v6 + v11;
  uint64_t v13 = (v6 + v11 + a1) & ~v11;
  uint64_t v14 = (v12 + a2) & ~v11;
  v9(v13, v14, v7);
  uint64_t v15 = *(void *)(v10 + 24) + v11;
  uint64_t v16 = (v15 + v13) & ~v11;
  uint64_t v17 = (v15 + v14) & ~v11;
  v9(v16, v17, v7);
  v9((v15 + v16) & ~v11, (v15 + v17) & ~v11, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for SessionKeyManager.State.HandshakeSecret(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  uint64_t v8 = type metadata accessor for SymmetricKey();
  uint64_t v9 = *(void *)(v8 - 8);
  unsigned int v10 = *(_DWORD *)(v9 + 84);
  if (v10 <= v7) {
    unsigned int v11 = v7;
  }
  else {
    unsigned int v11 = *(_DWORD *)(v9 + 84);
  }
  uint64_t v12 = *(unsigned __int8 *)(v9 + 80);
  if (!a2) {
    return 0;
  }
  uint64_t v13 = *(void *)(v6 + 64) + v12;
  if (a2 <= v11) {
    goto LABEL_24;
  }
  uint64_t v14 = ((*(void *)(*(void *)(v8 - 8) + 64)
        + v12
        + ((*(void *)(*(void *)(v8 - 8) + 64) + v12 + (v13 & ~v12)) & ~v12)) & ~v12)
      + *(void *)(*(void *)(v8 - 8) + 64);
  char v15 = 8 * v14;
  if (v14 <= 3)
  {
    unsigned int v17 = ((a2 - v11 + ~(-1 << v15)) >> v15) + 1;
    if (HIWORD(v17))
    {
      int v16 = *(_DWORD *)((char *)a1 + v14);
      if (!v16) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v17 > 0xFF)
    {
      int v16 = *(unsigned __int16 *)((char *)a1 + v14);
      if (!*(unsigned __int16 *)((char *)a1 + v14)) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v17 < 2)
    {
LABEL_24:
      if (v11)
      {
        if (v7 >= v10)
        {
          uint64_t v23 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v6 + 48);
          return v23(a1, v7, v5);
        }
        else
        {
          uint64_t v21 = *(uint64_t (**)(unint64_t))(v9 + 48);
          return v21(((unint64_t)a1 + v13) & ~v12);
        }
      }
      return 0;
    }
  }
  int v16 = *((unsigned __int8 *)a1 + v14);
  if (!*((unsigned char *)a1 + v14)) {
    goto LABEL_24;
  }
LABEL_14:
  int v18 = (v16 - 1) << v15;
  if (v14 > 3) {
    int v18 = 0;
  }
  if (v14)
  {
    if (v14 <= 3) {
      int v19 = v14;
    }
    else {
      int v19 = 4;
    }
    switch(v19)
    {
      case 2:
        int v20 = *a1;
        break;
      case 3:
        int v20 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v20 = *(_DWORD *)a1;
        break;
      default:
        int v20 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v20 = 0;
  }
  return v11 + (v20 | v18) + 1;
}

void storeEnumTagSinglePayload for SessionKeyManager.State.HandshakeSecret(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v24 = v8;
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  uint64_t v10 = *(void *)(type metadata accessor for SymmetricKey() - 8);
  uint64_t v11 = v10;
  unsigned int v12 = *(_DWORD *)(v10 + 84);
  if (v12 <= v9) {
    unsigned int v13 = v9;
  }
  else {
    unsigned int v13 = *(_DWORD *)(v10 + 84);
  }
  uint64_t v14 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v15 = *(void *)(v8 + 64) + v14;
  size_t v16 = ((*(void *)(v10 + 64) + v14 + ((*(void *)(v10 + 64) + v14 + (v15 & ~v14)) & ~v14)) & ~v14)
      + *(void *)(v10 + 64);
  if (a3 <= v13)
  {
    int v17 = 0;
  }
  else if (v16 <= 3)
  {
    unsigned int v20 = ((a3 - v13 + ~(-1 << (8 * v16))) >> (8 * v16)) + 1;
    if (HIWORD(v20))
    {
      int v17 = 4;
    }
    else if (v20 >= 0x100)
    {
      int v17 = 2;
    }
    else
    {
      int v17 = v20 > 1;
    }
  }
  else
  {
    int v17 = 1;
  }
  if (v13 < a2)
  {
    unsigned int v18 = ~v13 + a2;
    if (v16 < 4)
    {
      int v19 = (v18 >> (8 * v16)) + 1;
      if (v16)
      {
        int v21 = v18 & ~(-1 << (8 * v16));
        bzero(a1, v16);
        if (v16 == 3)
        {
          *(_WORD *)a1 = v21;
          a1[2] = BYTE2(v21);
        }
        else if (v16 == 2)
        {
          *(_WORD *)a1 = v21;
        }
        else
        {
          *a1 = v21;
        }
      }
    }
    else
    {
      bzero(a1, v16);
      *(_DWORD *)a1 = v18;
      int v19 = 1;
    }
    switch(v17)
    {
      case 1:
        a1[v16] = v19;
        return;
      case 2:
        *(_WORD *)&a1[v16] = v19;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v16] = v19;
        return;
      default:
        return;
    }
  }
  switch(v17)
  {
    case 1:
      a1[v16] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v16] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x1B5772344);
    case 4:
      *(_DWORD *)&a1[v16] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if (v9 >= v12)
        {
          uint64_t v23 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v24 + 56);
          v23(a1, a2, v9, v7);
        }
        else
        {
          unint64_t v22 = *(void (**)(unint64_t, uint64_t))(v11 + 56);
          v22((unint64_t)&a1[v15] & ~v14, a2);
        }
      }
      return;
  }
}

uint64_t lazy protocol witness table accessor for type [UInt8] and conformance <A> [A](unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [UInt8]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t outlined init with take of SessionTicket(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SessionTicket();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of SessionTicket(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SessionTicket();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void specialized Data._Representation.withUnsafeMutableBytes<A>(_:)(uint64_t *a1, int __c)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = a1[1];
  switch(v2 >> 62)
  {
    case 1uLL:
      uint64_t __b = *a1;
      uint64_t v19 = v2 & 0x3FFFFFFFFFFFFFFFLL;
      specialized Data.InlineSlice.withUnsafeMutableBytes<A>(_:)((int *)&__b, __c);
      uint64_t v5 = __b;
      unint64_t v6 = v19 | 0x4000000000000000;
      goto LABEL_4;
    case 2uLL:
      uint64_t __b = *a1;
      uint64_t v19 = v2 & 0x3FFFFFFFFFFFFFFFLL;
      Data.LargeSlice.ensureUniqueReference()();
      uint64_t v7 = v19;
      uint64_t v8 = *(void *)(__b + 16);
      uint64_t v9 = *(void *)(__b + 24);
      uint64_t v10 = __DataStorage._bytes.getter();
      if (!v10)
      {
        __break(1u);
        JUMPOUT(0x1B5772658);
      }
      uint64_t v11 = v10;
      uint64_t v12 = __DataStorage._offset.getter();
      uint64_t v13 = v8 - v12;
      if (__OFSUB__(v8, v12))
      {
        __break(1u);
LABEL_14:
        __break(1u);
      }
      BOOL v14 = __OFSUB__(v9, v8);
      int64_t v15 = v9 - v8;
      if (v14) {
        goto LABEL_14;
      }
      uint64_t v16 = __DataStorage._length.getter();
      if (v16 >= v15) {
        size_t v17 = v15;
      }
      else {
        size_t v17 = v16;
      }
      memset((void *)(v11 + v13), __c, v17);
      *a1 = __b;
      a1[1] = v7 | 0x8000000000000000;
      return;
    case 3uLL:
      return;
    default:
      uint64_t __b = *a1;
      LOWORD(v19) = v2;
      BYTE2(v19) = BYTE2(v2);
      BYTE3(v19) = BYTE3(v2);
      BYTE4(v19) = BYTE4(v2);
      BYTE5(v19) = BYTE5(v2);
      BYTE6(v19) = BYTE6(v2);
      memset(&__b, __c, BYTE6(v2));
      uint64_t v5 = __b;
      unint64_t v6 = v19 | ((unint64_t)BYTE4(v19) << 32) | ((unint64_t)BYTE5(v19) << 40) | ((unint64_t)BYTE6(v19) << 48);
LABEL_4:
      *a1 = v5;
      a1[1] = v6;
      return;
  }
}

void *specialized _ArrayBuffer._consumeAndCreateNew()(void *a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, a1[2], 0, a1);
}

void specialized Data.InlineSlice.withUnsafeMutableBytes<A>(_:)(int *a1, int a2)
{
  Data.InlineSlice.ensureUniqueReference()();
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  if ((int)v5 < (int)v4)
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v6 = __DataStorage._bytes.getter();
  if (!v6)
  {
LABEL_12:
    __break(1u);
    return;
  }
  uint64_t v7 = v6;
  uint64_t v8 = __DataStorage._offset.getter();
  uint64_t v9 = v4 - v8;
  if (__OFSUB__(v4, v8))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  int64_t v10 = v5 - v4;
  uint64_t v11 = __DataStorage._length.getter();
  if (v11 >= v10) {
    size_t v12 = v10;
  }
  else {
    size_t v12 = v11;
  }

  memset((void *)(v7 + v9), a2, v12);
}

uint64_t specialized RandomAccessCollection<>.index(_:offsetBy:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  BOOL v4 = __OFADD__(a1, a2);
  uint64_t result = a1 + a2;
  if (v4)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  switch(a4 >> 62)
  {
    case 1uLL:
      uint64_t v7 = (int)a3;
      uint64_t v6 = a3 >> 32;
      break;
    case 2uLL:
      uint64_t v7 = *(void *)(a3 + 16);
      uint64_t v6 = *(void *)(a3 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v7 = 0;
      uint64_t v6 = BYTE6(a4);
      break;
  }
  if (v6 < result || result < v7)
  {
LABEL_10:
    __break(1u);
    JUMPOUT(0x1B577277CLL);
  }
  return result;
}

uint64_t specialized RandomAccessCollection<>.distance(from:to:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  switch(a4 >> 62)
  {
    case 1uLL:
      uint64_t v5 = (int)a3;
      uint64_t v4 = a3 >> 32;
      break;
    case 2uLL:
      uint64_t v5 = *(void *)(a3 + 16);
      uint64_t v4 = *(void *)(a3 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v5 = 0;
      uint64_t v4 = BYTE6(a4);
      break;
  }
  if (v4 < a1 || v5 > a1)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  switch(a4 >> 62)
  {
    case 1uLL:
      uint64_t v7 = (int)a3;
      uint64_t v6 = a3 >> 32;
      break;
    case 2uLL:
      uint64_t v7 = *(void *)(a3 + 16);
      uint64_t v6 = *(void *)(a3 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v7 = 0;
      uint64_t v6 = BYTE6(a4);
      break;
  }
  if (v6 < a2 || v7 > a2) {
    goto LABEL_16;
  }
  BOOL v8 = __OFSUB__(a2, a1);
  uint64_t result = a2 - a1;
  if (v8)
  {
LABEL_17:
    __break(1u);
    JUMPOUT(0x1B5772858);
  }
  return result;
}

uint64_t _s8SwiftTLS17SessionKeyManagerV5State33_BECB9E0D58BD55F969B88420A6B610BBLLO15HandshakeSecretV35dataToSignInServerCertificateVerifyAA10ByteBufferVvgySWXEfU_TA_0(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #1 in ExportedAuthenticator.validate(keyParser:)(a1, a2);
}

uint64_t static Extension.ServerCertificateType.__derived_enum_equals(_:_:)(uint64_t a1, char a2, uint64_t a3, char a4)
{
  if (a2)
  {
    return (a4 & 1) != 0 && a1 == a3;
  }
  else if (a4)
  {
    return 0;
  }
  else
  {
    return specialized static Array<A>.== infix(_:_:)(a1, a3);
  }
}

uint64_t ByteBuffer.writeServerCertificateType(_:)(uint64_t a1, char a2)
{
  v7[5] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    char v6 = a1;
    _OWORD v7[3] = MEMORY[0x1E4FBB2B8];
    v7[4] = MEMORY[0x1E4F27EF0];
    v7[0] = &v6;
    v7[1] = v7;
    __swift_project_boxed_opaque_existential_1(v7, MEMORY[0x1E4FBB2B8]);
    Data._Representation.append(contentsOf:)();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
    return 1;
  }
  else
  {
    outlined copy of Extension.ServerCertificateType(a1, 0);
    unint64_t v4 = specialized ByteBuffer.writeVariableLengthVector<A>(lengthFieldType:_:)(v2, a1);
    outlined consume of Extension.SupportedVersions(a1, 0);
    return v4;
  }
}

char *ByteBuffer.readServerCertificateType(messageType:)(unsigned __int8 a1)
{
  uint64_t v3 = v1;
  if (a1 != 1)
  {
    if (a1 != 8)
    {
      int v14 = a1 | 0x140000;
      lazy protocol witness table accessor for type TLSError and conformance TLSError();
      swift_allocError();
      *(_DWORD *)uint64_t v15 = v14;
      *(unsigned char *)(v15 + 4) = 0;
      goto LABEL_20;
    }
    uint64_t v4 = v1[2];
    uint64_t v5 = v4 + 1;
    if (!__OFADD__(v4, 1))
    {
      uint64_t v6 = *v1;
      unint64_t v7 = v1[1];
      switch(v7 >> 62)
      {
        case 1uLL:
          if (v6 >> 32 < v5) {
            goto LABEL_19;
          }
          goto LABEL_16;
        case 2uLL:
          if (*(void *)(v6 + 24) >= v5) {
            goto LABEL_16;
          }
          goto LABEL_19;
        case 3uLL:
          if (v5 > 0) {
            goto LABEL_19;
          }
          goto LABEL_16;
        default:
          if (BYTE6(v7) < v5) {
            goto LABEL_19;
          }
LABEL_16:
          if (v5 < v4) {
            goto LABEL_51;
          }
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<Int>);
          lazy protocol witness table accessor for type Data and conformance Data();
          lazy protocol witness table accessor for type Range<Int> and conformance Range<A>();
          DataProtocol.copyBytes<A>(to:from:)();
          unint64_t v2 = 0;
          v1[2] = v5;
          break;
      }
      return v2;
    }
    goto LABEL_50;
  }
  uint64_t v9 = *v1;
  unint64_t v8 = v1[1];
  uint64_t v10 = v1[2];
  outlined copy of Data._Representation(*v1, v8);
  __int16 v11 = specialized ByteBuffer.readInteger<A>(as:)();
  if ((v11 & 0x100) != 0 || (uint64_t v35 = ByteBuffer.readSlice(length:)(v11), v12 >> 60 == 15))
  {
    outlined consume of Data._Representation(*v1, v1[1]);
    *unint64_t v1 = v9;
    v1[1] = v8;
    v1[2] = v10;
LABEL_19:
    lazy protocol witness table accessor for type TLSError and conformance TLSError();
    swift_allocError();
    *(_DWORD *)uint64_t v20 = 0;
    *(unsigned char *)(v20 + 4) = 1;
LABEL_20:
    swift_willThrow();
    return v2;
  }
  unint64_t v16 = v12;
  uint64_t v17 = v13;
  uint64_t v18 = 0;
  uint64_t v19 = BYTE6(v12);
  switch(v12 >> 62)
  {
    case 1uLL:
      uint64_t v18 = v35 >> 32;
      break;
    case 2uLL:
      uint64_t v18 = *(void *)(v35 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v18 = BYTE6(v12);
      break;
  }
  unint64_t v33 = v3;
  unint64_t v34 = v12 >> 62;
  uint64_t v32 = v9;
  BOOL v22 = __OFSUB__(v18, v13);
  uint64_t v23 = v18 - v13;
  if (v22) {
    goto LABEL_52;
  }
  uint64_t v24 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v23 & ~(v23 >> 63), 0, MEMORY[0x1E4FBC860]);
  uint64_t v25 = v17 + 1;
  if (__OFADD__(v17, 1))
  {
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
LABEL_51:
    __break(1u);
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  unint64_t v2 = v24;
  uint64_t v26 = v17;
  while (2)
  {
    uint64_t v27 = v26;
    uint64_t v26 = v25;
    uint64_t v28 = v19;
    switch((int)v34)
    {
      case 1:
        uint64_t v28 = v35 >> 32;
        goto LABEL_29;
      case 2:
        if (*(void *)(v35 + 24) < v25) {
          goto LABEL_40;
        }
        goto LABEL_34;
      case 3:
        if (v25 < 1) {
          goto LABEL_34;
        }
        uint64_t v19 = 0;
        goto LABEL_44;
      default:
LABEL_29:
        if (v28 >= v25)
        {
LABEL_34:
          if (v25 < v27) {
            goto LABEL_49;
          }
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<Int>);
          lazy protocol witness table accessor for type Data and conformance Data();
          lazy protocol witness table accessor for type Range<Int> and conformance Range<A>();
          DataProtocol.copyBytes<A>(to:from:)();
          unint64_t v30 = *((void *)v2 + 2);
          unint64_t v29 = *((void *)v2 + 3);
          if (v30 >= v29 >> 1) {
            unint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v29 > 1), v30 + 1, 1, v2);
          }
          *((void *)v2 + 2) = v30 + 1;
          v2[v30 + 32] = 0;
          BOOL v22 = __OFADD__(v25++, 1);
          if (v22) {
            goto LABEL_48;
          }
          continue;
        }
LABEL_40:
        if (v34)
        {
          uint64_t v19 = v35 >> 32;
          if (v34 != 1) {
            uint64_t v19 = *(void *)(v35 + 24);
          }
        }
LABEL_44:
        if (__OFSUB__(v19, v27)) {
LABEL_53:
        }
          __break(1u);
        if (v19 != v27)
        {
          lazy protocol witness table accessor for type TLSError and conformance TLSError();
          swift_allocError();
          *(_DWORD *)uint64_t v31 = 1;
          *(unsigned char *)(v31 + 4) = 1;
          swift_willThrow();
          swift_bridgeObjectRelease();
          outlined consume of Data._Representation(v35, v16);
          outlined consume of Data._Representation(*v33, v33[1]);
          *unint64_t v33 = v32;
          v33[1] = v8;
          v33[2] = v10;
          goto LABEL_20;
        }
        outlined consume of ByteBuffer?(v35, v16);
        outlined consume of Data._Representation(v32, v8);
        return v2;
    }
  }
}

void Extension.ServerCertificateType.hash(into:)(uint64_t a1, uint64_t a2, char a3)
{
  if (a3)
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(a2);
  }
  else
  {
    Hasher._combine(_:)(0);
    Swift::UInt v4 = *(void *)(a2 + 16);
    Hasher._combine(_:)(v4);
    if (v4)
    {
      uint64_t v5 = (Swift::UInt8 *)(a2 + 32);
      do
      {
        Swift::UInt8 v6 = *v5++;
        Hasher._combine(_:)(v6);
        --v4;
      }
      while (v4);
    }
  }
}

Swift::Int Extension.ServerCertificateType.hashValue.getter(uint64_t a1, char a2)
{
  Hasher.init(_seed:)();
  if (a2)
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(a1);
  }
  else
  {
    Hasher._combine(_:)(0);
    Swift::UInt v4 = *(void *)(a1 + 16);
    Hasher._combine(_:)(v4);
    if (v4)
    {
      uint64_t v5 = (Swift::UInt8 *)(a1 + 32);
      do
      {
        Swift::UInt8 v6 = *v5++;
        Hasher._combine(_:)(v6);
        --v4;
      }
      while (v4);
    }
  }
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Extension.ServerCertificateType()
{
  return Extension.ServerCertificateType.hashValue.getter(*(void *)v0, *(unsigned char *)(v0 + 8));
}

void protocol witness for Hashable.hash(into:) in conformance Extension.ServerCertificateType(uint64_t a1)
{
  Extension.ServerCertificateType.hash(into:)(a1, *(void *)v1, *(unsigned char *)(v1 + 8));
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Extension.ServerCertificateType()
{
  uint64_t v1 = *(void *)v0;
  char v2 = *(unsigned char *)(v0 + 8);
  Hasher.init(_seed:)();
  Extension.ServerCertificateType.hash(into:)((uint64_t)v4, v1, v2);
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance Extension.ServerCertificateType(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  char v6 = *((unsigned char *)a2 + 8);
  if (a1[1])
  {
    return (v6 & 1) != 0 && v4 == v5;
  }
  else if (v6)
  {
    return 0;
  }
  else
  {
    return specialized static Array<A>.== infix(_:_:)(v4, v5);
  }
}

unint64_t lazy protocol witness table accessor for type Extension.ServerCertificateType and conformance Extension.ServerCertificateType()
{
  unint64_t result = lazy protocol witness table cache variable for type Extension.ServerCertificateType and conformance Extension.ServerCertificateType;
  if (!lazy protocol witness table cache variable for type Extension.ServerCertificateType and conformance Extension.ServerCertificateType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Extension.ServerCertificateType and conformance Extension.ServerCertificateType);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for Extension.ServerCertificateType(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  outlined copy of Extension.ServerCertificateType(*(void *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

uint64_t destroy for Extension.ServerCertificateType(uint64_t a1)
{
  return outlined consume of Extension.SupportedVersions(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t assignWithCopy for Extension.ServerCertificateType(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  outlined copy of Extension.ServerCertificateType(*(void *)a2, v4);
  uint64_t v5 = *(void *)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  outlined consume of Extension.SupportedVersions(v5, v6);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t assignWithTake for Extension.ServerCertificateType(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  char v4 = *((unsigned char *)a2 + 8);
  uint64_t v5 = *(void *)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  outlined consume of Extension.SupportedVersions(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for Extension.ServerCertificateType(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Extension.ServerCertificateType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t getEnumTag for Extension.ServerCertificateType(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t destructiveInjectEnumTag for Extension.ServerCertificateType(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Extension.ServerCertificateType()
{
  return &type metadata for Extension.ServerCertificateType;
}

void EncryptedExtensions.hash(into:)(uint64_t a1, uint64_t a2)
{
  Swift::UInt v4 = *(void *)(a2 + 16);
  Hasher._combine(_:)(v4);
  if (v4)
  {
    uint64_t v5 = (long long *)(a2 + 32);
    swift_bridgeObjectRetain();
    do
    {
      outlined init with take of Extension(v5, (uint64_t)v6);
      outlined retain of Extension((uint64_t)v6, (void (*)(void, void, void, void, void))outlined copy of Extension);
      Extension.hash(into:)(a1);
      outlined retain of Extension((uint64_t)v6, (void (*)(void, void, void, void, void))outlined consume of Extension);
      uint64_t v5 = (long long *)((char *)v5 + 40);
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
  }
}

Swift::Int EncryptedExtensions.hashValue.getter(uint64_t a1)
{
  Hasher.init(_seed:)();
  Swift::UInt v2 = *(void *)(a1 + 16);
  Hasher._combine(_:)(v2);
  if (v2)
  {
    unsigned int v3 = (long long *)(a1 + 32);
    swift_bridgeObjectRetain();
    do
    {
      outlined init with take of Extension(v3, (uint64_t)v6);
      outlined retain of Extension((uint64_t)v6, (void (*)(void, void, void, void, void))outlined copy of Extension);
      Extension.hash(into:)((uint64_t)&v5);
      outlined retain of Extension((uint64_t)v6, (void (*)(void, void, void, void, void))outlined consume of Extension);
      unsigned int v3 = (long long *)((char *)v3 + 40);
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance EncryptedExtensions()
{
  return EncryptedExtensions.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance EncryptedExtensions(uint64_t a1)
{
  EncryptedExtensions.hash(into:)(a1, *v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance EncryptedExtensions()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)();
  Swift::UInt v2 = *(void *)(v1 + 16);
  Hasher._combine(_:)(v2);
  if (v2)
  {
    unsigned int v3 = (long long *)(v1 + 32);
    swift_bridgeObjectRetain();
    do
    {
      outlined init with take of Extension(v3, (uint64_t)v6);
      outlined retain of Extension((uint64_t)v6, (void (*)(void, void, void, void, void))outlined copy of Extension);
      Extension.hash(into:)((uint64_t)&v5);
      outlined retain of Extension((uint64_t)v6, (void (*)(void, void, void, void, void))outlined consume of Extension);
      unsigned int v3 = (long long *)((char *)v3 + 40);
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance EncryptedExtensions(uint64_t *a1, uint64_t *a2)
{
  return specialized static Array<A>.== infix(_:_:)(*a1, *a2);
}

unint64_t EncryptedExtensions.write(into:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v6 = 0;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v6 = v2 >> 32;
      break;
    case 2uLL:
      uint64_t v6 = *(void *)(v2 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v6 = BYTE6(v3);
      break;
  }
  unsigned __int16 v36 = 0;
  uint64_t v7 = MEMORY[0x1E4FBB2B8];
  uint64_t v33 = MEMORY[0x1E4FBB2B8];
  uint64_t v34 = MEMORY[0x1E4F27EF0];
  uint64_t v31 = &v36;
  uint64_t v32 = v37;
  __swift_project_boxed_opaque_existential_1(&v31, MEMORY[0x1E4FBB2B8]);
  Data._Representation.append(contentsOf:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v31);
  uint64_t v8 = *(void *)(a2 + 16);
  if (!v8)
  {
LABEL_39:
    unint64_t v10 = 0;
    goto LABEL_40;
  }
  uint64_t v27 = v6;
  uint64_t v9 = a2 + 32;
  swift_bridgeObjectRetain();
  unint64_t v10 = 0;
  do
  {
    outlined init with take of Extension((long long *)v9, (uint64_t)v35);
    uint64_t v11 = *(void *)v9;
    unint64_t v12 = *(void *)(v9 + 8);
    unint64_t v13 = *(void *)(v9 + 16);
    outlined init with take of Extension(v35, (uint64_t)&v36);
    v9 += 40;
    unsigned int v14 = 42;
    switch(v37[30])
    {
      case 1:
        swift_bridgeObjectRetain();
        unsigned int v14 = 10;
        break;
      case 2:
        outlined init with take of Extension.SupportedVersions((uint64_t)&v36, (uint64_t)v39);
        outlined copy of Extension.ServerCertificateType(v11, v12 & 1);
        unsigned int v14 = 43;
        break;
      case 3:
      case 9:
        outlined copy of Data._Representation(v11, v12);
        unsigned int v14 = 16;
        break;
      case 4:
        outlined init with take of Extension.KeyShare((uint64_t)&v36, (uint64_t)v40);
        outlined copy of Extension.KeyShare(v11, v12, v13);
        unsigned int v14 = 51;
        break;
      case 5:
        break;
      case 6:
        swift_bridgeObjectRetain();
        unsigned int v14 = 13;
        break;
      case 7:
        outlined init with take of Extension.ServerCertificateType((uint64_t)&v36, (uint64_t)v41);
        outlined copy of Extension.ServerCertificateType(v11, v12 & 1);
        unsigned int v14 = 20;
        break;
      case 8:
        outlined copy of Data._Representation(v11, v12);
        unsigned int v14 = 57;
        break;
      case 0xA:
        swift_bridgeObjectRetain();
        unsigned int v14 = 45;
        break;
      case 0xB:
        outlined init with take of Extension.PreSharedKey((uint64_t)&v36, (uint64_t)v42);
        outlined copy of Extension.PreSharedKey(v11, v12, v13 & 1);
        unsigned int v14 = 41;
        break;
      case 0xC:
        outlined init with take of Extension.TicketRequest((uint64_t)&v36, (uint64_t)v30);
        unsigned int v14 = 58;
        break;
      case 0xD:
        unsigned int v14 = v36;
        outlined copy of Data._Representation(v12, v13);
        break;
      default:
        outlined init with take of Extension.ServerName((uint64_t)&v36, (uint64_t)v38);
        outlined copy of ByteBuffer?(v11, v12);
        unsigned int v14 = 0;
        break;
    }
    __int16 v28 = __rev16(v14);
    uint64_t v33 = v7;
    uint64_t v15 = MEMORY[0x1E4F27EF0];
    uint64_t v34 = MEMORY[0x1E4F27EF0];
    uint64_t v31 = (unsigned __int16 *)&v28;
    uint64_t v32 = &v29;
    __swift_project_boxed_opaque_existential_1(&v31, v7);
    Data._Representation.append(contentsOf:)();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v31);
    uint64_t v16 = *a1;
    unint64_t v17 = a1[1];
    uint64_t v18 = 0;
    switch(v17 >> 62)
    {
      case 1uLL:
        uint64_t v18 = v16 >> 32;
        break;
      case 2uLL:
        uint64_t v18 = *(void *)(v16 + 24);
        break;
      case 3uLL:
        break;
      default:
        uint64_t v18 = BYTE6(v17);
        break;
    }
    __int16 v28 = 0;
    uint64_t v33 = v7;
    uint64_t v34 = v15;
    uint64_t v31 = (unsigned __int16 *)&v28;
    uint64_t v32 = &v29;
    __swift_project_boxed_opaque_existential_1(&v31, v7);
    Data._Representation.append(contentsOf:)();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v31);
    unint64_t v19 = closure #1 in ByteBuffer.writeExtension(_:)(a1, v35);
    if ((v19 & 0x8000000000000000) != 0)
    {
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
LABEL_47:
      __break(1u);
LABEL_48:
      __break(1u);
    }
    unint64_t v20 = v19;
    if (v19 >> 16) {
      goto LABEL_42;
    }
    uint64_t v21 = v18 + 2;
    if (__OFADD__(v18, 2)) {
      goto LABEL_43;
    }
    if (v18 < a1[2]) {
      goto LABEL_44;
    }
    uint64_t v22 = *a1;
    unint64_t v23 = a1[1];
    uint64_t v24 = 0;
    switch(v23 >> 62)
    {
      case 1uLL:
        uint64_t v24 = v22 >> 32;
        break;
      case 2uLL:
        uint64_t v24 = *(void *)(v22 + 24);
        break;
      case 3uLL:
        break;
      default:
        uint64_t v24 = BYTE6(v23);
        break;
    }
    if (v24 < v21) {
      goto LABEL_45;
    }
    __int16 v28 = bswap32(v19) >> 16;
    if (v21 < v18) {
      goto LABEL_46;
    }
    uint64_t v33 = v7;
    uint64_t v34 = v15;
    uint64_t v31 = (unsigned __int16 *)&v28;
    uint64_t v32 = &v29;
    __swift_project_boxed_opaque_existential_1(&v31, v7);
    Data._Representation.replaceSubrange(_:with:count:)();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v31);
    outlined retain of Extension((uint64_t)v35, (void (*)(void, void, void, void, void))outlined consume of Extension);
    BOOL v25 = __OFADD__(v10, v20 + 4);
    v10 += v20 + 4;
    if (v25) {
      goto LABEL_47;
    }
    --v8;
  }
  while (v8);
  swift_bridgeObjectRelease();
  if ((v10 & 0x8000000000000000) != 0) {
    goto LABEL_48;
  }
  uint64_t v6 = v27;
  if (v10 >> 16)
  {
    __break(1u);
    goto LABEL_39;
  }
LABEL_40:
  specialized ByteBuffer.setInteger<A>(_:at:as:)(v10, v6);
  return v10 + 2;
}

uint64_t EncryptedExtensions.init(bytes:)(uint64_t *a1)
{
  return specialized EncryptedExtensions.init(bytes:)(a1);
}

void *readExtensions #1 (_:) in EncryptedExtensions.init(bytes:)(uint64_t *a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  unint64_t v30 = a1[1];
  uint64_t v3 = a1[2];
  uint64_t v4 = v3 + 2;
  if (__OFADD__(v3, 2))
  {
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
LABEL_51:
    __break(1u);
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
  }
  uint64_t v5 = v1;
  __int16 v28 = (void *)MEMORY[0x1E4FBC860];
  while (2)
  {
    uint64_t v6 = BYTE6(v30);
    switch(v30 >> 62)
    {
      case 1uLL:
        uint64_t v6 = v2 >> 32;
        goto LABEL_5;
      case 2uLL:
        if (*(void *)(v2 + 24) < v4) {
          return v28;
        }
        goto LABEL_10;
      case 3uLL:
        if (v4 < 1) {
          goto LABEL_10;
        }
        return v28;
      default:
LABEL_5:
        if (v6 < v4) {
          return v28;
        }
LABEL_10:
        uint64_t v31 = v2;
        unint64_t v32 = v30;
        if (v4 < v3) {
          goto LABEL_50;
        }
        uint64_t v36 = v3;
        unint64_t v37 = v4;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<Int>);
        lazy protocol witness table accessor for type Data and conformance Data();
        lazy protocol witness table accessor for type Range<Int> and conformance Range<A>();
        DataProtocol.copyBytes<A>(to:from:)();
        a1[2] = v4;
        uint64_t v7 = v4 + 2;
        if (__OFADD__(v4, 2)) {
          goto LABEL_51;
        }
        break;
    }
    unsigned int v8 = bswap32(0) >> 16;
    uint64_t v9 = v2 >> 32;
    uint64_t v10 = BYTE6(v30);
    switch(v30 >> 62)
    {
      case 1uLL:
        goto LABEL_14;
      case 2uLL:
        uint64_t v9 = *(void *)(v2 + 24);
        swift_retain();
LABEL_14:
        swift_retain();
        uint64_t v10 = v9;
        goto LABEL_15;
      case 3uLL:
        if (v7 < 1) {
          goto LABEL_18;
        }
        goto LABEL_46;
      default:
LABEL_15:
        if (v10 >= v7)
        {
LABEL_18:
          uint64_t v31 = v2;
          unint64_t v32 = v30;
          if (v7 < v4) {
            goto LABEL_52;
          }
          uint64_t v36 = v4;
          unint64_t v37 = v4 + 2;
          DataProtocol.copyBytes<A>(to:from:)();
          uint64_t v11 = bswap32(0) >> 16;
          a1[2] = v7;
          uint64_t v12 = v7 + v11;
          if (__OFADD__(v7, v11)) {
            goto LABEL_53;
          }
          uint64_t v13 = BYTE6(v30);
          switch(v30 >> 62)
          {
            case 1uLL:
              uint64_t v13 = v2 >> 32;
              goto LABEL_23;
            case 2uLL:
              uint64_t v13 = *(void *)(v2 + 24);
              goto LABEL_23;
            case 3uLL:
              if (v12 <= 0) {
                goto LABEL_26;
              }
              goto LABEL_46;
            default:
LABEL_23:
              if (v13 < v12) {
                goto LABEL_45;
              }
LABEL_26:
              if (v12 < v7) {
                goto LABEL_54;
              }
              uint64_t v14 = Data._Representation.subscript.getter();
              a1[2] = v12;
              uint64_t v16 = 0;
              switch(v15 >> 62)
              {
                case 1uLL:
                  uint64_t v16 = (int)v14;
                  break;
                case 2uLL:
                  uint64_t v16 = *(void *)(v14 + 16);
                  break;
                default:
                  break;
              }
              uint64_t v36 = v14;
              unint64_t v37 = v15;
              uint64_t v38 = v16;
              closure #1 in ByteBuffer.readExtension(messageType:helloRetryRequest:)(&v36, v8, 8u, 0, (uint64_t)&v31);
              if (v5) {
                goto LABEL_47;
              }
              uint64_t v17 = 0;
              switch(v37 >> 62)
              {
                case 1uLL:
                  uint64_t v17 = v36 >> 32;
                  break;
                case 2uLL:
                  uint64_t v17 = *(void *)(v36 + 24);
                  break;
                case 3uLL:
                  break;
                default:
                  uint64_t v17 = BYTE6(v37);
                  break;
              }
              if (__OFSUB__(v17, v38)) {
                goto LABEL_55;
              }
              if (v17 != v38)
              {
                lazy protocol witness table accessor for type TLSError and conformance TLSError();
                swift_allocError();
                *(_DWORD *)uint64_t v26 = 1;
                *(unsigned char *)(v26 + 4) = 1;
                swift_willThrow();
                outlined consume of Extension(v31, v32, v33, v34, v35);
LABEL_47:
                outlined consume of Data._Representation(v36, v37);
                outlined consume of Data._Representation(*a1, a1[1]);
                *a1 = v2;
                a1[1] = v30;
                a1[2] = v4;
                swift_willThrow();
                swift_bridgeObjectRelease();
                return v28;
              }
              outlined consume of Data._Representation(v36, v37);
              outlined consume of Data._Representation(v2, v30);
              uint64_t v18 = v31;
              unint64_t v19 = v32;
              unint64_t v20 = v33;
              uint64_t v21 = v34;
              char v22 = v35;
              outlined copy of Extension(v31, v32, v33, v34, v35);
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                __int16 v28 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v28[2] + 1, 1, v28);
              }
              unint64_t v24 = v28[2];
              unint64_t v23 = v28[3];
              if (v24 >= v23 >> 1) {
                __int16 v28 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v23 > 1), v24 + 1, 1, v28);
              }
              v28[2] = v24 + 1;
              BOOL v25 = &v28[5 * v24];
              v25[4] = v18;
              v25[5] = v19;
              v25[6] = v20;
              v25[7] = v21;
              *((unsigned char *)v25 + 64) = v22;
              outlined consume of Extension(v18, v19, v20, v21, v22);
              uint64_t v3 = a1[2];
              uint64_t v4 = v3 + 2;
              if (__OFADD__(v3, 2)) {
                goto LABEL_49;
              }
              break;
          }
          continue;
        }
LABEL_45:
        outlined consume of Data._Representation(v2, v30);
LABEL_46:
        *a1 = v2;
        a1[1] = v30;
        a1[2] = v4;
        return v28;
    }
  }
}

unint64_t protocol witness for HandshakeMessageProtocol.write(into:) in conformance EncryptedExtensions(uint64_t *a1)
{
  return EncryptedExtensions.write(into:)(a1, *v1);
}

uint64_t protocol witness for HandshakeMessageProtocol.init(bytes:) in conformance EncryptedExtensions@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = specialized EncryptedExtensions.init(bytes:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t specialized EncryptedExtensions.init(bytes:)(uint64_t *a1)
{
  uint64_t v5 = *a1;
  unint64_t v4 = a1[1];
  uint64_t v6 = a1[2];
  outlined copy of Data._Representation(*a1, v4);
  uint64_t v7 = specialized closure #1 in ByteBuffer.readVariableLengthVector<A, B>(lengthFieldType:_:)(a1);
  if (v1)
  {
    outlined consume of Data._Representation(*a1, a1[1]);
    *a1 = v5;
    a1[1] = v4;
    a1[2] = v6;
  }
  else
  {
    uint64_t v2 = v7;
    if (v7)
    {
      outlined consume of Data._Representation(v5, v4);
      return v2;
    }
    outlined consume of Data._Representation(*a1, a1[1]);
    *a1 = v5;
    a1[1] = v4;
    a1[2] = v6;
    lazy protocol witness table accessor for type TLSError and conformance TLSError();
    swift_allocError();
    *(_DWORD *)uint64_t v9 = 0;
    *(unsigned char *)(v9 + 4) = 1;
  }
  swift_willThrow();
  return v2;
}

unint64_t lazy protocol witness table accessor for type EncryptedExtensions and conformance EncryptedExtensions()
{
  unint64_t result = lazy protocol witness table cache variable for type EncryptedExtensions and conformance EncryptedExtensions;
  if (!lazy protocol witness table cache variable for type EncryptedExtensions and conformance EncryptedExtensions)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EncryptedExtensions and conformance EncryptedExtensions);
  }
  return result;
}

ValueMetadata *type metadata accessor for EncryptedExtensions()
{
  return &type metadata for EncryptedExtensions;
}

BOOL static Extension.TicketRequest.__derived_enum_equals(_:_:)(int a1, int a2)
{
  BOOL v2 = a1 == a2;
  if ((a2 & 0x10000) == 0) {
    BOOL v2 = 0;
  }
  BOOL v3 = (unsigned __int16)a1 == (unsigned __int16)a2;
  if ((a2 & 0x10000) != 0) {
    BOOL v3 = 0;
  }
  if ((a1 & 0x10000) != 0) {
    return v2;
  }
  else {
    return v3;
  }
}

uint64_t ByteBuffer.writeTicketRequestExtension(_:)(unsigned int a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((a1 & 0x10000) != 0)
  {
    char v5 = a1;
    uint64_t v8 = MEMORY[0x1E4FBB2B8];
    uint64_t v9 = MEMORY[0x1E4F27EF0];
    uint64_t v6 = &v5;
    uint64_t v7 = &v6;
    __swift_project_boxed_opaque_existential_1(&v6, MEMORY[0x1E4FBB2B8]);
    Data._Representation.append(contentsOf:)();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v6);
    return 1;
  }
  else
  {
    unsigned int v1 = a1 >> 8;
    char v5 = a1;
    uint64_t v2 = MEMORY[0x1E4FBB2B8];
    uint64_t v3 = MEMORY[0x1E4F27EF0];
    uint64_t v8 = MEMORY[0x1E4FBB2B8];
    uint64_t v9 = MEMORY[0x1E4F27EF0];
    uint64_t v6 = &v5;
    uint64_t v7 = &v6;
    __swift_project_boxed_opaque_existential_1(&v6, MEMORY[0x1E4FBB2B8]);
    Data._Representation.append(contentsOf:)();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v6);
    char v5 = v1;
    uint64_t v8 = v2;
    uint64_t v9 = v3;
    uint64_t v6 = &v5;
    uint64_t v7 = &v6;
    __swift_project_boxed_opaque_existential_1(&v6, v2);
    Data._Representation.append(contentsOf:)();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v6);
    return 2;
  }
}

uint64_t ByteBuffer.readTicketRequestExtension(messageType:)(unsigned __int8 a1)
{
  if (a1 == 8)
  {
    uint64_t v7 = v1[2];
    uint64_t v8 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
LABEL_21:
      __break(1u);
    }
    uint64_t v9 = *v1;
    unint64_t v10 = v1[1];
    switch(v10 >> 62)
    {
      case 1uLL:
        if (v9 >> 32 < v8) {
          goto LABEL_18;
        }
        goto LABEL_14;
      case 2uLL:
        if (*(void *)(v9 + 24) >= v8) {
          goto LABEL_14;
        }
        goto LABEL_18;
      case 3uLL:
        if (v8 > 0) {
          goto LABEL_18;
        }
        goto LABEL_14;
      default:
        if (BYTE6(v10) < v8) {
          goto LABEL_18;
        }
LABEL_14:
        if (v8 < v7) {
          goto LABEL_21;
        }
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<Int>);
        lazy protocol witness table accessor for type Data and conformance Data();
        lazy protocol witness table accessor for type Range<Int> and conformance Range<A>();
        DataProtocol.copyBytes<A>(to:from:)();
        int v6 = 0;
        v1[2] = v8;
        int v5 = 1;
        break;
    }
    return v6 | (v5 << 16);
  }
  if (a1 == 1)
  {
    __int16 v2 = specialized ByteBuffer.readInteger<A>(as:)();
    if ((v2 & 0x100) == 0)
    {
      unsigned __int8 v3 = v2;
      __int16 v4 = specialized ByteBuffer.readInteger<A>(as:)();
      if ((v4 & 0x100) == 0)
      {
        int v5 = 0;
        int v6 = (unsigned __int16)(v3 | (unsigned __int16)(v4 << 8));
        return v6 | (v5 << 16);
      }
    }
LABEL_18:
    lazy protocol witness table accessor for type TLSError and conformance TLSError();
    swift_allocError();
    *(_DWORD *)uint64_t v12 = 0;
    char v13 = 1;
  }
  else
  {
    int v11 = a1 | 0x3A0000;
    lazy protocol witness table accessor for type TLSError and conformance TLSError();
    swift_allocError();
    char v13 = 0;
    *(_DWORD *)uint64_t v12 = v11;
  }
  *(unsigned char *)(v12 + 4) = v13;
  return swift_willThrow();
}

void Extension.TicketRequest.hash(into:)(uint64_t a1, unsigned int a2)
{
  Swift::UInt8 v2 = a2;
  if ((a2 & 0x10000) != 0)
  {
    Hasher._combine(_:)(1uLL);
    LOBYTE(v3) = v2;
  }
  else
  {
    unsigned int v3 = a2 >> 8;
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(v2);
  }
  Hasher._combine(_:)(v3);
}

BOOL static Extension.TicketRequest.ServerTicketRequestHint.__derived_struct_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

Swift::Int Extension.TicketRequest.hashValue.getter(unsigned int a1)
{
  Hasher.init(_seed:)();
  if ((a1 & 0x10000) != 0)
  {
    Hasher._combine(_:)(1uLL);
    LOBYTE(v2) = a1;
  }
  else
  {
    unsigned int v2 = a1 >> 8;
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(a1);
  }
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Extension.TicketRequest()
{
  unsigned int v1 = *v0;
  char v2 = *((unsigned char *)v0 + 2);
  Hasher.init(_seed:)();
  if (v2)
  {
    Hasher._combine(_:)(1uLL);
    LOBYTE(v3) = v1;
  }
  else
  {
    unsigned int v3 = v1 >> 8;
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(v1);
  }
  Hasher._combine(_:)(v3);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance Extension.TicketRequest()
{
  unsigned int v1 = *v0;
  if (v0[1])
  {
    Hasher._combine(_:)(1uLL);
    LOBYTE(v2) = v1;
  }
  else
  {
    unsigned int v2 = v1 >> 8;
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(v1);
  }
  Hasher._combine(_:)(v2);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Extension.TicketRequest()
{
  unsigned int v1 = *v0;
  char v2 = *((unsigned char *)v0 + 2);
  Hasher.init(_seed:)();
  if (v2)
  {
    Hasher._combine(_:)(1uLL);
    LOBYTE(v3) = v1;
  }
  else
  {
    unsigned int v3 = v1 >> 8;
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(v1);
  }
  Hasher._combine(_:)(v3);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance Extension.TicketRequest(unsigned __int16 *a1, unsigned __int16 *a2)
{
  int v2 = *a2;
  BOOL v3 = *a1 == v2;
  if (!*((unsigned char *)a2 + 2)) {
    BOOL v3 = 0;
  }
  if (a1[1]) {
    return v3;
  }
  else {
    return (*a1 == v2) & ~*((unsigned __int8 *)a2 + 2);
  }
}

uint64_t ClientTicketRequest.description.getter()
{
  _StringGuts.grow(_:)(55);
  v0._countAndFlagsBits = 0xD00000000000001FLL;
  v0._object = (void *)0x80000001B5782FA0;
  String.append(_:)(v0);
  v1._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  v2._object = (void *)0x80000001B5782FC0;
  v2._countAndFlagsBits = 0xD000000000000013;
  String.append(_:)(v2);
  v3._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 41;
  v4._object = (void *)0xE100000000000000;
  String.append(_:)(v4);
  return 0;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ClientTicketRequest()
{
  return ClientTicketRequest.description.getter();
}

void Extension.TicketRequest.ServerTicketRequestHint.hash(into:)(int a1, Swift::UInt8 a2)
{
}

Swift::Int Extension.TicketRequest.ServerTicketRequestHint.hashValue.getter(Swift::UInt8 a1)
{
  return Hasher._finalize()();
}

unint64_t Extension.TicketRequest.ServerTicketRequestHint.description.getter()
{
  _StringGuts.grow(_:)(34);
  swift_bridgeObjectRelease();
  v0._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 41;
  v1._object = (void *)0xE100000000000000;
  String.append(_:)(v1);
  return 0xD00000000000001FLL;
}

unint64_t protocol witness for CustomStringConvertible.description.getter in conformance Extension.TicketRequest.ServerTicketRequestHint()
{
  return Extension.TicketRequest.ServerTicketRequestHint.description.getter();
}

unint64_t lazy protocol witness table accessor for type Extension.TicketRequest and conformance Extension.TicketRequest()
{
  unint64_t result = lazy protocol witness table cache variable for type Extension.TicketRequest and conformance Extension.TicketRequest;
  if (!lazy protocol witness table cache variable for type Extension.TicketRequest and conformance Extension.TicketRequest)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Extension.TicketRequest and conformance Extension.TicketRequest);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ClientTicketRequest and conformance ClientTicketRequest()
{
  unint64_t result = lazy protocol witness table cache variable for type ClientTicketRequest and conformance ClientTicketRequest;
  if (!lazy protocol witness table cache variable for type ClientTicketRequest and conformance ClientTicketRequest)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ClientTicketRequest and conformance ClientTicketRequest);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Extension.TicketRequest.ServerTicketRequestHint and conformance Extension.TicketRequest.ServerTicketRequestHint()
{
  unint64_t result = lazy protocol witness table cache variable for type Extension.TicketRequest.ServerTicketRequestHint and conformance Extension.TicketRequest.ServerTicketRequestHint;
  if (!lazy protocol witness table cache variable for type Extension.TicketRequest.ServerTicketRequestHint and conformance Extension.TicketRequest.ServerTicketRequestHint)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Extension.TicketRequest.ServerTicketRequestHint and conformance Extension.TicketRequest.ServerTicketRequestHint);
  }
  return result;
}

uint64_t __swift_memcpy3_1(uint64_t result, __int16 *a2)
{
  __int16 v2 = *a2;
  *(unsigned char *)(result + 2) = *((unsigned char *)a2 + 2);
  *(_WORD *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for Extension.TicketRequest(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF)
  {
    if ((a2 + 33554177) >> 24)
    {
      int v2 = *((unsigned __int8 *)a1 + 3);
      if (*((unsigned char *)a1 + 3)) {
        return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 16776961;
      }
    }
    else
    {
      int v2 = *(unsigned __int16 *)((char *)a1 + 3);
      if (*(unsigned __int16 *)((char *)a1 + 3)) {
        return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 16776961;
      }
    }
  }
  unsigned int v4 = *((unsigned __int8 *)a1 + 2);
  if (v4 <= 1) {
    int v5 = -1;
  }
  else {
    int v5 = v4 ^ 0xFF;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for Extension.TicketRequest(uint64_t result, unsigned int a2, unsigned int a3)
{
  if ((a3 + 33554177) >> 24) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  if (a3 <= 0xFE) {
    int v3 = 0;
  }
  if (a2 > 0xFE)
  {
    *(_WORD *)unint64_t result = a2 - 255;
    *(unsigned char *)(result + 2) = (a2 - 255) >> 16;
    if (v3)
    {
      unsigned int v4 = ((a2 - 255) >> 24) + 1;
      if (v3 == 2) {
        *(_WORD *)(result + 3) = v4;
      }
      else {
        *(unsigned char *)(result + 3) = v4;
      }
    }
  }
  else
  {
    if (!v3) {
      goto LABEL_10;
    }
    if (v3 == 2)
    {
      *(_WORD *)(result + 3) = 0;
LABEL_10:
      if (!a2) {
        return result;
      }
LABEL_16:
      *(unsigned char *)(result + 2) = -(char)a2;
      return result;
    }
    *(unsigned char *)(result + 3) = 0;
    if (a2) {
      goto LABEL_16;
    }
  }
  return result;
}

uint64_t getEnumTag for Extension.TicketRequest(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 2);
}

uint64_t destructiveInjectEnumTag for Extension.TicketRequest(uint64_t result, char a2)
{
  *(unsigned char *)(result + 2) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Extension.TicketRequest()
{
  return &type metadata for Extension.TicketRequest;
}

uint64_t storeEnumTagSinglePayload for ClientTicketRequest(uint64_t result, int a2, int a3)
{
  if ((a3 + 0xFFFF) <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if ((a3 + 0xFFFF) < 0xFF0000) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    unsigned int v6 = ((a2 - 1) >> 16) + 1;
    *(_WORD *)unint64_t result = a2 - 1;
    switch(v5)
    {
      case 1:
        *(unsigned char *)(result + 2) = v6;
        return result;
      case 2:
        *(_WORD *)(result + 2) = v6;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)(result + 2) = v6;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *(unsigned char *)(result + 2) = 0;
      break;
    case 2:
      *(_WORD *)(result + 2) = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1B5774BBCLL);
    case 4:
      *(_DWORD *)(result + 2) = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ClientTicketRequest()
{
  return &type metadata for ClientTicketRequest;
}

ValueMetadata *type metadata accessor for Extension.TicketRequest.ServerTicketRequestHint()
{
  return &type metadata for Extension.TicketRequest.ServerTicketRequestHint;
}

uint64_t HandshakeMessageParser.appendBytes(_:)(uint64_t *a1)
{
  uint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  uint64_t v5 = a1[2];
  if ((unint64_t)v1[1] >> 60 == 15)
  {
    uint64_t v6 = 0;
    switch(v4 >> 62)
    {
      case 1uLL:
        uint64_t v6 = v3 >> 32;
        break;
      case 2uLL:
        uint64_t v6 = *(void *)(v3 + 24);
        break;
      case 3uLL:
        break;
      default:
        uint64_t v6 = BYTE6(v4);
        break;
    }
    BOOL v9 = __OFSUB__(v6, v5);
    uint64_t v10 = v6 - v5;
    if (v9)
    {
      __break(1u);
    }
    else
    {
      uint64_t v11 = v5 + v10;
      if (!__OFADD__(v5, v10))
      {
        switch(v4 >> 62)
        {
          case 1uLL:
            uint64_t v12 = v3 >> 32;
            goto LABEL_17;
          case 2uLL:
            uint64_t v12 = *(void *)(v3 + 24);
            goto LABEL_17;
          case 3uLL:
            if (v11 >= 1) {
              goto LABEL_22;
            }
            goto LABEL_18;
          default:
            uint64_t v12 = BYTE6(v4);
LABEL_17:
            if (v12 < v11)
            {
LABEL_22:
              uint64_t result = 0;
              uint64_t v14 = 0;
              unint64_t v13 = 0xF000000000000000;
LABEL_23:
              *Swift::String v1 = result;
              v1[1] = v13;
              v1[2] = v14;
              return result;
            }
LABEL_18:
            if (v11 >= v5)
            {
              uint64_t result = Data._Representation.subscript.getter();
              a1[2] = v11;
              uint64_t v14 = 0;
              switch(v13 >> 62)
              {
                case 1uLL:
                  uint64_t v14 = (int)result;
                  break;
                case 2uLL:
                  uint64_t v14 = *(void *)(result + 16);
                  break;
                default:
                  goto LABEL_23;
              }
              goto LABEL_23;
            }
            break;
        }
LABEL_27:
        __break(1u);
        JUMPOUT(0x1B5774DACLL);
      }
    }
    __break(1u);
    goto LABEL_27;
  }
  uint64_t result = ByteBuffer.writeImmutableBuffer(_:)(*a1, v4, v5);
  uint64_t v8 = 0;
  switch(v4 >> 62)
  {
    case 1uLL:
      uint64_t v8 = v3 >> 32;
      break;
    case 2uLL:
      uint64_t v8 = *(void *)(v3 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v8 = BYTE6(v4);
      break;
  }
  a1[2] = v8;
  return result;
}

uint64_t HandshakeMessageParser.parseHandshakeMessage()@<X0>(uint64_t a1@<X8>)
{
  unint64_t v4 = v1[1];
  if (v4 >> 60 == 15)
  {
    _s8SwiftTLS22HandshakeMessageParserV11ParseResultVSgWOi0_((uint64_t)v11);
    uint64_t v5 = v11;
  }
  else
  {
    uint64_t v6 = *v1;
    uint64_t v7 = v1[2];
    outlined copy of Data._Representation(*v1, v1[1]);
    closure #1 in HandshakeMessageParser.parseHandshakeMessage()(v1, (uint64_t)v11);
    if (v2)
    {
      outlined consume of Data._Representation(*v1, v1[1]);
      *Swift::String v1 = v6;
      v1[1] = v4;
      v1[2] = v7;
      return swift_willThrow();
    }
    outlined init with take of HandshakeMessageParser.ParseResult?((uint64_t)v11, (uint64_t)v9);
    outlined init with take of HandshakeMessageParser.ParseResult?((uint64_t)v9, (uint64_t)v10);
    if (_s8SwiftTLS22HandshakeMessageParserV11ParseResultVSgWOg((uint64_t)v10) == 1)
    {
      outlined consume of Data._Representation(*v1, v1[1]);
      *Swift::String v1 = v6;
      v1[1] = v4;
      v1[2] = v7;
    }
    else
    {
      outlined consume of Data._Representation(v6, v4);
    }
    uint64_t v5 = v9;
  }
  outlined init with take of HandshakeMessageParser.ParseResult?((uint64_t)v5, (uint64_t)v12);
  return outlined init with take of HandshakeMessageParser.ParseResult?((uint64_t)v12, a1);
}

uint64_t closure #1 in HandshakeMessageParser.parseHandshakeMessage()@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = (uint64_t)a1;
  uint64_t v6 = *a1;
  unint64_t v5 = a1[1];
  uint64_t v7 = a1[2];
  uint64_t v122 = v6;
  unint64_t v123 = v5;
  uint64_t v124 = v7;
  outlined copy of Data._Representation(v6, v5);
  __int16 v8 = specialized ByteBuffer.readInteger<A>(as:)();
  if ((v8 & 0x100) != 0) {
    goto LABEL_7;
  }
  unsigned __int8 v9 = v8;
  __int16 v10 = specialized ByteBuffer.readInteger<A>(as:)();
  if ((v10 & 0x100) != 0) {
    goto LABEL_7;
  }
  unsigned __int8 v11 = v10;
  uint64_t v12 = specialized ByteBuffer.readInteger<A>(as:)();
  if ((v12 & 0x10000) != 0) {
    goto LABEL_7;
  }
  if (v11)
  {
    lazy protocol witness table accessor for type TLSError and conformance TLSError();
    swift_allocError();
    *(_DWORD *)uint64_t v13 = 5;
    *(unsigned char *)(v13 + 4) = 1;
    swift_willThrow();
    return outlined consume of Data._Representation(v122, v123);
  }
  uint64_t v15 = ByteBuffer.readSlice(length:)((unsigned __int16)v12 | ((unint64_t)v11 << 16));
  if (v16 >> 60 == 15)
  {
LABEL_7:
    outlined consume of Data._Representation(v6, v5);
    _s8SwiftTLS22HandshakeMessageParserV11ParseResultVSgWOi0_((uint64_t)v120);
    return outlined init with take of HandshakeMessageParser.ParseResult?((uint64_t)v120, a2);
  }
  unint64_t v18 = v16;
  uint64_t v117 = v15;
  unint64_t v118 = v16;
  uint64_t v119 = v17;
  switch(v9)
  {
    case 1u:
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      uint64_t v19 = type metadata accessor for Logger();
      __swift_project_value_buffer(v19, (uint64_t)logger);
      unint64_t v20 = Logger.logObject.getter();
      os_log_type_t v21 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v20, v21))
      {
        char v22 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)char v22 = 0;
        _os_log_impl(&dword_1B56C5000, v20, v21, "clientHello", v22, 2u);
        MEMORY[0x1BA99F280](v22, -1, -1);
      }

      specialized ClientHello.init(bytes:)(&v117, (uint64_t)&v125);
      if (v2) {
        goto LABEL_63;
      }
      char v23 = 0;
      unint64_t v24 = v126;
      unint64_t v25 = v127;
      uint64_t v26 = v128;
      uint64_t v27 = v129;
      unint64_t v28 = v130;
      uint64_t v29 = v131;
      uint64_t v30 = v132;
      uint64_t v31 = v133;
      uint64_t v2 = v134;
      unint64_t v32 = v135;
      uint64_t v33 = v136;
      uint64_t v34 = v137;
      uint64_t v35 = v125;
      goto LABEL_67;
    case 2u:
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      uint64_t v36 = type metadata accessor for Logger();
      __swift_project_value_buffer(v36, (uint64_t)logger);
      unint64_t v37 = Logger.logObject.getter();
      os_log_type_t v38 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v37, v38))
      {
        uint64_t v39 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v39 = 0;
        _os_log_impl(&dword_1B56C5000, v37, v38, "serverHello", v39, 2u);
        MEMORY[0x1BA99F280](v39, -1, -1);
      }

      specialized ServerHello.init(bytes:)(&v117, (uint64_t)&v138);
      if (v2) {
        goto LABEL_63;
      }
      uint64_t v34 = 0;
      unint64_t v24 = v139;
      unint64_t v25 = v140;
      uint64_t v26 = v141;
      uint64_t v27 = v142;
      unint64_t v28 = v143;
      uint64_t v29 = v144;
      uint64_t v30 = v145;
      uint64_t v31 = v146;
      uint64_t v2 = v147;
      uint64_t v33 = v150;
      unint64_t v32 = v148 | ((unint64_t)v149 << 16);
      char v23 = 1;
      uint64_t v35 = v138;
      goto LABEL_67;
    case 4u:
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      uint64_t v48 = type metadata accessor for Logger();
      __swift_project_value_buffer(v48, (uint64_t)logger);
      unint64_t v49 = Logger.logObject.getter();
      os_log_type_t v50 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v49, v50))
      {
        unint64_t v51 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v51 = 0;
        _os_log_impl(&dword_1B56C5000, v49, v50, "newSessionTicket", v51, 2u);
        MEMORY[0x1BA99F280](v51, -1, -1);
      }

      specialized NewSessionTicket.init(bytes:)(&v117, (uint64_t)v151);
      if (v2) {
        goto LABEL_63;
      }
      uint64_t v31 = 0;
      unint64_t v32 = 0;
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      uint64_t v35 = v151[0];
      unint64_t v24 = v151[1];
      unint64_t v25 = v151[2];
      uint64_t v26 = v151[3];
      uint64_t v27 = v151[4];
      unint64_t v28 = v151[5];
      char v23 = 7;
      uint64_t v29 = v151[6];
      uint64_t v30 = v151[7];
      goto LABEL_67;
    case 8u:
      uint64_t v116 = v15;
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      uint64_t v52 = type metadata accessor for Logger();
      __swift_project_value_buffer(v52, (uint64_t)logger);
      unint64_t v53 = Logger.logObject.getter();
      os_log_type_t v54 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v53, v54))
      {
        log = v53;
        unint64_t v55 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v55 = 0;
        _os_log_impl(&dword_1B56C5000, log, v54, "encryptedExtensions", v55, 2u);
        unint64_t v56 = v55;
        unint64_t v53 = log;
        MEMORY[0x1BA99F280](v56, -1, -1);
      }

      outlined copy of Data._Representation(v116, v18);
      uint64_t v57 = specialized closure #1 in ByteBuffer.readVariableLengthVector<A, B>(lengthFieldType:_:)(&v117);
      if (v2)
      {
        outlined consume of Data._Representation(v117, v118);
        uint64_t v58 = v116;
LABEL_39:
        swift_willThrow();
        outlined consume of Data._Representation(v6, v5);
        return outlined consume of Data._Representation(v58, v18);
      }
      uint64_t v35 = v57;
      if (!v57)
      {
        outlined consume of Data._Representation(v117, v118);
        uint64_t v117 = v116;
        unint64_t v118 = v18;
        lazy protocol witness table accessor for type TLSError and conformance TLSError();
        swift_allocError();
        *(_DWORD *)uint64_t v103 = 0;
        *(unsigned char *)(v103 + 4) = 1;
        uint64_t v6 = v122;
        unint64_t v5 = v123;
        uint64_t v58 = v117;
        unint64_t v18 = v118;
        goto LABEL_39;
      }
      outlined consume of Data._Representation(v116, v18);
      unint64_t v24 = 0;
      unint64_t v25 = 0;
      uint64_t v26 = 0;
      uint64_t v27 = 0;
      unint64_t v28 = 0;
      uint64_t v29 = 0;
      uint64_t v30 = 0;
      uint64_t v31 = 0;
      uint64_t v2 = 0;
      unint64_t v32 = 0;
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      char v23 = 2;
      goto LABEL_67;
    case 0xBu:
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      uint64_t v59 = type metadata accessor for Logger();
      __swift_project_value_buffer(v59, (uint64_t)logger);
      uint64_t v60 = Logger.logObject.getter();
      os_log_type_t v61 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v60, v61))
      {
        uint64_t v62 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v62 = 0;
        _os_log_impl(&dword_1B56C5000, v60, v61, "certificate", v62, 2u);
        MEMORY[0x1BA99F280](v62, -1, -1);
      }

      uint64_t v63 = specialized CertificateMessage.init(bytes:)(&v117);
      if (v2) {
        goto LABEL_63;
      }
      uint64_t v35 = v63;
      unint64_t v25 = v64;
      uint64_t v27 = 0;
      unint64_t v28 = 0;
      uint64_t v29 = 0;
      uint64_t v30 = 0;
      uint64_t v31 = 0;
      unint64_t v32 = 0;
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      char v23 = 4;
      goto LABEL_67;
    case 0xDu:
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      uint64_t v65 = type metadata accessor for Logger();
      __swift_project_value_buffer(v65, (uint64_t)logger);
      unint64_t v66 = Logger.logObject.getter();
      os_log_type_t v67 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v66, v67))
      {
        uint64_t v68 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v68 = 0;
        _os_log_impl(&dword_1B56C5000, v66, v67, "certificateRequest", v68, 2u);
        MEMORY[0x1BA99F280](v68, -1, -1);
      }

      uint64_t v69 = specialized CertificateRequest.init(bytes:)(&v117);
      if (v2) {
        goto LABEL_63;
      }
      uint64_t v35 = v69;
      unint64_t v25 = v70;
      uint64_t v27 = 0;
      unint64_t v28 = 0;
      uint64_t v29 = 0;
      uint64_t v30 = 0;
      uint64_t v31 = 0;
      unint64_t v32 = 0;
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      char v23 = 3;
      goto LABEL_67;
    case 0xFu:
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      uint64_t v71 = type metadata accessor for Logger();
      __swift_project_value_buffer(v71, (uint64_t)logger);
      unint64_t v72 = Logger.logObject.getter();
      os_log_type_t v73 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v72, v73))
      {
        uint64_t v74 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v74 = 0;
        _os_log_impl(&dword_1B56C5000, v72, v73, "certificateVerify", v74, 2u);
        MEMORY[0x1BA99F280](v74, -1, -1);
      }

      unsigned __int16 v75 = specialized CertificateVerify.init(bytes:)(&v117);
      if (v2) {
        goto LABEL_63;
      }
      unint64_t v25 = v76;
      uint64_t v27 = 0;
      unint64_t v28 = 0;
      uint64_t v29 = 0;
      uint64_t v30 = 0;
      uint64_t v31 = 0;
      unint64_t v32 = 0;
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      uint64_t v35 = v75;
      char v23 = 5;
      goto LABEL_67;
    case 0x14u:
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      uint64_t v77 = type metadata accessor for Logger();
      __swift_project_value_buffer(v77, (uint64_t)logger);
      char v78 = Logger.logObject.getter();
      os_log_type_t v79 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v78, v79))
      {
        uint64_t v80 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v80 = 0;
        _os_log_impl(&dword_1B56C5000, v78, v79, "finished", v80, 2u);
        MEMORY[0x1BA99F280](v80, -1, -1);
      }

      uint64_t v81 = specialized FinishedMessage.init(bytes:)(&v117);
      if (!v2)
      {
        uint64_t v35 = v81;
        unint64_t v25 = v82;
        uint64_t v26 = 0;
        uint64_t v27 = 0;
        unint64_t v28 = 0;
        uint64_t v29 = 0;
        uint64_t v30 = 0;
        uint64_t v31 = 0;
        unint64_t v32 = 0;
        uint64_t v33 = 0;
        uint64_t v34 = 0;
        char v23 = 6;
LABEL_67:
        uint64_t v85 = v117;
        unint64_t v86 = v118;
        uint64_t v87 = 0;
        switch(v118 >> 62)
        {
          case 1uLL:
            uint64_t v87 = v117 >> 32;
            break;
          case 2uLL:
            uint64_t v87 = *(void *)(v117 + 24);
            break;
          case 3uLL:
            break;
          default:
            uint64_t v87 = BYTE6(v118);
            break;
        }
        if (__OFSUB__(v87, v119))
        {
          __break(1u);
        }
        else
        {
          log = v27;
          uint64_t v116 = v26;
          unint64_t v113 = v24;
          unint64_t v114 = v28;
          uint64_t v111 = v30;
          uint64_t v112 = v29;
          uint64_t v110 = v31;
          if (v87 != v119)
          {
            LOBYTE(v86) = v23;
            uint64_t v7 = v33;
            uint64_t v3 = v2;
            uint64_t v85 = v34;
            uint64_t v109 = v35;
            if (one-time initialization token for logger == -1) {
              goto LABEL_77;
            }
            goto LABEL_90;
          }
          char v104 = v23;
          uint64_t v105 = v33;
          uint64_t v106 = v32;
          uint64_t v107 = v2;
          uint64_t v108 = v34;
          uint64_t v109 = v25;
          uint64_t v88 = *(void *)(v3 + 16);
          if (!__OFSUB__(v88, v7))
          {
            unint64_t v32 = v35;
            uint64_t v89 = ByteBuffer.readSlice(length:)(v88 - v7);
            if (v90 >> 60 != 15)
            {
              uint64_t v92 = v89;
              uint64_t v93 = v90;
              uint64_t v94 = v91;
              outlined consume of Data._Representation(v122, v123);
              outlined consume of Data._Representation(v85, v86);
              v120[0] = v92;
              v120[1] = v93;
              v120[2] = v94;
              v120[3] = v32;
              v120[4] = v113;
              v120[5] = v109;
              v120[6] = v116;
              v120[7] = (uint64_t)log;
              v120[8] = v114;
              v120[9] = v112;
              v120[10] = v111;
              v120[11] = v110;
              v120[12] = v2;
              v120[13] = v106;
              v120[14] = v105;
              v120[15] = v108;
              char v121 = v104;
              CertificateVerify.algorithm.getter(v120);
              return outlined init with take of HandshakeMessageParser.ParseResult?((uint64_t)v120, a2);
            }
LABEL_92:
            outlined consume of HandshakeMessage(v32, v113, v109, v116, (uint64_t)log, v114, v112, v111, v110, v107, v106, v105, v108, v104);
            __break(1u);
            JUMPOUT(0x1B5775DECLL);
          }
        }
        __break(1u);
LABEL_90:
        swift_once();
LABEL_77:
        uint64_t v95 = type metadata accessor for Logger();
        __swift_project_value_buffer(v95, (uint64_t)logger);
        uint64_t v96 = Logger.logObject.getter();
        os_log_type_t v97 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v96, v97))
        {
          uint64_t v98 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v98 = 134217984;
          swift_beginAccess();
          uint64_t v99 = 0;
          switch(v118 >> 62)
          {
            case 1uLL:
              uint64_t v99 = v117 >> 32;
              break;
            case 2uLL:
              uint64_t v99 = *(void *)(v117 + 24);
              break;
            case 3uLL:
              break;
            default:
              uint64_t v99 = BYTE6(v118);
              break;
          }
          BOOL v100 = __OFSUB__(v99, v119);
          uint64_t v101 = v99 - v119;
          if (v100)
          {
            __break(1u);
            goto LABEL_92;
          }
          uint64_t v152 = v101;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          _os_log_impl(&dword_1B56C5000, v96, v97, "ExcessBytes: %ld", v98, 0xCu);
          MEMORY[0x1BA99F280](v98, -1, -1);
        }

        lazy protocol witness table accessor for type TLSError and conformance TLSError();
        swift_allocError();
        *(_DWORD *)uint64_t v102 = 1;
        *(unsigned char *)(v102 + 4) = 1;
        swift_willThrow();
        outlined consume of HandshakeMessage(v109, v113, v25, v116, (uint64_t)log, v114, v112, v111, v110, v3, v32, v7, v85, v86);
LABEL_85:
        uint64_t v83 = v122;
        unint64_t v84 = v123;
        goto LABEL_86;
      }
LABEL_63:
      uint64_t v83 = v6;
      unint64_t v84 = v5;
LABEL_86:
      outlined consume of Data._Representation(v83, v84);
      return outlined consume of Data._Representation(v117, v118);
    default:
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      uint64_t v40 = type metadata accessor for Logger();
      __swift_project_value_buffer(v40, (uint64_t)logger);
      unint64_t v41 = Logger.logObject.getter();
      os_log_type_t v42 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v41, v42))
      {
        uint64_t v43 = (uint8_t *)swift_slowAlloc();
        uint64_t v44 = swift_slowAlloc();
        v120[0] = v44;
        *(_DWORD *)uint64_t v43 = 136315138;
        unint64_t v45 = HandshakeType.description.getter(v9);
        uint64_t v152 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v45, v46, v120);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1B56C5000, v41, v42, "Unsupported handshake message: %s", v43, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1BA99F280](v44, -1, -1);
        MEMORY[0x1BA99F280](v43, -1, -1);
      }

      lazy protocol witness table accessor for type TLSError and conformance TLSError();
      swift_allocError();
      *(_DWORD *)uint64_t v47 = 5;
      *(unsigned char *)(v47 + 4) = 1;
      swift_willThrow();
      goto LABEL_85;
  }
}

__n128 HandshakeMessageParser.ParseResult.init(messageBytes:message:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  outlined init with take of HandshakeMessage(a4, (uint64_t)v17);
  uint64_t v9 = v18;
  char v10 = v19;
  __n128 result = (__n128)v17[0];
  long long v12 = v17[1];
  long long v13 = v17[2];
  long long v14 = v17[3];
  long long v15 = v17[4];
  long long v16 = v17[5];
  *(void *)a5 = a1;
  *(void *)(a5 + 8) = a2;
  *(void *)(a5 + 16) = a3;
  *(__n128 *)(a5 + 24) = result;
  *(_OWORD *)(a5 + 40) = v12;
  *(_OWORD *)(a5 + 56) = v13;
  *(_OWORD *)(a5 + 72) = v14;
  *(_OWORD *)(a5 + 88) = v15;
  *(_OWORD *)(a5 + 104) = v16;
  *(void *)(a5 + 120) = v9;
  *(unsigned char *)(a5 + 128) = v10;
  return result;
}

uint64_t HandshakeMessageParser.ParseResult.messageBytes.getter()
{
  uint64_t v1 = *(void *)v0;
  outlined copy of Data._Representation(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t HandshakeMessageParser.ParseResult.message.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of HandshakeMessage(v1 + 24, a1);
}

uint64_t HandshakeMessageParser.ParseResult.message.setter(uint64_t a1)
{
  return outlined assign with take of HandshakeMessage(a1, v1 + 24);
}

double _s8SwiftTLS22HandshakeMessageParserV11ParseResultVSgWOi0_(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(unsigned char *)(a1 + 128) = -1;
  return result;
}

uint64_t outlined init with copy of HandshakeMessage(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t outlined assign with take of HandshakeMessage(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t *destroy for HandshakeMessageParser(uint64_t *result)
{
  unint64_t v1 = result[1];
  if (v1 >> 60 != 15) {
    return (uint64_t *)outlined consume of Data._Representation(*result, v1);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for HandshakeMessageParser(uint64_t a1, uint64_t *a2)
{
  unint64_t v4 = a2[1];
  if (v4 >> 60 == 15)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    uint64_t v5 = *a2;
    outlined copy of Data._Representation(*a2, a2[1]);
    *(void *)a1 = v5;
    *(void *)(a1 + 8) = v4;
  }
  *(void *)(a1 + 16) = a2[2];
  return a1;
}

uint64_t assignWithCopy for HandshakeMessageParser(uint64_t a1, uint64_t *a2)
{
  unint64_t v4 = a2[1];
  if (*(void *)(a1 + 8) >> 60 != 15)
  {
    if (v4 >> 60 == 15)
    {
      outlined destroy of ByteBuffer(a1);
      uint64_t v6 = a2[2];
      *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_9:
      *(void *)(a1 + 16) = v6;
      return a1;
    }
    uint64_t v8 = *a2;
    outlined copy of Data._Representation(*a2, a2[1]);
    uint64_t v9 = *(void *)a1;
    unint64_t v10 = *(void *)(a1 + 8);
    *(void *)a1 = v8;
    *(void *)(a1 + 8) = v4;
    outlined consume of Data._Representation(v9, v10);
LABEL_8:
    uint64_t v6 = a2[2];
    goto LABEL_9;
  }
  if (v4 >> 60 != 15)
  {
    uint64_t v7 = *a2;
    outlined copy of Data._Representation(*a2, a2[1]);
    *(void *)a1 = v7;
    *(void *)(a1 + 8) = v4;
    goto LABEL_8;
  }
  long long v5 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = a2[2];
  *(_OWORD *)a1 = v5;
  return a1;
}

uint64_t *assignWithTake for HandshakeMessageParser(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4 = a1[1];
  if (v4 >> 60 != 15)
  {
    unint64_t v5 = a2[1];
    if (v5 >> 60 != 15)
    {
      uint64_t v6 = *a1;
      *a1 = *a2;
      a1[1] = v5;
      outlined consume of Data._Representation(v6, v4);
      goto LABEL_6;
    }
    outlined destroy of ByteBuffer((uint64_t)a1);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_6:
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for HandshakeMessageParser(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xC && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 12);
  }
  uint64_t v3 = *(void *)(a1 + 8) >> 60;
  if (((4 * v3) & 0xC) != 0) {
    int v4 = 14 - ((4 * v3) & 0xC | (v3 >> 2));
  }
  else {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for HandshakeMessageParser(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xB)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)double result = a2 - 12;
    if (a3 >= 0xC) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0xC) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2)
    {
      *(void *)double result = 0;
      *(void *)(result + 8) = (unint64_t)((4 * (a2 ^ 0xF)) | ((a2 ^ 0xF) >> 2)) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HandshakeMessageParser()
{
  return &type metadata for HandshakeMessageParser;
}

uint64_t destroy for HandshakeMessageParser.ParseResult(uint64_t a1)
{
  return outlined consume of HandshakeMessage(*(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(unsigned char *)(a1 + 128));
}

uint64_t initializeWithCopy for HandshakeMessageParser.ParseResult(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  outlined copy of Data._Representation(*a2, v5);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  uint64_t v6 = v2[3];
  *(void *)(a1 + 16) = v2[2];
  unint64_t v7 = v2[4];
  unint64_t v8 = v2[5];
  uint64_t v9 = v2[6];
  uint64_t v10 = v2[7];
  unint64_t v11 = v2[8];
  uint64_t v12 = v2[9];
  uint64_t v13 = v2[10];
  uint64_t v15 = v2[11];
  uint64_t v16 = v2[12];
  uint64_t v17 = v2[13];
  uint64_t v18 = v2[14];
  uint64_t v19 = v2[15];
  LOBYTE(v2) = *((unsigned char *)v2 + 128);
  outlined copy of HandshakeMessage(v6, v7, v8, v9, v10, v11, v12, v13, v15, v16, v17, v18, v19, (char)v2);
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v12;
  *(void *)(a1 + 80) = v13;
  *(void *)(a1 + 88) = v15;
  *(void *)(a1 + 96) = v16;
  *(void *)(a1 + 104) = v17;
  *(void *)(a1 + 112) = v18;
  *(void *)(a1 + 120) = v19;
  *(unsigned char *)(a1 + 128) = (_BYTE)v2;
  return a1;
}

uint64_t assignWithCopy for HandshakeMessageParser.ParseResult(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  outlined copy of Data._Representation(*a2, v5);
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  outlined consume of Data._Representation(v6, v7);
  *(void *)(a1 + 16) = v2[2];
  uint64_t v8 = v2[3];
  unint64_t v9 = v2[4];
  unint64_t v10 = v2[5];
  uint64_t v11 = v2[6];
  uint64_t v12 = v2[7];
  unint64_t v13 = v2[8];
  uint64_t v14 = v2[9];
  uint64_t v15 = v2[10];
  uint64_t v29 = v2[11];
  uint64_t v30 = v2[12];
  uint64_t v31 = v2[13];
  uint64_t v32 = v2[14];
  uint64_t v33 = v2[15];
  LOBYTE(v2) = *((unsigned char *)v2 + 128);
  outlined copy of HandshakeMessage(v8, v9, v10, v11, v12, v13, v14, v15, v29, v30, v31, v32, v33, (char)v2);
  uint64_t v16 = *(void *)(a1 + 24);
  unint64_t v17 = *(void *)(a1 + 32);
  unint64_t v18 = *(void *)(a1 + 40);
  uint64_t v19 = *(void *)(a1 + 48);
  uint64_t v20 = *(void *)(a1 + 56);
  unint64_t v21 = *(void *)(a1 + 64);
  uint64_t v22 = *(void *)(a1 + 72);
  uint64_t v23 = *(void *)(a1 + 80);
  long long v24 = *(_OWORD *)(a1 + 88);
  long long v25 = *(_OWORD *)(a1 + 104);
  uint64_t v26 = *(void *)(a1 + 120);
  char v27 = *(unsigned char *)(a1 + 128);
  *(void *)(a1 + 24) = v8;
  *(void *)(a1 + 32) = v9;
  *(void *)(a1 + 40) = v10;
  *(void *)(a1 + 48) = v11;
  *(void *)(a1 + 56) = v12;
  *(void *)(a1 + 64) = v13;
  *(void *)(a1 + 72) = v14;
  *(void *)(a1 + 80) = v15;
  *(void *)(a1 + 88) = v29;
  *(void *)(a1 + 96) = v30;
  *(void *)(a1 + 104) = v31;
  *(void *)(a1 + 112) = v32;
  *(void *)(a1 + 120) = v33;
  *(unsigned char *)(a1 + 128) = (_BYTE)v2;
  outlined consume of HandshakeMessage(v16, v17, v18, v19, v20, v21, v22, v23, v24, *((uint64_t *)&v24 + 1), v25, *((uint64_t *)&v25 + 1), v26, v27);
  return a1;
}

__n128 __swift_memcpy129_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t assignWithTake for HandshakeMessageParser.ParseResult(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  outlined consume of Data._Representation(v4, v5);
  char v6 = *(unsigned char *)(a2 + 128);
  uint64_t v7 = *(void *)(a1 + 24);
  unint64_t v8 = *(void *)(a1 + 32);
  unint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  unint64_t v12 = *(void *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 72);
  uint64_t v14 = *(void *)(a1 + 80);
  long long v15 = *(_OWORD *)(a1 + 88);
  long long v16 = *(_OWORD *)(a1 + 104);
  uint64_t v17 = *(void *)(a1 + 120);
  char v18 = *(unsigned char *)(a1 + 128);
  long long v19 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v19;
  long long v20 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v20;
  long long v21 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v21;
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(unsigned char *)(a1 + 128) = v6;
  outlined consume of HandshakeMessage(v7, v8, v9, v10, v11, v12, v13, v14, v15, *((uint64_t *)&v15 + 1), v16, *((uint64_t *)&v16 + 1), v17, v18);
  return a1;
}

uint64_t getEnumTagSinglePayload for HandshakeMessageParser.ParseResult(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF9 && *(unsigned char *)(a1 + 129)) {
    return (*(_DWORD *)a1 + 249);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 128);
  if (v3 <= 7) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for HandshakeMessageParser.ParseResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF8)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 128) = 0;
    *(void *)__n128 result = a2 - 249;
    if (a3 >= 0xF9) {
      *(unsigned char *)(result + 129) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF9) {
      *(unsigned char *)(result + 129) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 128) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HandshakeMessageParser.ParseResult()
{
  return &type metadata for HandshakeMessageParser.ParseResult;
}

unint64_t ByteBuffer.writeSignatureAlgorithms(_:)(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v5 = 0;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v5 = v2 >> 32;
      break;
    case 2uLL:
      uint64_t v5 = *(void *)(v2 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v5 = BYTE6(v3);
      break;
  }
  __int16 v11 = 0;
  uint64_t v6 = MEMORY[0x1E4FBB2B8];
  uint64_t v7 = MEMORY[0x1E4F27EF0];
  uint64_t v14 = MEMORY[0x1E4FBB2B8];
  uint64_t v15 = MEMORY[0x1E4F27EF0];
  unint64_t v12 = &v11;
  uint64_t v13 = &v12;
  __swift_project_boxed_opaque_existential_1(&v12, MEMORY[0x1E4FBB2B8]);
  Data._Representation.append(contentsOf:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v12);
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_12:
    unint64_t v9 = 0;
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  unint64_t v9 = 0;
  do
  {
    __int16 v11 = bswap32(*(unsigned __int16 *)(a1 + v9 + 32)) >> 16;
    uint64_t v14 = v6;
    uint64_t v15 = v7;
    unint64_t v12 = &v11;
    uint64_t v13 = &v12;
    __swift_project_boxed_opaque_existential_1(&v12, v6);
    Data._Representation.append(contentsOf:)();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v12);
    if (v9 == 0x7FFFFFFFFFFFFFFELL)
    {
      __break(1u);
LABEL_15:
      __break(1u);
    }
    v9 += 2;
    --v8;
  }
  while (v8);
  swift_bridgeObjectRelease();
  if ((v9 & 0x8000000000000000) != 0) {
    goto LABEL_15;
  }
  if (v9 >> 16)
  {
    __break(1u);
    goto LABEL_12;
  }
LABEL_13:
  specialized ByteBuffer.setInteger<A>(_:at:as:)(v9, v5);
  return v9 + 2;
}

char *ByteBuffer.readSignatureAlgorithms(messageType:)(unsigned __int8 a1)
{
  if (a1 != 13 && a1 != 1)
  {
    int v11 = a1 | 0xD0000;
    lazy protocol witness table accessor for type TLSError and conformance TLSError();
    swift_allocError();
    *(_DWORD *)uint64_t v12 = v11;
    *(unsigned char *)(v12 + 4) = 0;
    goto LABEL_9;
  }
  uint64_t v5 = *v1;
  unint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  outlined copy of Data._Representation(*v1, v4);
  uint64_t v7 = specialized ByteBuffer.readInteger<A>(as:)();
  if ((v7 & 0x10000) != 0 || (uint64_t v31 = ByteBuffer.readSlice(length:)((unsigned __int16)v7), v8 >> 60 == 15))
  {
    outlined consume of Data._Representation(*v1, v1[1]);
    *unint64_t v1 = v5;
    v1[1] = v4;
    v1[2] = v6;
    lazy protocol witness table accessor for type TLSError and conformance TLSError();
    swift_allocError();
    *(_DWORD *)uint64_t v10 = 0;
    *(unsigned char *)(v10 + 4) = 1;
    goto LABEL_9;
  }
  unint64_t v27 = v4;
  uint64_t v14 = v9;
  uint64_t v15 = 0;
  uint64_t v16 = BYTE6(v8);
  switch(v8 >> 62)
  {
    case 1uLL:
      uint64_t v15 = v31 >> 32;
      break;
    case 2uLL:
      uint64_t v15 = *(void *)(v31 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v15 = BYTE6(v8);
      break;
  }
  unint64_t v28 = v8 >> 62;
  unint64_t v30 = v8;
  BOOL v17 = __OFSUB__(v15, v9);
  uint64_t v18 = v15 - v9;
  if (v17) {
    goto LABEL_41;
  }
  long long v19 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, (v18 / 2) & ~((v18 + (v18 < 0)) >> 63), 0, MEMORY[0x1E4FBC860]);
  uint64_t v29 = v14;
  BOOL v17 = __OFADD__(v14, 2);
  uint64_t v20 = v14 + 2;
  if (v17)
  {
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  uint64_t v2 = v19;
  uint64_t v21 = v29;
  while (2)
  {
    uint64_t v22 = v21;
    uint64_t v21 = v20;
    uint64_t v23 = v16;
    switch((int)v28)
    {
      case 1:
        uint64_t v23 = v31 >> 32;
        goto LABEL_20;
      case 2:
        if (*(void *)(v31 + 24) < v20) {
          goto LABEL_31;
        }
        goto LABEL_25;
      case 3:
        if (v20 < 1) {
          goto LABEL_25;
        }
        uint64_t v16 = 0;
        goto LABEL_35;
      default:
LABEL_20:
        if (v23 >= v20)
        {
LABEL_25:
          if (v20 < v22) {
            goto LABEL_40;
          }
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<Int>);
          lazy protocol witness table accessor for type Data and conformance Data();
          lazy protocol witness table accessor for type Range<Int> and conformance Range<A>();
          DataProtocol.copyBytes<A>(to:from:)();
          unint64_t v25 = *((void *)v2 + 2);
          unint64_t v24 = *((void *)v2 + 3);
          if (v25 >= v24 >> 1) {
            uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v24 > 1), v25 + 1, 1, v2);
          }
          *((void *)v2 + 2) = v25 + 1;
          *(_WORD *)&v2[2 * v25 + 32] = bswap32(0) >> 16;
          BOOL v17 = __OFADD__(v20, 2);
          v20 += 2;
          if (v17) {
            goto LABEL_39;
          }
          continue;
        }
LABEL_31:
        if (v28)
        {
          uint64_t v16 = v31 >> 32;
          if (v28 != 1) {
            uint64_t v16 = *(void *)(v31 + 24);
          }
        }
LABEL_35:
        if (__OFSUB__(v16, v22)) {
LABEL_42:
        }
          __break(1u);
        if (v16 == v22)
        {
          outlined consume of ByteBuffer?(v31, v30);
          outlined consume of Data._Representation(v5, v27);
        }
        else
        {
          lazy protocol witness table accessor for type TLSError and conformance TLSError();
          swift_allocError();
          *(_DWORD *)uint64_t v26 = 1;
          *(unsigned char *)(v26 + 4) = 1;
          swift_willThrow();
          swift_bridgeObjectRelease();
          outlined consume of Data._Representation(v31, v30);
          outlined consume of Data._Representation(*v1, v1[1]);
          *unint64_t v1 = v5;
          v1[1] = v27;
          v1[2] = v6;
LABEL_9:
          swift_willThrow();
        }
        return v2;
    }
  }
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance Extension.SignatureAlgorithms(void *a1, void *a2)
{
  return specialized static Array<A>.== infix(_:_:)(*a1, *a2);
}

unint64_t lazy protocol witness table accessor for type Extension.SignatureAlgorithms and conformance Extension.SignatureAlgorithms()
{
  unint64_t result = lazy protocol witness table cache variable for type Extension.SignatureAlgorithms and conformance Extension.SignatureAlgorithms;
  if (!lazy protocol witness table cache variable for type Extension.SignatureAlgorithms and conformance Extension.SignatureAlgorithms)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Extension.SignatureAlgorithms and conformance Extension.SignatureAlgorithms);
  }
  return result;
}

ValueMetadata *type metadata accessor for Extension.SignatureAlgorithms()
{
  return &type metadata for Extension.SignatureAlgorithms;
}

__n128 ClientHello.init(legacyVersion:random:legacySessionID:cipherSuites:legacyCompressionMethods:extensions:)@<Q0>(__int16 a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  __n128 result = *(__n128 *)a6;
  long long v11 = *(_OWORD *)(a6 + 16);
  *(_OWORD *)(a9 + 40) = *(_OWORD *)a6;
  uint64_t v12 = *(void *)(a6 + 32);
  *(_WORD *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(_OWORD *)(a9 + 56) = v11;
  *(void *)(a9 + 72) = v12;
  *(void *)(a9 + 80) = a7;
  *(void *)(a9 + 88) = a8;
  *(void *)(a9 + 96) = a10;
  return result;
}

uint64_t ClientHello.serverCertificateTypes.getter()
{
  specialized ClientHello.serverCertificateTypes.getter();

  return swift_bridgeObjectRetain();
}

__n128 ClientHello.init(bytes:)@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  specialized ClientHello.init(bytes:)(a1, (uint64_t)v7);
  if (!v2)
  {
    long long v5 = v7[5];
    *(_OWORD *)(a2 + 64) = v7[4];
    *(_OWORD *)(a2 + 80) = v5;
    *(void *)(a2 + 96) = v8;
    long long v6 = v7[1];
    *(_OWORD *)a2 = v7[0];
    *(_OWORD *)(a2 + 16) = v6;
    __n128 result = (__n128)v7[3];
    *(_OWORD *)(a2 + 32) = v7[2];
    *(__n128 *)(a2 + 48) = result;
  }
  return result;
}

uint64_t ClientHello.cipherSuites.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ClientHello.cipherSuites.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 80) = a1;
  return result;
}

uint64_t ClientHello.extensions.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ClientHello.extensions.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 96) = a1;
  return result;
}

uint64_t (*ClientHello.extensions.modify())()
{
  return CertificateVerify.algorithm.getter;
}

void ClientHello.hash(into:)(uint64_t a1)
{
  Swift::UInt8 v3 = *(unsigned char *)(v1 + 1);
  Hasher._combine(_:)(*(unsigned char *)v1);
  Hasher._combine(_:)(v3);
  Swift::UInt64 v4 = *(void *)(v1 + 16);
  Swift::UInt64 v5 = *(void *)(v1 + 24);
  Swift::UInt64 v6 = *(void *)(v1 + 32);
  Hasher._combine(_:)(*(void *)(v1 + 8));
  Hasher._combine(_:)(v4);
  Hasher._combine(_:)(v5);
  Hasher._combine(_:)(v6);
  Swift::UInt64 v7 = *(void *)(v1 + 40);
  Swift::UInt64 v8 = *(void *)(v1 + 48);
  Swift::UInt64 v9 = *(void *)(v1 + 56);
  Swift::UInt64 v10 = *(void *)(v1 + 64);
  Hasher._combine(_:)(*(void *)(v1 + 72));
  Hasher._combine(_:)(v7);
  Hasher._combine(_:)(v8);
  Hasher._combine(_:)(v9);
  Hasher._combine(_:)(v10);
  uint64_t v11 = *(void *)(v1 + 80);
  Swift::UInt v12 = *(void *)(v11 + 16);
  Hasher._combine(_:)(v12);
  if (v12)
  {
    uint64_t v13 = (Swift::UInt16 *)(v11 + 32);
    do
    {
      Swift::UInt16 v14 = *v13++;
      Hasher._combine(_:)(v14);
      --v12;
    }
    while (v12);
  }
  uint64_t v15 = *(void *)(v1 + 88);
  Swift::UInt v16 = *(void *)(v15 + 16);
  Hasher._combine(_:)(v16);
  if (v16)
  {
    BOOL v17 = (Swift::UInt8 *)(v15 + 32);
    do
    {
      Swift::UInt8 v18 = *v17++;
      Hasher._combine(_:)(v18);
      --v16;
    }
    while (v16);
  }
  uint64_t v19 = *(void *)(v1 + 96);
  uint64_t v22 = v19;
  Swift::UInt v20 = *(void *)(v19 + 16);
  Hasher._combine(_:)(v20);
  if (v20)
  {
    uint64_t v21 = (long long *)(v19 + 32);
    swift_bridgeObjectRetain();
    do
    {
      outlined init with take of Extension(v21, (uint64_t)v23);
      outlined retain of Extension((uint64_t)v23, (void (*)(void, void, void, void, void))outlined copy of Extension);
      Extension.hash(into:)(a1);
      outlined retain of Extension((uint64_t)v23, (void (*)(void, void, void, void, void))outlined consume of Extension);
      uint64_t v21 = (long long *)((char *)v21 + 40);
      --v20;
    }
    while (v20);
    outlined release of [Extension]((uint64_t)&v22);
  }
}

Swift::Int ClientHello.hashValue.getter()
{
  Hasher.init(_seed:)();
  ClientHello.hash(into:)((uint64_t)v1);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ClientHello()
{
  Hasher.init(_seed:)();
  ClientHello.hash(into:)((uint64_t)v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance ClientHello(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 80);
  v11[4] = *(_OWORD *)(a1 + 64);
  v11[5] = v2;
  uint64_t v12 = *(void *)(a1 + 96);
  long long v3 = *(_OWORD *)(a1 + 16);
  v11[0] = *(_OWORD *)a1;
  v11[1] = v3;
  long long v4 = *(_OWORD *)(a1 + 48);
  v11[2] = *(_OWORD *)(a1 + 32);
  v11[3] = v4;
  long long v5 = *(_OWORD *)(a2 + 16);
  v13[0] = *(_OWORD *)a2;
  v13[1] = v5;
  long long v6 = *(_OWORD *)(a2 + 32);
  long long v7 = *(_OWORD *)(a2 + 48);
  long long v8 = *(_OWORD *)(a2 + 64);
  long long v9 = *(_OWORD *)(a2 + 80);
  uint64_t v14 = *(void *)(a2 + 96);
  v13[4] = v8;
  v13[5] = v9;
  v13[2] = v6;
  v13[3] = v7;
  return specialized static ClientHello.__derived_struct_equals(_:_:)((unsigned __int8 *)v11, (unsigned __int8 *)v13) & 1;
}

unint64_t ClientHello.write(into:)(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  LOWORD(v48) = *(_WORD *)v2;
  uint64_t v4 = MEMORY[0x1E4FBB2B8];
  uint64_t v5 = MEMORY[0x1E4F27EF0];
  *((void *)&v52 + 1) = MEMORY[0x1E4FBB2B8];
  uint64_t v53 = MEMORY[0x1E4F27EF0];
  *(void *)&long long v51 = &v48;
  *((void *)&v51 + 1) = (char *)&v48 + 2;
  __swift_project_boxed_opaque_existential_1(&v51, MEMORY[0x1E4FBB2B8]);
  Data._Representation.append(contentsOf:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v51);
  long long v6 = *(_OWORD *)(v2 + 24);
  long long v48 = *(_OWORD *)(v2 + 8);
  long long v49 = v6;
  *((void *)&v52 + 1) = v4;
  uint64_t v53 = v5;
  *(void *)&long long v51 = &v48;
  *((void *)&v51 + 1) = &v50;
  __swift_project_boxed_opaque_existential_1(&v51, v4);
  Data._Representation.append(contentsOf:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v51);
  long long v7 = *(_OWORD *)(v2 + 56);
  long long v51 = *(_OWORD *)(v2 + 40);
  long long v52 = v7;
  uint64_t v53 = *(void *)(v2 + 72);
  unint64_t v8 = ByteBuffer.writeLegacySessionID(_:)((uint64_t)&v51);
  unint64_t v9 = v8 + 34;
  if (__OFADD__(v8, 34))
  {
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
  uint64_t v10 = *a1;
  unint64_t v11 = a1[1];
  uint64_t v12 = 0;
  switch(v11 >> 62)
  {
    case 1uLL:
      uint64_t v12 = v10 >> 32;
      break;
    case 2uLL:
      uint64_t v12 = *(void *)(v10 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v12 = BYTE6(v11);
      break;
  }
  unsigned __int16 v55 = 0;
  *((void *)&v49 + 1) = MEMORY[0x1E4FBB2B8];
  uint64_t v50 = MEMORY[0x1E4F27EF0];
  *(void *)&long long v48 = &v55;
  *((void *)&v48 + 1) = v56;
  __swift_project_boxed_opaque_existential_1(&v48, MEMORY[0x1E4FBB2B8]);
  Data._Representation.append(contentsOf:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v48);
  uint64_t v13 = *(void *)(v2 + 80);
  uint64_t v46 = v13;
  uint64_t v14 = *(void *)(v13 + 16);
  if (!v14)
  {
LABEL_13:
    unint64_t v16 = 0;
    goto LABEL_14;
  }
  uint64_t v15 = v13 + 32;
  swift_bridgeObjectRetain();
  unint64_t v16 = 0;
  do
  {
    unsigned __int16 v55 = bswap32(*(unsigned __int16 *)(v15 + v16)) >> 16;
    *((void *)&v49 + 1) = MEMORY[0x1E4FBB2B8];
    uint64_t v50 = MEMORY[0x1E4F27EF0];
    *(void *)&long long v48 = &v55;
    *((void *)&v48 + 1) = v56;
    __swift_project_boxed_opaque_existential_1(&v48, MEMORY[0x1E4FBB2B8]);
    Data._Representation.append(contentsOf:)();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v48);
    if (v16 == 0x7FFFFFFFFFFFFFFELL)
    {
      __break(1u);
LABEL_58:
      __break(1u);
LABEL_59:
      __break(1u);
LABEL_60:
      __break(1u);
LABEL_61:
      __break(1u);
LABEL_62:
      __break(1u);
LABEL_63:
      __break(1u);
LABEL_64:
      __break(1u);
      goto LABEL_65;
    }
    v16 += 2;
    --v14;
  }
  while (v14);
  outlined release of [Extension]((uint64_t)&v46);
  if ((v16 & 0x8000000000000000) != 0)
  {
LABEL_66:
    __break(1u);
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  if (v16 >> 16)
  {
    __break(1u);
    goto LABEL_13;
  }
LABEL_14:
  specialized ByteBuffer.setInteger<A>(_:at:as:)(v16, v12);
  unint64_t v17 = v9 + v16 + 2;
  if (__OFADD__(v9, v16 + 2)) {
    goto LABEL_67;
  }
  outlined retain of ClientHello(v2);
  unint64_t v18 = specialized ByteBuffer.writeVariableLengthVector<A>(lengthFieldType:_:)(a1, v2);
  outlined release of ClientHello(v2);
  BOOL v19 = __OFADD__(v17, v18);
  unint64_t v20 = v17 + v18;
  if (v19)
  {
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  uint64_t v21 = *a1;
  unint64_t v22 = a1[1];
  uint64_t v23 = 0;
  switch(v22 >> 62)
  {
    case 1uLL:
      uint64_t v23 = v21 >> 32;
      break;
    case 2uLL:
      uint64_t v23 = *(void *)(v21 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v23 = BYTE6(v22);
      break;
  }
  unsigned __int16 v55 = 0;
  *((void *)&v49 + 1) = MEMORY[0x1E4FBB2B8];
  uint64_t v50 = MEMORY[0x1E4F27EF0];
  *(void *)&long long v48 = &v55;
  *((void *)&v48 + 1) = v56;
  __swift_project_boxed_opaque_existential_1(&v48, MEMORY[0x1E4FBB2B8]);
  Data._Representation.append(contentsOf:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v48);
  uint64_t v24 = *(void *)(v2 + 96);
  uint64_t v45 = v24;
  uint64_t v25 = *(void *)(v24 + 16);
  if (!v25)
  {
LABEL_54:
    unint64_t v27 = 0;
    goto LABEL_55;
  }
  uint64_t v42 = v23;
  unint64_t v43 = v20;
  uint64_t v26 = v24 + 32;
  swift_bridgeObjectRetain();
  unint64_t v27 = 0;
  do
  {
    outlined init with take of Extension((long long *)v26, (uint64_t)v54);
    uint64_t v28 = *(void *)v26;
    unint64_t v29 = *(void *)(v26 + 8);
    unint64_t v30 = *(void *)(v26 + 16);
    outlined init with take of Extension(v54, (uint64_t)&v55);
    v26 += 40;
    unsigned int v31 = 42;
    switch(v56[30])
    {
      case 1:
        swift_bridgeObjectRetain();
        unsigned int v31 = 10;
        break;
      case 2:
        outlined init with take of Extension.SupportedVersions((uint64_t)&v55, (uint64_t)v58);
        outlined copy of Extension.ServerCertificateType(v28, v29 & 1);
        unsigned int v31 = 43;
        break;
      case 3:
      case 9:
        outlined copy of Data._Representation(v28, v29);
        unsigned int v31 = 16;
        break;
      case 4:
        outlined init with take of Extension.KeyShare((uint64_t)&v55, (uint64_t)v59);
        outlined copy of Extension.KeyShare(v28, v29, v30);
        unsigned int v31 = 51;
        break;
      case 5:
        break;
      case 6:
        swift_bridgeObjectRetain();
        unsigned int v31 = 13;
        break;
      case 7:
        outlined init with take of Extension.ServerCertificateType((uint64_t)&v55, (uint64_t)v60);
        outlined copy of Extension.ServerCertificateType(v28, v29 & 1);
        unsigned int v31 = 20;
        break;
      case 8:
        outlined copy of Data._Representation(v28, v29);
        unsigned int v31 = 57;
        break;
      case 0xA:
        swift_bridgeObjectRetain();
        unsigned int v31 = 45;
        break;
      case 0xB:
        outlined init with take of Extension.PreSharedKey((uint64_t)&v55, (uint64_t)v61);
        outlined copy of Extension.PreSharedKey(v28, v29, v30 & 1);
        unsigned int v31 = 41;
        break;
      case 0xC:
        outlined init with take of Extension.TicketRequest((uint64_t)&v55, (uint64_t)v47);
        unsigned int v31 = 58;
        break;
      case 0xD:
        unsigned int v31 = v55;
        outlined copy of Data._Representation(v29, v30);
        break;
      default:
        outlined init with take of Extension.ServerName((uint64_t)&v55, (uint64_t)v57);
        outlined copy of ByteBuffer?(v28, v29);
        unsigned int v31 = 0;
        break;
    }
    __int16 v44 = __rev16(v31);
    *((void *)&v49 + 1) = MEMORY[0x1E4FBB2B8];
    uint64_t v50 = MEMORY[0x1E4F27EF0];
    *(void *)&long long v48 = &v44;
    *((void *)&v48 + 1) = &v45;
    __swift_project_boxed_opaque_existential_1(&v48, MEMORY[0x1E4FBB2B8]);
    Data._Representation.append(contentsOf:)();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v48);
    uint64_t v32 = *a1;
    unint64_t v33 = a1[1];
    uint64_t v34 = 0;
    switch(v33 >> 62)
    {
      case 1uLL:
        uint64_t v34 = v32 >> 32;
        break;
      case 2uLL:
        uint64_t v34 = *(void *)(v32 + 24);
        break;
      case 3uLL:
        break;
      default:
        uint64_t v34 = BYTE6(v33);
        break;
    }
    __int16 v44 = 0;
    *((void *)&v49 + 1) = MEMORY[0x1E4FBB2B8];
    uint64_t v50 = MEMORY[0x1E4F27EF0];
    *(void *)&long long v48 = &v44;
    *((void *)&v48 + 1) = &v45;
    __swift_project_boxed_opaque_existential_1(&v48, MEMORY[0x1E4FBB2B8]);
    Data._Representation.append(contentsOf:)();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v48);
    unint64_t v35 = closure #1 in ByteBuffer.writeExtension(_:)(a1, v54);
    if ((v35 & 0x8000000000000000) != 0) {
      goto LABEL_58;
    }
    unint64_t v36 = v35;
    if (v35 >> 16) {
      goto LABEL_59;
    }
    uint64_t v37 = v34 + 2;
    if (__OFADD__(v34, 2)) {
      goto LABEL_60;
    }
    if (v34 < a1[2]) {
      goto LABEL_61;
    }
    uint64_t v38 = *a1;
    unint64_t v39 = a1[1];
    uint64_t v40 = 0;
    switch(v39 >> 62)
    {
      case 1uLL:
        uint64_t v40 = v38 >> 32;
        break;
      case 2uLL:
        uint64_t v40 = *(void *)(v38 + 24);
        break;
      case 3uLL:
        break;
      default:
        uint64_t v40 = BYTE6(v39);
        break;
    }
    if (v40 < v37) {
      goto LABEL_62;
    }
    __int16 v44 = bswap32(v35) >> 16;
    if (v37 < v34) {
      goto LABEL_63;
    }
    *((void *)&v49 + 1) = MEMORY[0x1E4FBB2B8];
    uint64_t v50 = MEMORY[0x1E4F27EF0];
    *(void *)&long long v48 = &v44;
    *((void *)&v48 + 1) = &v45;
    __swift_project_boxed_opaque_existential_1(&v48, MEMORY[0x1E4FBB2B8]);
    Data._Representation.replaceSubrange(_:with:count:)();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v48);
    outlined retain of Extension((uint64_t)v54, (void (*)(void, void, void, void, void))outlined consume of Extension);
    BOOL v19 = __OFADD__(v27, v36 + 4);
    v27 += v36 + 4;
    if (v19) {
      goto LABEL_64;
    }
    --v25;
  }
  while (v25);
  outlined release of [Extension]((uint64_t)&v45);
  if ((v27 & 0x8000000000000000) != 0) {
    goto LABEL_69;
  }
  uint64_t v23 = v42;
  unint64_t v20 = v43;
  if (v27 >> 16)
  {
    __break(1u);
    goto LABEL_54;
  }
LABEL_55:
  specialized ByteBuffer.setInteger<A>(_:at:as:)(v27, v23);
  unint64_t result = v20 + v27 + 2;
  if (__OFADD__(v20, v27 + 2)) {
LABEL_70:
  }
    __break(1u);
  return result;
}

uint64_t closure #2 in ClientHello.write(into:)(uint64_t a1, uint64_t a2)
{
  v12[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a2 + 88);
  uint64_t v11 = v2;
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = (char *)(v2 + 32);
    swift_bridgeObjectRetain();
    uint64_t v5 = MEMORY[0x1E4FBB2B8];
    uint64_t v6 = MEMORY[0x1E4F27EF0];
    uint64_t v7 = v3;
    do
    {
      char v8 = *v4++;
      char v10 = v8;
      v12[3] = v5;
      v12[4] = v6;
      v12[0] = &v10;
      v12[1] = &v11;
      __swift_project_boxed_opaque_existential_1(v12, v5);
      Data._Representation.append(contentsOf:)();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
      --v7;
    }
    while (v7);
    outlined release of [Extension]((uint64_t)&v11);
  }
  return v3;
}

void *readCompressionMethods #1 (_:) in ClientHello.init(bytes:)(uint64_t *a1)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v5 = 0;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v5 = v2 >> 32;
      break;
    case 2uLL:
      uint64_t v5 = *(void *)(v2 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v5 = BYTE6(v3);
      break;
  }
  BOOL v6 = __OFSUB__(v5, v4);
  uint64_t v7 = v5 - v4;
  if (v6)
  {
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v8 = v4 + v7;
  if (__OFADD__(v4, v7))
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    JUMPOUT(0x1B57779E0);
  }
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v2 >> 32;
      goto LABEL_11;
    case 2uLL:
      uint64_t v9 = *(void *)(v2 + 24);
      goto LABEL_11;
    case 3uLL:
      goto LABEL_13;
    default:
      uint64_t v9 = BYTE6(v3);
LABEL_11:
      if (v9 < v8)
      {
        __break(1u);
LABEL_13:
        if (v8 > 0) {
          goto LABEL_19;
        }
      }
      if (v8 < v4) {
        goto LABEL_18;
      }
      uint64_t v10 = Data._Representation.subscript.getter();
      unint64_t v12 = v11;
      uint64_t v13 = specialized _copyCollectionToContiguousArray<A>(_:)(v10, v11);
      outlined consume of Data._Representation(v10, v12);
      a1[2] = v8;
      return v13;
  }
}

void *readExtensions #1 (_:) in ClientHello.init(bytes:)(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  unint64_t v29 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, 8, 0, MEMORY[0x1E4FBC860]);
  uint64_t v4 = *a1;
  unint64_t v30 = a1;
  unint64_t v31 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v6 = v5 + 2;
  if (__OFADD__(v5, 2))
  {
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
LABEL_51:
    __break(1u);
LABEL_52:
    __break(1u);
  }
  while (2)
  {
    uint64_t v7 = BYTE6(v31);
    switch(v31 >> 62)
    {
      case 1uLL:
        uint64_t v7 = v4 >> 32;
        goto LABEL_4;
      case 2uLL:
        if (*(void *)(v4 + 24) < v6) {
          return v29;
        }
        goto LABEL_9;
      case 3uLL:
        if (v6 < 1) {
          goto LABEL_9;
        }
        return v29;
      default:
LABEL_4:
        if (v7 < v6) {
          return v29;
        }
LABEL_9:
        uint64_t v32 = v4;
        unint64_t v33 = v31;
        if (v6 < v5) {
          goto LABEL_47;
        }
        uint64_t v37 = v5;
        unint64_t v38 = v6;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<Int>);
        lazy protocol witness table accessor for type Data and conformance Data();
        lazy protocol witness table accessor for type Range<Int> and conformance Range<A>();
        DataProtocol.copyBytes<A>(to:from:)();
        v30[2] = v6;
        uint64_t v8 = v6 + 2;
        if (__OFADD__(v6, 2)) {
          goto LABEL_48;
        }
        break;
    }
    unsigned int v9 = bswap32(0) >> 16;
    uint64_t v10 = v4 >> 32;
    uint64_t v11 = BYTE6(v31);
    switch(v31 >> 62)
    {
      case 1uLL:
        goto LABEL_13;
      case 2uLL:
        uint64_t v10 = *(void *)(v4 + 24);
        swift_retain();
LABEL_13:
        swift_retain();
        uint64_t v11 = v10;
        goto LABEL_14;
      case 3uLL:
        if (v8 < 1) {
          goto LABEL_17;
        }
        goto LABEL_43;
      default:
LABEL_14:
        if (v11 >= v8)
        {
LABEL_17:
          uint64_t v32 = v4;
          unint64_t v33 = v31;
          if (v8 < v6) {
            goto LABEL_49;
          }
          uint64_t v37 = v6;
          unint64_t v38 = v6 + 2;
          DataProtocol.copyBytes<A>(to:from:)();
          uint64_t v12 = bswap32(0) >> 16;
          v30[2] = v8;
          uint64_t v13 = v8 + v12;
          if (__OFADD__(v8, v12)) {
            goto LABEL_50;
          }
          uint64_t v14 = BYTE6(v31);
          switch(v31 >> 62)
          {
            case 1uLL:
              uint64_t v14 = v4 >> 32;
              goto LABEL_22;
            case 2uLL:
              uint64_t v14 = *(void *)(v4 + 24);
              goto LABEL_22;
            case 3uLL:
              if (v13 <= 0) {
                goto LABEL_25;
              }
              goto LABEL_43;
            default:
LABEL_22:
              if (v14 < v13) {
                goto LABEL_42;
              }
LABEL_25:
              if (v13 < v8) {
                goto LABEL_51;
              }
              uint64_t v15 = Data._Representation.subscript.getter();
              v30[2] = v13;
              uint64_t v17 = 0;
              switch(v16 >> 62)
              {
                case 1uLL:
                  uint64_t v17 = (int)v15;
                  break;
                case 2uLL:
                  uint64_t v17 = *(void *)(v15 + 16);
                  break;
                default:
                  break;
              }
              uint64_t v37 = v15;
              unint64_t v38 = v16;
              uint64_t v39 = v17;
              closure #1 in ByteBuffer.readExtension(messageType:helloRetryRequest:)(&v37, v9, 1u, 0, (uint64_t)&v32);
              if (v2) {
                goto LABEL_44;
              }
              uint64_t v18 = 0;
              switch(v38 >> 62)
              {
                case 1uLL:
                  uint64_t v18 = v37 >> 32;
                  break;
                case 2uLL:
                  uint64_t v18 = *(void *)(v37 + 24);
                  break;
                case 3uLL:
                  break;
                default:
                  uint64_t v18 = BYTE6(v38);
                  break;
              }
              if (__OFSUB__(v18, v39)) {
                goto LABEL_52;
              }
              if (v18 != v39)
              {
                lazy protocol witness table accessor for type TLSError and conformance TLSError();
                swift_allocError();
                *(_DWORD *)uint64_t v27 = 1;
                *(unsigned char *)(v27 + 4) = 1;
                swift_willThrow();
                outlined consume of Extension(v32, v33, v34, v35, v36);
LABEL_44:
                outlined consume of Data._Representation(v37, v38);
                outlined consume of Data._Representation(*v30, v30[1]);
                *unint64_t v30 = v4;
                v30[1] = v31;
                v30[2] = v6;
                swift_willThrow();
                swift_bridgeObjectRelease();
                return v29;
              }
              outlined consume of Data._Representation(v37, v38);
              outlined consume of Data._Representation(v4, v31);
              uint64_t v19 = v32;
              unint64_t v20 = v33;
              unint64_t v21 = v34;
              uint64_t v22 = v35;
              char v23 = v36;
              outlined copy of Extension(v32, v33, v34, v35, v36);
              unint64_t v25 = v29[2];
              unint64_t v24 = v29[3];
              if (v25 >= v24 >> 1) {
                unint64_t v29 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v24 > 1), v25 + 1, 1, v29);
              }
              v29[2] = v25 + 1;
              uint64_t v26 = &v29[5 * v25];
              v26[4] = v19;
              v26[5] = v20;
              v26[6] = v21;
              v26[7] = v22;
              *((unsigned char *)v26 + 64) = v23;
              outlined consume of Extension(v19, v20, v21, v22, v23);
              uint64_t v5 = v30[2];
              uint64_t v6 = v5 + 2;
              if (__OFADD__(v5, 2)) {
                goto LABEL_46;
              }
              break;
          }
          continue;
        }
LABEL_42:
        outlined consume of Data._Representation(v4, v31);
LABEL_43:
        *unint64_t v30 = v4;
        v30[1] = v31;
        v30[2] = v6;
        return v29;
    }
  }
}

unint64_t protocol witness for HandshakeMessageProtocol.write(into:) in conformance ClientHello(uint64_t *a1)
{
  return ClientHello.write(into:)(a1);
}

uint64_t specialized static ClientHello.__derived_struct_equals(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 != *a2
    || a1[1] != a2[1]
    || (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)(a1 + 8), *(int64x2_t *)(a2 + 8)), (int32x4_t)vceqq_s64(*(int64x2_t *)(a1 + 24), *(int64x2_t *)(a2 + 24)))), 0xFuLL))) & 1) == 0|| (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)(a1 + 40), *(int64x2_t *)(a2 + 40)), (int32x4_t)vceqq_s64(*(int64x2_t *)(a1 + 56), *(int64x2_t *)(a2 + 56)))), 0xFuLL))) & 1) == 0|| *((void *)a1 + 9) != *((void *)a2 + 9)|| (specialized static Array<A>.== infix(_:_:)(*((void *)a1 + 10), *((void *)a2 + 10)) & 1) == 0|| !specialized static Array<A>.== infix(_:_:)(*((void *)a1 + 11), *((void *)a2 + 11)))
  {
    return 0;
  }
  uint64_t v4 = *((void *)a1 + 12);
  uint64_t v5 = *((void *)a2 + 12);

  return specialized static Array<A>.== infix(_:_:)(v4, v5);
}

uint64_t specialized ClientHello.init(bytes:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  int v5 = specialized ByteBuffer.readInteger<A>(as:)();
  if ((v5 & 0x10000) != 0
    || (__int16 v6 = v5,
        ByteBuffer.readRandom()((uint64_t)v35),
        outlined init with take of P256.Signing.PublicKey?((uint64_t)v35, (uint64_t)v39, &demangling cache variable for type metadata for Random?), (v40 & 1) != 0))
  {
LABEL_3:
    lazy protocol witness table accessor for type TLSError and conformance TLSError();
    swift_allocError();
    *(_DWORD *)uint64_t v7 = 0;
    *(unsigned char *)(v7 + 4) = 1;
    return swift_willThrow();
  }
  uint64_t v10 = v39[0];
  uint64_t v9 = v39[1];
  uint64_t v12 = v39[2];
  uint64_t v11 = v39[3];
  uint64_t result = ByteBuffer.readLegacySessionID()((uint64_t)v36);
  if (!v2)
  {
    outlined init with take of P256.Signing.PublicKey?((uint64_t)v36, (uint64_t)v37, &demangling cache variable for type metadata for LegacySessionID?);
    if ((v38 & 1) == 0)
    {
      uint64_t v34 = v11;
      uint64_t v41 = v9;
      uint64_t v32 = v37[1];
      uint64_t v33 = v37[0];
      uint64_t v30 = v37[3];
      uint64_t v31 = v37[2];
      uint64_t v29 = v37[4];
      uint64_t v13 = *a1;
      unint64_t v14 = a1[1];
      uint64_t v15 = a1[2];
      outlined copy of Data._Representation(*a1, v14);
      unint64_t v16 = specialized closure #1 in ByteBuffer.readVariableLengthVector<A, B>(lengthFieldType:_:)(a1);
      uint64_t v27 = v15;
      unint64_t v28 = v14;
      if (v16)
      {
        uint64_t v26 = v16;
        outlined consume of Data._Representation(v13, v14);
        uint64_t v13 = *a1;
        unint64_t v17 = a1[1];
        uint64_t v18 = a1[2];
        outlined copy of Data._Representation(*a1, v17);
        uint64_t v19 = specialized closure #1 in ByteBuffer.readVariableLengthVector<A, B>(lengthFieldType:_:)(a1);
        uint64_t v27 = v18;
        unint64_t v28 = v17;
        if (v19)
        {
          unint64_t v25 = v19;
          outlined consume of Data._Representation(v13, v17);
          uint64_t v13 = *a1;
          unint64_t v20 = a1[1];
          uint64_t v21 = a1[2];
          outlined copy of Data._Representation(*a1, v20);
          uint64_t v22 = specialized closure #1 in ByteBuffer.readVariableLengthVector<A, B>(lengthFieldType:_:)(a1);
          uint64_t v27 = v21;
          unint64_t v28 = v20;
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t result = outlined consume of Data._Representation(v13, v28);
            *(unsigned char *)a2 = HIBYTE(v6);
            *(unsigned char *)(a2 + 1) = v6;
            uint64_t v24 = v41;
            *(void *)(a2 + 8) = v10;
            *(void *)(a2 + 16) = v24;
            *(void *)(a2 + 24) = v12;
            *(void *)(a2 + 32) = v34;
            *(void *)(a2 + 40) = v33;
            *(void *)(a2 + 48) = v32;
            *(void *)(a2 + 56) = v31;
            *(void *)(a2 + 64) = v30;
            *(void *)(a2 + 72) = v29;
            *(void *)(a2 + 80) = v26;
            *(void *)(a2 + 88) = v25;
            *(void *)(a2 + 96) = v23;
            return result;
          }
          outlined consume of Data._Representation(*a1, a1[1]);
          swift_bridgeObjectRelease();
        }
        else
        {
          outlined consume of Data._Representation(*a1, a1[1]);
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        outlined consume of Data._Representation(*a1, a1[1]);
      }
      *a1 = v13;
      a1[1] = v28;
      a1[2] = v27;
    }
    goto LABEL_3;
  }
  return result;
}

void *specialized ClientHello.serverCertificateTypes.getter()
{
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    unint64_t v3 = (unsigned char *)(v1 + 32);
    uint64_t v4 = &outlined read-only object #0 of ClientHello.serverCertificateTypes.getter;
    while (1)
    {
      if (v3[32] == 7)
      {
        if ((v3[8] & 1) == 0) {
          return *(void **)v3;
        }
        outlined copy of Extension.ServerCertificateType(*(void *)v3, 1);
      }
      v3 += 40;
      if (!--v2) {
        return v4;
      }
    }
  }
  return &outlined read-only object #0 of ClientHello.serverCertificateTypes.getter;
}

unint64_t lazy protocol witness table accessor for type ClientHello and conformance ClientHello()
{
  unint64_t result = lazy protocol witness table cache variable for type ClientHello and conformance ClientHello;
  if (!lazy protocol witness table cache variable for type ClientHello and conformance ClientHello)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ClientHello and conformance ClientHello);
  }
  return result;
}

uint64_t destroy for ClientHello()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ClientHello(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v3 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v3;
  uint64_t v4 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ClientHello(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy104_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for ClientHello(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ClientHello(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 104)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 80);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ClientHello(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 104) = 1;
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
      *(void *)(result + 80) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 104) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ClientHello()
{
  return &type metadata for ClientHello;
}

BOOL static Extension.PreSharedKey.__derived_enum_equals(_:_:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a3) {
    return (a6 & 1) != 0 && (unsigned __int16)a1 == (unsigned __int16)a4;
  }
  else {
    return (a6 & 1) == 0
  }
        && (specialized static Array<A>.== infix(_:_:)(a1, a4) & 1) != 0
        && (specialized static Array<A>.== infix(_:_:)(a2, a5) & 1) != 0;
}

uint64_t ByteBuffer.writePreSharedKey(_:)(uint64_t a1, uint64_t a2, char a3)
{
  v5[5] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    __int16 v4 = bswap32(a1) >> 16;
    v5[3] = MEMORY[0x1E4FBB2B8];
    v5[4] = MEMORY[0x1E4F27EF0];
    v5[0] = &v4;
    v5[1] = v5;
    __swift_project_boxed_opaque_existential_1(v5, MEMORY[0x1E4FBB2B8]);
    Data._Representation.append(contentsOf:)();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
    return 2;
  }
  else
  {
    return ByteBuffer.writeOfferedPSKs(_:)(a1, a2);
  }
}

uint64_t *ByteBuffer.readPreSharedKey(messageType:helloRetryRequest:)(unsigned __int8 a1, char a2)
{
  if (a1 != 2)
  {
    if (a1 == 1)
    {
      __n128 result = ByteBuffer.readOfferedPSKs()();
      if (v3 || result) {
        return result;
      }
LABEL_18:
      lazy protocol witness table accessor for type TLSError and conformance TLSError();
      swift_allocError();
      *(_DWORD *)uint64_t v11 = 0;
      *(unsigned char *)(v11 + 4) = 1;
      return (uint64_t *)swift_willThrow();
    }
LABEL_7:
    int v5 = a1 | 0x290000;
    lazy protocol witness table accessor for type TLSError and conformance TLSError();
    swift_allocError();
    *(_DWORD *)uint64_t v6 = v5;
    *(unsigned char *)(v6 + 4) = 0;
    return (uint64_t *)swift_willThrow();
  }
  if (a2) {
    goto LABEL_7;
  }
  uint64_t v7 = v2[2];
  uint64_t v8 = v7 + 2;
  if (__OFADD__(v7, 2))
  {
    __break(1u);
LABEL_22:
    __break(1u);
  }
  uint64_t v9 = *v2;
  unint64_t v10 = v2[1];
  switch(v10 >> 62)
  {
    case 1uLL:
      if (v9 >> 32 < v8) {
        goto LABEL_18;
      }
      goto LABEL_15;
    case 2uLL:
      if (*(void *)(v9 + 24) >= v8) {
        goto LABEL_15;
      }
      goto LABEL_18;
    case 3uLL:
      if (v8 > 0) {
        goto LABEL_18;
      }
      goto LABEL_15;
    default:
      if (BYTE6(v10) < v8) {
        goto LABEL_18;
      }
LABEL_15:
      if (v8 < v7) {
        goto LABEL_22;
      }
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<Int>);
      lazy protocol witness table accessor for type Data and conformance Data();
      lazy protocol witness table accessor for type Range<Int> and conformance Range<A>();
      DataProtocol.copyBytes<A>(to:from:)();
      __n128 result = (uint64_t *)(bswap32(0) >> 16);
      v2[2] = v8;
      break;
  }
  return result;
}

uint64_t Extension.PreSharedKey.OfferedPSKs.PSKIdentity.obfuscatedTicketAge.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a4;
}

uint64_t Extension.PreSharedKey.OfferedPSKs.PSKIdentity.obfuscatedTicketAge.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 24) = result;
  return result;
}

void Extension.PreSharedKey.hash(into:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4)
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(a2);
  }
  else
  {
    Hasher._combine(_:)(0);
    swift_bridgeObjectRetain();
    specialized Array<A>.hash(into:)(a1, a2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    specialized Array<A>.hash(into:)(a1, a3);
    swift_bridgeObjectRelease();
  }
}

uint64_t static Extension.PreSharedKey.OfferedPSKs.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((specialized static Array<A>.== infix(_:_:)(a1, a3) & 1) == 0) {
    return 0;
  }

  return specialized static Array<A>.== infix(_:_:)(a2, a4);
}

Swift::Int Extension.PreSharedKey.hashValue.getter(uint64_t a1, uint64_t a2, char a3)
{
  Hasher.init(_seed:)();
  if (a3)
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(a1);
  }
  else
  {
    Hasher._combine(_:)(0);
    swift_bridgeObjectRetain();
    specialized Array<A>.hash(into:)((uint64_t)v7, a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    specialized Array<A>.hash(into:)((uint64_t)v7, a2);
    swift_bridgeObjectRelease();
  }
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Extension.PreSharedKey()
{
  uint64_t v1 = *(void *)v0;
  uint64_t v2 = *(void *)(v0 + 8);
  char v3 = *(unsigned char *)(v0 + 16);
  Hasher.init(_seed:)();
  if (v3)
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v1);
  }
  else
  {
    Hasher._combine(_:)(0);
    swift_bridgeObjectRetain();
    specialized Array<A>.hash(into:)((uint64_t)v5, v1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    specialized Array<A>.hash(into:)((uint64_t)v5, v2);
    swift_bridgeObjectRelease();
  }
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance Extension.PreSharedKey(uint64_t a1)
{
  uint64_t v3 = *(void *)v1;
  if (*(unsigned char *)(v1 + 16))
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v3);
  }
  else
  {
    uint64_t v4 = *(void *)(v1 + 8);
    Hasher._combine(_:)(0);
    swift_bridgeObjectRetain();
    specialized Array<A>.hash(into:)(a1, v3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    specialized Array<A>.hash(into:)(a1, v4);
    swift_bridgeObjectRelease();
  }
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Extension.PreSharedKey()
{
  uint64_t v1 = *(void *)v0;
  uint64_t v2 = *(void *)(v0 + 8);
  char v3 = *(unsigned char *)(v0 + 16);
  Hasher.init(_seed:)();
  if (v3)
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v1);
  }
  else
  {
    Hasher._combine(_:)(0);
    swift_bridgeObjectRetain();
    specialized Array<A>.hash(into:)((uint64_t)v5, v1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    specialized Array<A>.hash(into:)((uint64_t)v5, v2);
    swift_bridgeObjectRelease();
  }
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance Extension.PreSharedKey(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)a2;
  if ((*(unsigned char *)(a1 + 16) & 1) == 0) {
    return (*(unsigned char *)(a2 + 16) & 1) == 0
  }
        && (uint64_t v7 = *(void *)(a2 + 8),
            uint64_t v8 = *(void *)(a1 + 8),
            (specialized static Array<A>.== infix(_:_:)(v4, v5) & 1) != 0)
        && (specialized static Array<A>.== infix(_:_:)(v8, v7) & 1) != 0;
  return (*(unsigned char *)(a2 + 16) & 1) != 0 && (unsigned __int16)v4 == (unsigned __int16)v5;
}

uint64_t Extension.PreSharedKey.OfferedPSKs.hash(into:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_bridgeObjectRetain();
  specialized Array<A>.hash(into:)(a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  specialized Array<A>.hash(into:)(a1, a3);

  return swift_bridgeObjectRelease();
}

Swift::Int Extension.PreSharedKey.OfferedPSKs.hashValue.getter(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  specialized Array<A>.hash(into:)((uint64_t)v5, a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  specialized Array<A>.hash(into:)((uint64_t)v5, a2);
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Extension.PreSharedKey.OfferedPSKs()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  specialized Array<A>.hash(into:)((uint64_t)v4, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  specialized Array<A>.hash(into:)((uint64_t)v4, v2);
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance Extension.PreSharedKey.OfferedPSKs(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  swift_bridgeObjectRetain();
  specialized Array<A>.hash(into:)(a1, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  specialized Array<A>.hash(into:)(a1, v3);

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Extension.PreSharedKey.OfferedPSKs()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  specialized Array<A>.hash(into:)((uint64_t)v4, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  specialized Array<A>.hash(into:)((uint64_t)v4, v2);
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance Extension.PreSharedKey.OfferedPSKs(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a2[1];
  if ((specialized static Array<A>.== infix(_:_:)(*a1, *a2) & 1) == 0) {
    return 0;
  }

  return specialized static Array<A>.== infix(_:_:)(v2, v3);
}

void Extension.PreSharedKey.OfferedPSKs.PSKIdentity.hash(into:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, Swift::UInt32 a5)
{
  uint64_t v9 = 0;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = a2 >> 32;
      goto LABEL_5;
    case 2uLL:
      uint64_t v9 = *(void *)(a2 + 24);
LABEL_5:
      outlined copy of Data._Representation(a2, a3);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v9 = BYTE6(a3);
      break;
  }
  if (v9 < a4)
  {
    __break(1u);
    JUMPOUT(0x1B577920CLL);
  }
  uint64_t v10 = Data._Representation.subscript.getter();
  unint64_t v12 = v11;
  Data.hash(into:)();
  outlined consume of Data._Representation(v10, v12);
  outlined consume of Data._Representation(a2, a3);
  Hasher._combine(_:)(a5);
}

uint64_t static Extension.PreSharedKey.OfferedPSKs.PSKIdentity.__derived_struct_equals(_:_:)(uint64_t a1, unint64_t a2, uint64_t a3, int a4, uint64_t a5, unint64_t a6, uint64_t a7, int a8)
{
  return specialized static ByteBuffer.== infix(_:_:)(a1, a2, a3, a5, a6, a7) & (a4 == a8);
}

Swift::Int Extension.PreSharedKey.OfferedPSKs.PSKIdentity.hashValue.getter(uint64_t a1, unint64_t a2, uint64_t a3, Swift::UInt32 a4)
{
  Hasher.init(_seed:)();
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v8 = a1 >> 32;
      goto LABEL_5;
    case 2uLL:
      uint64_t v8 = *(void *)(a1 + 24);
LABEL_5:
      outlined copy of Data._Representation(a1, a2);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v8 = BYTE6(a2);
      break;
  }
  if (v8 < a3)
  {
    __break(1u);
    JUMPOUT(0x1B5779358);
  }
  uint64_t v9 = Data._Representation.subscript.getter();
  unint64_t v11 = v10;
  Data.hash(into:)();
  outlined consume of Data._Representation(v9, v11);
  outlined consume of Data._Representation(a1, a2);
  Hasher._combine(_:)(a4);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Extension.PreSharedKey.OfferedPSKs.PSKIdentity()
{
  return Extension.PreSharedKey.OfferedPSKs.PSKIdentity.hashValue.getter(*(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16), *(_DWORD *)(v0 + 24));
}

void protocol witness for Hashable.hash(into:) in conformance Extension.PreSharedKey.OfferedPSKs.PSKIdentity()
{
  uint64_t v1 = *(void *)v0;
  unint64_t v2 = *(void *)(v0 + 8);
  uint64_t v3 = *(void *)(v0 + 16);
  Swift::UInt32 v4 = *(_DWORD *)(v0 + 24);
  uint64_t v5 = 0;
  switch(v2 >> 62)
  {
    case 1uLL:
      uint64_t v5 = v1 >> 32;
      goto LABEL_5;
    case 2uLL:
      uint64_t v5 = *(void *)(v1 + 24);
LABEL_5:
      outlined copy of Data._Representation(*(void *)v0, *(void *)(v0 + 8));
      break;
    case 3uLL:
      break;
    default:
      uint64_t v5 = BYTE6(v2);
      break;
  }
  if (v5 < v3)
  {
    __break(1u);
    JUMPOUT(0x1B5779460);
  }
  uint64_t v6 = Data._Representation.subscript.getter();
  unint64_t v8 = v7;
  Data.hash(into:)();
  outlined consume of Data._Representation(v6, v8);
  outlined consume of Data._Representation(v1, v2);
  Hasher._combine(_:)(v4);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Extension.PreSharedKey.OfferedPSKs.PSKIdentity()
{
  uint64_t v2 = *(void *)v0;
  unint64_t v1 = *(void *)(v0 + 8);
  uint64_t v3 = *(void *)(v0 + 16);
  Swift::UInt32 v4 = *(_DWORD *)(v0 + 24);
  Hasher.init(_seed:)();
  uint64_t v5 = 0;
  switch(v1 >> 62)
  {
    case 1uLL:
      uint64_t v5 = v2 >> 32;
      goto LABEL_5;
    case 2uLL:
      uint64_t v5 = *(void *)(v2 + 24);
LABEL_5:
      outlined copy of Data._Representation(v2, v1);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v5 = BYTE6(v1);
      break;
  }
  if (v5 < v3)
  {
    __break(1u);
    JUMPOUT(0x1B5779564);
  }
  uint64_t v6 = Data._Representation.subscript.getter();
  unint64_t v8 = v7;
  Data.hash(into:)();
  outlined consume of Data._Representation(v6, v8);
  outlined consume of Data._Representation(v2, v1);
  Hasher._combine(_:)(v4);
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance Extension.PreSharedKey.OfferedPSKs.PSKIdentity(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a1 + 24);
  int v3 = *(_DWORD *)(a2 + 24);
  return specialized static ByteBuffer.== infix(_:_:)(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)a2, *(void *)(a2 + 8), *(void *)(a2 + 16)) & (v2 == v3);
}

uint64_t Extension.PreSharedKey.OfferedPSKs.PSKBinderEntry.hash(into:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v7 = 0;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v7 = a2 >> 32;
      goto LABEL_5;
    case 2uLL:
      uint64_t v7 = *(void *)(a2 + 24);
LABEL_5:
      outlined copy of Data._Representation(a2, a3);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v7 = BYTE6(a3);
      break;
  }
  if (v7 < a4)
  {
    __break(1u);
    JUMPOUT(0x1B57796A0);
  }
  uint64_t v8 = Data._Representation.subscript.getter();
  unint64_t v10 = v9;
  Data.hash(into:)();
  outlined consume of Data._Representation(v8, v10);

  return outlined consume of Data._Representation(a2, a3);
}

Swift::Int Extension.PreSharedKey.OfferedPSKs.PSKBinderEntry.hashValue.getter(uint64_t a1, unint64_t a2, uint64_t a3)
{
  Hasher.init(_seed:)();
  uint64_t v6 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v6 = a1 >> 32;
      goto LABEL_5;
    case 2uLL:
      uint64_t v6 = *(void *)(a1 + 24);
LABEL_5:
      outlined copy of Data._Representation(a1, a2);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v6 = BYTE6(a2);
      break;
  }
  if (v6 < a3)
  {
    __break(1u);
    JUMPOUT(0x1B5779794);
  }
  uint64_t v7 = Data._Representation.subscript.getter();
  unint64_t v9 = v8;
  Data.hash(into:)();
  outlined consume of Data._Representation(v7, v9);
  outlined consume of Data._Representation(a1, a2);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Extension.PreSharedKey.OfferedPSKs.PSKBinderEntry()
{
  return Extension.PreSharedKey.OfferedPSKs.PSKBinderEntry.hashValue.getter(*(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16));
}

uint64_t protocol witness for Hashable.hash(into:) in conformance Extension.PreSharedKey.OfferedPSKs.PSKBinderEntry()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  uint64_t v3 = v0[2];
  uint64_t v4 = 0;
  switch(v2 >> 62)
  {
    case 1uLL:
      uint64_t v4 = v1 >> 32;
      goto LABEL_5;
    case 2uLL:
      uint64_t v4 = *(void *)(v1 + 24);
LABEL_5:
      outlined copy of Data._Representation(*v0, v0[1]);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v4 = BYTE6(v2);
      break;
  }
  if (v4 < v3)
  {
    __break(1u);
    JUMPOUT(0x1B577988CLL);
  }
  uint64_t v5 = Data._Representation.subscript.getter();
  unint64_t v7 = v6;
  Data.hash(into:)();
  outlined consume of Data._Representation(v5, v7);

  return outlined consume of Data._Representation(v1, v2);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Extension.PreSharedKey.OfferedPSKs.PSKBinderEntry()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  uint64_t v3 = v0[2];
  Hasher.init(_seed:)();
  uint64_t v4 = 0;
  switch(v2 >> 62)
  {
    case 1uLL:
      uint64_t v4 = v1 >> 32;
      goto LABEL_5;
    case 2uLL:
      uint64_t v4 = *(void *)(v1 + 24);
LABEL_5:
      outlined copy of Data._Representation(v1, v2);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v4 = BYTE6(v2);
      break;
  }
  if (v4 < v3)
  {
    __break(1u);
    JUMPOUT(0x1B5779980);
  }
  uint64_t v5 = Data._Representation.subscript.getter();
  unint64_t v7 = v6;
  Data.hash(into:)();
  outlined consume of Data._Representation(v5, v7);
  outlined consume of Data._Representation(v1, v2);
  return Hasher._finalize()();
}

uint64_t ByteBuffer.writeOfferedPSKs(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *v2;
  unint64_t v4 = v2[1];
  uint64_t v7 = 0;
  switch(v4 >> 62)
  {
    case 1uLL:
      uint64_t v7 = v3 >> 32;
      break;
    case 2uLL:
      uint64_t v7 = *(void *)(v3 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v7 = BYTE6(v4);
      break;
  }
  LOWORD(v63) = 0;
  uint64_t v66 = MEMORY[0x1E4FBB2B8];
  uint64_t v67 = MEMORY[0x1E4F27EF0];
  unint64_t v64 = &v63;
  uint64_t v65 = (unsigned int **)((char *)&v63 + 2);
  __swift_project_boxed_opaque_existential_1(&v64, MEMORY[0x1E4FBB2B8]);
  Data._Representation.append(contentsOf:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v64);
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v57 = a2;
  if (v8)
  {
    uint64_t v56 = v7;
    swift_bridgeObjectRetain();
    unint64_t v9 = 0;
    unint64_t v10 = (_DWORD *)(a1 + 56);
    while (2)
    {
      unint64_t v61 = v9;
      uint64_t v11 = *((void *)v10 - 3);
      unint64_t v12 = *((void *)v10 - 2);
      uint64_t v13 = *((void *)v10 - 1);
      unsigned int v14 = *v10;
      v10 += 8;
      unsigned int v59 = v14;
      uint64_t v15 = *v2;
      unint64_t v16 = v2[1];
      uint64_t v17 = 0;
      switch(v16 >> 62)
      {
        case 1uLL:
          uint64_t v17 = v15 >> 32;
          break;
        case 2uLL:
          uint64_t v17 = *(void *)(v15 + 24);
          break;
        case 3uLL:
          break;
        default:
          uint64_t v17 = BYTE6(v16);
          break;
      }
      LOWORD(v63) = 0;
      uint64_t v66 = MEMORY[0x1E4FBB2B8];
      uint64_t v67 = MEMORY[0x1E4F27EF0];
      unint64_t v64 = &v63;
      uint64_t v65 = (unsigned int **)((char *)&v63 + 2);
      __swift_project_boxed_opaque_existential_1(&v64, MEMORY[0x1E4FBB2B8]);
      outlined copy of Data._Representation(v11, v12);
      Data._Representation.append(contentsOf:)();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v64);
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      switch(v12 >> 62)
      {
        case 1uLL:
          uint64_t v19 = (int)v11;
          uint64_t v18 = v11 >> 32;
          break;
        case 2uLL:
          uint64_t v19 = *(void *)(v11 + 16);
          uint64_t v18 = *(void *)(v11 + 24);
          break;
        case 3uLL:
          break;
        default:
          uint64_t v19 = 0;
          uint64_t v18 = BYTE6(v12);
          break;
      }
      if (v18 < v13 || v18 < v19)
      {
        __break(1u);
LABEL_81:
        __break(1u);
LABEL_82:
        __break(1u);
LABEL_83:
        __break(1u);
LABEL_84:
        __break(1u);
LABEL_85:
        __break(1u);
LABEL_86:
        __break(1u);
LABEL_87:
        __break(1u);
        goto LABEL_88;
      }
      uint64_t v20 = Data._Representation.subscript.getter();
      unint64_t v22 = v21;
      Data.append(_:)();
      switch(v22 >> 62)
      {
        case 1uLL:
          outlined consume of Data._Representation(v20, v22);
          if (__OFSUB__(HIDWORD(v20), v20)) {
            goto LABEL_95;
          }
          unint64_t v23 = HIDWORD(v20) - (int)v20;
LABEL_24:
          if ((v23 & 0x8000000000000000) != 0) {
            goto LABEL_81;
          }
          if (v23 >> 16) {
            goto LABEL_82;
          }
LABEL_26:
          uint64_t v26 = v17 + 2;
          if (__OFADD__(v17, 2)) {
            goto LABEL_83;
          }
          if (v17 < v2[2]) {
            goto LABEL_84;
          }
          uint64_t v27 = *v2;
          unint64_t v28 = v2[1];
          uint64_t v29 = 0;
          switch(v28 >> 62)
          {
            case 1uLL:
              uint64_t v29 = v27 >> 32;
              break;
            case 2uLL:
              uint64_t v29 = *(void *)(v27 + 24);
              break;
            case 3uLL:
              break;
            default:
              uint64_t v29 = BYTE6(v28);
              break;
          }
          if (v29 < v26) {
            goto LABEL_85;
          }
          LOWORD(v63) = bswap32(v23) >> 16;
          if (v26 < v17) {
            goto LABEL_86;
          }
          uint64_t v66 = MEMORY[0x1E4FBB2B8];
          uint64_t v67 = MEMORY[0x1E4F27EF0];
          unint64_t v64 = &v63;
          uint64_t v65 = (unsigned int **)((char *)&v63 + 2);
          __swift_project_boxed_opaque_existential_1(&v64, MEMORY[0x1E4FBB2B8]);
          Data._Representation.replaceSubrange(_:with:count:)();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v64);
          unsigned int v63 = bswap32(v59);
          uint64_t v66 = MEMORY[0x1E4FBB2B8];
          uint64_t v67 = MEMORY[0x1E4F27EF0];
          unint64_t v64 = &v63;
          uint64_t v65 = &v64;
          __swift_project_boxed_opaque_existential_1(&v64, MEMORY[0x1E4FBB2B8]);
          Data._Representation.append(contentsOf:)();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v64);
          outlined consume of Data._Representation(v11, v12);
          unint64_t v9 = v61 + v23 + 6;
          if (__OFADD__(v61, v23 + 6)) {
            goto LABEL_87;
          }
          if (--v8) {
            continue;
          }
          swift_bridgeObjectRelease();
          if ((v9 & 0x8000000000000000) != 0) {
            goto LABEL_98;
          }
          a2 = v57;
          uint64_t v7 = v56;
          if (!(v9 >> 16)) {
            goto LABEL_40;
          }
          __break(1u);
          break;
        case 2uLL:
          uint64_t v25 = *(void *)(v20 + 16);
          uint64_t v24 = *(void *)(v20 + 24);
          outlined consume of Data._Representation(v20, v22);
          unint64_t v23 = v24 - v25;
          if (!__OFSUB__(v24, v25)) {
            goto LABEL_24;
          }
          goto LABEL_94;
        case 3uLL:
          outlined consume of Data._Representation(v20, v22);
          unint64_t v23 = 0;
          goto LABEL_26;
        default:
          outlined consume of Data._Representation(v20, v22);
          unint64_t v23 = BYTE6(v22);
          goto LABEL_26;
      }
      break;
    }
  }
  unint64_t v9 = 0;
LABEL_40:
  specialized ByteBuffer.setInteger<A>(_:at:as:)(v9, v7);
  uint64_t v30 = *v2;
  unint64_t v31 = v2[1];
  uint64_t v32 = 0;
  switch(v31 >> 62)
  {
    case 1uLL:
      uint64_t v32 = v30 >> 32;
      break;
    case 2uLL:
      uint64_t v32 = *(void *)(v30 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v32 = BYTE6(v31);
      break;
  }
  LOWORD(v63) = 0;
  uint64_t v66 = MEMORY[0x1E4FBB2B8];
  uint64_t v67 = MEMORY[0x1E4F27EF0];
  unint64_t v64 = &v63;
  uint64_t v65 = (unsigned int **)((char *)&v63 + 2);
  __swift_project_boxed_opaque_existential_1(&v64, MEMORY[0x1E4FBB2B8]);
  Data._Representation.append(contentsOf:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v64);
  uint64_t v33 = *(void *)(a2 + 16);
  if (v33)
  {
    uint64_t v58 = v32;
    unint64_t v62 = v9;
    swift_bridgeObjectRetain();
    unint64_t v34 = 0;
    uint64_t v35 = (uint64_t *)(a2 + 48);
    while (2)
    {
      uint64_t v36 = *(v35 - 2);
      unint64_t v37 = *(v35 - 1);
      uint64_t v38 = *v35;
      uint64_t v39 = *v2;
      unint64_t v40 = v2[1];
      uint64_t v41 = 0;
      uint64_t v60 = v35 + 3;
      switch(v40 >> 62)
      {
        case 1uLL:
          uint64_t v41 = v39 >> 32;
          break;
        case 2uLL:
          uint64_t v41 = *(void *)(v39 + 24);
          break;
        case 3uLL:
          break;
        default:
          uint64_t v41 = BYTE6(v40);
          break;
      }
      LOBYTE(v63) = 0;
      uint64_t v66 = MEMORY[0x1E4FBB2B8];
      uint64_t v67 = MEMORY[0x1E4F27EF0];
      unint64_t v64 = &v63;
      uint64_t v65 = (unsigned int **)((char *)&v63 + 1);
      __swift_project_boxed_opaque_existential_1(&v64, MEMORY[0x1E4FBB2B8]);
      outlined copy of Data._Representation(v36, v37);
      Data._Representation.append(contentsOf:)();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v64);
      uint64_t v42 = 0;
      uint64_t v43 = 0;
      switch(v37 >> 62)
      {
        case 1uLL:
          uint64_t v43 = (int)v36;
          uint64_t v42 = v36 >> 32;
          break;
        case 2uLL:
          uint64_t v43 = *(void *)(v36 + 16);
          uint64_t v42 = *(void *)(v36 + 24);
          break;
        case 3uLL:
          break;
        default:
          uint64_t v43 = 0;
          uint64_t v42 = BYTE6(v37);
          break;
      }
      if (v42 >= v38 && v42 >= v43)
      {
        uint64_t v44 = Data._Representation.subscript.getter();
        unint64_t v46 = v45;
        Data.append(_:)();
        switch(v46 >> 62)
        {
          case 1uLL:
            outlined consume of Data._Representation(v44, v46);
            if (__OFSUB__(HIDWORD(v44), v44)) {
              goto LABEL_97;
            }
            unint64_t v47 = HIDWORD(v44) - (int)v44;
LABEL_63:
            if ((v47 & 0x8000000000000000) != 0 || v47 >= 0x100)
            {
              _assertionFailure(_:_:file:line:flags:)();
              __break(1u);
              JUMPOUT(0x1B577A214);
            }
LABEL_65:
            uint64_t v50 = v41 + 1;
            if (__OFADD__(v41, 1)) {
              goto LABEL_89;
            }
            if (v41 < v2[2]) {
              goto LABEL_90;
            }
            uint64_t v51 = *v2;
            unint64_t v52 = v2[1];
            uint64_t v53 = 0;
            switch(v52 >> 62)
            {
              case 1uLL:
                uint64_t v53 = v51 >> 32;
                break;
              case 2uLL:
                uint64_t v53 = *(void *)(v51 + 24);
                break;
              case 3uLL:
                break;
              default:
                uint64_t v53 = BYTE6(v52);
                break;
            }
            if (v53 < v50) {
              goto LABEL_91;
            }
            LOBYTE(v63) = v47;
            if (v50 < v41) {
              goto LABEL_92;
            }
            uint64_t v66 = MEMORY[0x1E4FBB2B8];
            uint64_t v67 = MEMORY[0x1E4F27EF0];
            unint64_t v64 = &v63;
            uint64_t v65 = (unsigned int **)((char *)&v63 + 1);
            __swift_project_boxed_opaque_existential_1(&v64, MEMORY[0x1E4FBB2B8]);
            Data._Representation.replaceSubrange(_:with:count:)();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)&v64);
            outlined consume of Data._Representation(v36, v37);
            BOOL v54 = __OFADD__(v34, v47 + 1);
            v34 += v47 + 1;
            if (v54) {
              goto LABEL_93;
            }
            --v33;
            uint64_t v35 = v60;
            if (v33) {
              continue;
            }
            swift_bridgeObjectRelease();
            if ((v34 & 0x8000000000000000) != 0) {
              goto LABEL_99;
            }
            unint64_t v9 = v62;
            uint64_t v32 = v58;
            if (!(v34 >> 16)) {
              goto LABEL_79;
            }
            __break(1u);
            break;
          case 2uLL:
            uint64_t v49 = *(void *)(v44 + 16);
            uint64_t v48 = *(void *)(v44 + 24);
            outlined consume of Data._Representation(v44, v46);
            unint64_t v47 = v48 - v49;
            if (!__OFSUB__(v48, v49)) {
              goto LABEL_63;
            }
            goto LABEL_96;
          case 3uLL:
            outlined consume of Data._Representation(v44, v46);
            unint64_t v47 = 0;
            goto LABEL_65;
          default:
            outlined consume of Data._Representation(v44, v46);
            unint64_t v47 = BYTE6(v46);
            goto LABEL_65;
        }
        goto LABEL_78;
      }
      break;
    }
LABEL_88:
    __break(1u);
LABEL_89:
    __break(1u);
LABEL_90:
    __break(1u);
LABEL_91:
    __break(1u);
LABEL_92:
    __break(1u);
LABEL_93:
    __break(1u);
LABEL_94:
    __break(1u);
LABEL_95:
    __break(1u);
LABEL_96:
    __break(1u);
LABEL_97:
    __break(1u);
LABEL_98:
    __break(1u);
LABEL_99:
    __break(1u);
  }
LABEL_78:
  unint64_t v34 = 0;
LABEL_79:
  specialized ByteBuffer.setInteger<A>(_:at:as:)(v34, v32);
  return v9 + v34 + 4;
}

uint64_t *ByteBuffer.readOfferedPSKs()()
{
  unint64_t v2 = v0;
  uint64_t v4 = *v0;
  unint64_t v3 = v0[1];
  uint64_t v5 = v0[2];
  outlined copy of Data._Representation(*v0, v3);
  uint64_t v6 = specialized closure #1 in ByteBuffer.readVariableLengthVector<A, B>(lengthFieldType:_:)(v0);
  if (!v1)
  {
    uint64_t v0 = (uint64_t *)v6;
    if (v6)
    {
      outlined consume of Data._Representation(v4, v3);
      uint64_t v4 = *v2;
      unint64_t v3 = v2[1];
      uint64_t v5 = v2[2];
      outlined copy of Data._Representation(*v2, v3);
      if (specialized closure #1 in ByteBuffer.readVariableLengthVector<A, B>(lengthFieldType:_:)(v2))
      {
        outlined consume of Data._Representation(v4, v3);
        return v0;
      }
      outlined consume of Data._Representation(*v2, v2[1]);
      swift_bridgeObjectRelease();
      uint64_t v0 = 0;
    }
    else
    {
      outlined consume of Data._Representation(*v2, v2[1]);
    }
    *unint64_t v2 = v4;
    v2[1] = v3;
    v2[2] = v5;
    return v0;
  }
  outlined consume of Data._Representation(*v0, v0[1]);
  *uint64_t v0 = v4;
  v0[1] = v3;
  v0[2] = v5;
  swift_willThrow();
  return v0;
}

void *readIdentities #1 (_:) in ByteBuffer.readOfferedPSKs()()
{
  uint64_t v1 = ByteBuffer.readPSKIdentity()();
  if (v0)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4FBC860];
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = v1;
    unint64_t v8 = v2;
    uint64_t v9 = v3;
    int v10 = v4;
    uint64_t v5 = (void *)MEMORY[0x1E4FBC860];
    while (v8 >> 60 != 15)
    {
      outlined copy of Data._Representation(v7, v8);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v5[2] + 1, 1, v5);
      }
      unint64_t v12 = v5[2];
      unint64_t v11 = v5[3];
      if (v12 >= v11 >> 1) {
        uint64_t v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v11 > 1), v12 + 1, 1, v5);
      }
      v5[2] = v12 + 1;
      uint64_t v13 = &v5[4 * v12];
      v13[4] = v7;
      v13[5] = v8;
      _OWORD v13[6] = v9;
      *((_DWORD *)v13 + 14) = v10;
      outlined consume of ByteBuffer?(v7, v8);
      uint64_t v7 = ByteBuffer.readPSKIdentity()();
      unint64_t v8 = v14;
      uint64_t v9 = v15;
      int v10 = v16;
    }
  }
  return v5;
}

uint64_t ByteBuffer.readPSKIdentity()()
{
  uint64_t v1 = v0;
  uint64_t v3 = *v0;
  unint64_t v2 = v0[1];
  uint64_t v4 = v0[2];
  outlined copy of Data._Representation(*v0, v2);
  uint64_t v5 = specialized ByteBuffer.readInteger<A>(as:)();
  if ((v5 & 0x10000) != 0 || (uint64_t v30 = v4, v6 = ByteBuffer.readSlice(length:)((unsigned __int16)v5), v7 >> 60 == 15))
  {
    outlined consume of Data._Representation(*v0, v0[1]);
    uint64_t v9 = 0;
    *uint64_t v0 = v3;
    v0[1] = v2;
    v0[2] = v4;
    return v9;
  }
  uint64_t v9 = v6;
  unint64_t v11 = v7;
  uint64_t v27 = v6;
  unint64_t v28 = v7;
  uint64_t v29 = v8;
  unint64_t v12 = v7 >> 62;
  uint64_t v13 = 0;
  switch(v7 >> 62)
  {
    case 1uLL:
      uint64_t v13 = v6 >> 32;
      break;
    case 2uLL:
      uint64_t v13 = *(void *)(v6 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v13 = BYTE6(v7);
      break;
  }
  if (__OFSUB__(v13, v8))
  {
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v14 = ByteBuffer.readSlice(length:)(v13 - v8);
  if (v15 >> 60 == 15)
  {
LABEL_30:
    __break(1u);
    JUMPOUT(0x1B577A80CLL);
  }
  uint64_t v17 = v14;
  unint64_t v18 = v15;
  uint64_t v19 = v16;
  uint64_t v20 = 0;
  uint64_t v21 = v9;
  switch((int)v12)
  {
    case 1:
      uint64_t v20 = v9 >> 32;
      break;
    case 2:
      uint64_t v20 = *(void *)(v9 + 24);
      break;
    case 3:
      break;
    default:
      uint64_t v20 = BYTE6(v11);
      break;
  }
  if (__OFSUB__(v20, v29)) {
    goto LABEL_28;
  }
  if (v20 != v29)
  {
    lazy protocol witness table accessor for type TLSError and conformance TLSError();
    swift_allocError();
    *(_DWORD *)uint64_t v23 = 1;
    *(unsigned char *)(v23 + 4) = 1;
    swift_willThrow();
    outlined consume of ByteBuffer?(v17, v18);
    outlined consume of Data._Representation(v27, v28);
    outlined consume of Data._Representation(*v1, v1[1]);
    *uint64_t v1 = v3;
    v1[1] = v2;
    v1[2] = v30;
    swift_willThrow();
    return v9;
  }
  uint64_t v9 = v17;
  outlined consume of ByteBuffer?(v21, v11);
  outlined consume of Data._Representation(v3, v2);
  if ((specialized ByteBuffer.readInteger<A>(as:)() & 0x100000000) != 0)
  {
    outlined consume of ByteBuffer?(v17, v18);
    return 0;
  }
  uint64_t v22 = 0;
  switch(v18 >> 62)
  {
    case 1uLL:
      uint64_t v22 = v17 >> 32;
      break;
    case 2uLL:
      uint64_t v22 = *(void *)(v17 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v22 = BYTE6(v18);
      break;
  }
  BOOL v24 = __OFSUB__(v22, v19);
  uint64_t v25 = v22 - v19;
  if (v24) {
    goto LABEL_29;
  }
  if (v25 <= 0)
  {
    lazy protocol witness table accessor for type TLSError and conformance TLSError();
    swift_allocError();
    *(_DWORD *)uint64_t v26 = 8;
    *(unsigned char *)(v26 + 4) = 1;
    swift_willThrow();
    outlined consume of ByteBuffer?(v17, v18);
  }
  return v9;
}

void *readBinderEntries #1 (_:) in ByteBuffer.readOfferedPSKs()(uint64_t *a1)
{
  uint64_t v2 = *a1;
  unint64_t v1 = a1[1];
  uint64_t v3 = a1[2];
  uint64_t v4 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
LABEL_57:
    __break(1u);
LABEL_58:
    __break(1u);
    __break(1u);
    __break(1u);
LABEL_59:
    __break(1u);
LABEL_60:
    __break(1u);
LABEL_61:
    __break(1u);
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
LABEL_64:
    __break(1u);
LABEL_65:
    __break(1u);
  }
  uint64_t v5 = a1;
  uint64_t v6 = BYTE6(v1);
  uint64_t v42 = v2 >> 32;
  unint64_t v7 = (void *)MEMORY[0x1E4FBC860];
  uint64_t v44 = *a1;
  unint64_t v45 = v1 >> 62;
  unint64_t v40 = a1[1];
  while (2)
  {
    uint64_t v8 = v42;
    uint64_t v9 = v6;
    uint64_t v41 = v3;
    switch(v45)
    {
      case 1uLL:
        goto LABEL_5;
      case 2uLL:
        uint64_t v8 = *(void *)(v2 + 24);
LABEL_5:
        uint64_t v10 = v3;
        outlined copy of Data._Representation(v2, v1);
        uint64_t v3 = v10;
        uint64_t v9 = v8;
        goto LABEL_6;
      case 3uLL:
        if (v4 < 1) {
          goto LABEL_9;
        }
        goto LABEL_53;
      default:
LABEL_6:
        if (v9 < v4)
        {
LABEL_53:
          outlined consume of Data._Representation(v2, v1);
          *uint64_t v5 = v2;
          v5[1] = v1;
          v5[2] = v41;
          return v7;
        }
LABEL_9:
        if (v4 < v3) {
          goto LABEL_58;
        }
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<Int>);
        lazy protocol witness table accessor for type Data and conformance Data();
        lazy protocol witness table accessor for type Range<Int> and conformance Range<A>();
        DataProtocol.copyBytes<A>(to:from:)();
        v5[2] = v4;
        uint64_t v11 = v6;
        switch(v45)
        {
          case 1uLL:
            uint64_t v11 = v42;
            goto LABEL_13;
          case 2uLL:
            uint64_t v11 = *(void *)(v2 + 24);
            goto LABEL_13;
          case 3uLL:
            if (v4 < 1) {
              goto LABEL_16;
            }
            goto LABEL_53;
          default:
LABEL_13:
            if (v11 < v4) {
              goto LABEL_53;
            }
LABEL_16:
            uint64_t v12 = Data._Representation.subscript.getter();
            v5[2] = v4;
            unint64_t v14 = v13 >> 62;
            uint64_t v15 = v12;
            unint64_t v16 = v13;
            uint64_t v17 = 0;
            uint64_t v18 = 0;
            switch(v13 >> 62)
            {
              case 1uLL:
                uint64_t v18 = (int)v15;
                uint64_t v17 = v15 >> 32;
                break;
              case 2uLL:
                uint64_t v18 = *(void *)(v15 + 16);
                uint64_t v17 = *(void *)(v15 + 24);
                break;
              case 3uLL:
                break;
              default:
                uint64_t v18 = 0;
                uint64_t v17 = BYTE6(v13);
                break;
            }
            BOOL v19 = __OFSUB__(v17, v18);
            uint64_t v20 = v17 - v18;
            if (v19) {
              goto LABEL_59;
            }
            uint64_t v43 = v7;
            uint64_t v21 = v18 + v20;
            if (__OFADD__(v18, v20)) {
              goto LABEL_60;
            }
            break;
        }
        break;
    }
    uint64_t v22 = v14;
    switch((int)v14)
    {
      case 1:
        uint64_t v23 = v15 >> 32;
        goto LABEL_26;
      case 2:
        uint64_t v23 = *(void *)(v15 + 24);
        goto LABEL_26;
      case 3:
        if (v21 <= 0) {
          goto LABEL_29;
        }
        goto LABEL_65;
      default:
        uint64_t v23 = BYTE6(v13);
LABEL_26:
        if (v23 < v21) {
          goto LABEL_64;
        }
LABEL_29:
        if (v21 < v18) {
          goto LABEL_61;
        }
        uint64_t v24 = Data._Representation.subscript.getter();
        unint64_t v26 = v25 >> 62;
        uint64_t v27 = v24;
        unint64_t v28 = v25;
        uint64_t v29 = 0;
        switch(v25 >> 62)
        {
          case 1uLL:
            uint64_t v29 = (int)v24;
            break;
          case 2uLL:
            uint64_t v29 = *(void *)(v24 + 16);
            break;
          default:
            break;
        }
        uint64_t v30 = 0;
        switch(v22)
        {
          case 1:
            uint64_t v30 = v15 >> 32;
            break;
          case 2:
            uint64_t v30 = *(void *)(v15 + 24);
            break;
          case 3:
            break;
          default:
            uint64_t v30 = BYTE6(v16);
            break;
        }
        if (__OFSUB__(v30, v21)) {
          goto LABEL_62;
        }
        if (v30 != v21)
        {
          lazy protocol witness table accessor for type TLSError and conformance TLSError();
          swift_allocError();
          *(_DWORD *)uint64_t v36 = 1;
          *(unsigned char *)(v36 + 4) = 1;
          swift_willThrow();
          outlined consume of Data._Representation(v27, v28);
          outlined consume of Data._Representation(v15, v16);
          outlined consume of Data._Representation(*a1, a1[1]);
          *a1 = v44;
          a1[1] = v40;
          a1[2] = v41;
          swift_willThrow();
          unint64_t v7 = v43;
          goto LABEL_55;
        }
        outlined consume of Data._Representation(v15, v16);
        unint64_t v1 = v40;
        outlined consume of Data._Representation(v44, v40);
        unint64_t v7 = v43;
        uint64_t v31 = 0;
        switch((int)v26)
        {
          case 1:
            uint64_t v31 = v27 >> 32;
            break;
          case 2:
            uint64_t v31 = *(void *)(v27 + 24);
            break;
          case 3:
            break;
          default:
            uint64_t v31 = BYTE6(v28);
            break;
        }
        BOOL v19 = __OFSUB__(v31, v29);
        uint64_t v32 = v31 - v29;
        if (v19) {
          goto LABEL_63;
        }
        if (v32 > 31)
        {
          outlined copy of Data._Representation(v27, v28);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v7 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v43[2] + 1, 1, v43);
          }
          unint64_t v34 = v7[2];
          unint64_t v33 = v7[3];
          if (v34 >= v33 >> 1) {
            unint64_t v7 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v33 > 1), v34 + 1, 1, v7);
          }
          v7[2] = v34 + 1;
          uint64_t v35 = &v7[3 * v34];
          v35[4] = v27;
          v35[5] = v28;
          v35[6] = v29;
          outlined consume of Data._Representation(v27, v28);
          uint64_t v5 = a1;
          uint64_t v3 = a1[2];
          uint64_t v4 = v3 + 1;
          uint64_t v2 = v44;
          if (__OFADD__(v3, 1)) {
            goto LABEL_57;
          }
          continue;
        }
        lazy protocol witness table accessor for type TLSError and conformance TLSError();
        swift_allocError();
        *(_DWORD *)uint64_t v37 = 8;
        *(unsigned char *)(v37 + 4) = 1;
        swift_willThrow();
        outlined consume of Data._Representation(v27, v28);
LABEL_55:
        swift_bridgeObjectRelease();
        return v7;
    }
  }
}

unint64_t lazy protocol witness table accessor for type Extension.PreSharedKey and conformance Extension.PreSharedKey()
{
  unint64_t result = lazy protocol witness table cache variable for type Extension.PreSharedKey and conformance Extension.PreSharedKey;
  if (!lazy protocol witness table cache variable for type Extension.PreSharedKey and conformance Extension.PreSharedKey)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Extension.PreSharedKey and conformance Extension.PreSharedKey);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Extension.PreSharedKey.OfferedPSKs and conformance Extension.PreSharedKey.OfferedPSKs()
{
  unint64_t result = lazy protocol witness table cache variable for type Extension.PreSharedKey.OfferedPSKs and conformance Extension.PreSharedKey.OfferedPSKs;
  if (!lazy protocol witness table cache variable for type Extension.PreSharedKey.OfferedPSKs and conformance Extension.PreSharedKey.OfferedPSKs)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Extension.PreSharedKey.OfferedPSKs and conformance Extension.PreSharedKey.OfferedPSKs);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Extension.PreSharedKey.OfferedPSKs.PSKIdentity and conformance Extension.PreSharedKey.OfferedPSKs.PSKIdentity()
{
  unint64_t result = lazy protocol witness table cache variable for type Extension.PreSharedKey.OfferedPSKs.PSKIdentity and conformance Extension.PreSharedKey.OfferedPSKs.PSKIdentity;
  if (!lazy protocol witness table cache variable for type Extension.PreSharedKey.OfferedPSKs.PSKIdentity and conformance Extension.PreSharedKey.OfferedPSKs.PSKIdentity)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Extension.PreSharedKey.OfferedPSKs.PSKIdentity and conformance Extension.PreSharedKey.OfferedPSKs.PSKIdentity);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Extension.PreSharedKey.OfferedPSKs.PSKBinderEntry and conformance Extension.PreSharedKey.OfferedPSKs.PSKBinderEntry()
{
  unint64_t result = lazy protocol witness table cache variable for type Extension.PreSharedKey.OfferedPSKs.PSKBinderEntry and conformance Extension.PreSharedKey.OfferedPSKs.PSKBinderEntry;
  if (!lazy protocol witness table cache variable for type Extension.PreSharedKey.OfferedPSKs.PSKBinderEntry and conformance Extension.PreSharedKey.OfferedPSKs.PSKBinderEntry)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Extension.PreSharedKey.OfferedPSKs.PSKBinderEntry and conformance Extension.PreSharedKey.OfferedPSKs.PSKBinderEntry);
  }
  return result;
}

uint64_t destroy for Extension.PreSharedKey(uint64_t a1)
{
  return outlined consume of Extension.PreSharedKey(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t initializeBufferWithCopyOfBuffer for Extension.PreSharedKey(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  outlined copy of Extension.PreSharedKey(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for Extension.PreSharedKey(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  outlined copy of Extension.PreSharedKey(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  outlined consume of Extension.PreSharedKey(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for Extension.PreSharedKey(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  outlined consume of Extension.PreSharedKey(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for Extension.PreSharedKey(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Extension.PreSharedKey(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t getEnumTag for Extension.PreSharedKey(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t destructiveInjectEnumTag for Extension.PreSharedKey(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Extension.PreSharedKey()
{
  return &type metadata for Extension.PreSharedKey;
}

uint64_t destroy for Extension.PreSharedKey.OfferedPSKs()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeBufferWithCopyOfBuffer for Extension.PreSharedKey.OfferedPSKs(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for Extension.PreSharedKey.OfferedPSKs(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for Extension.PreSharedKey.OfferedPSKs(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Extension.PreSharedKey.OfferedPSKs(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Extension.PreSharedKey.OfferedPSKs(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Extension.PreSharedKey.OfferedPSKs()
{
  return &type metadata for Extension.PreSharedKey.OfferedPSKs;
}

uint64_t initializeWithCopy for Extension.PreSharedKey.OfferedPSKs.PSKIdentity(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  unint64_t v5 = *(void *)(a2 + 8);
  outlined copy of Data._Representation(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  return a1;
}

uint64_t assignWithCopy for Extension.PreSharedKey.OfferedPSKs.PSKIdentity(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  unint64_t v5 = *(void *)(a2 + 8);
  outlined copy of Data._Representation(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  outlined consume of Data._Representation(v6, v7);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  return a1;
}

__n128 __swift_memcpy28_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 12) = *(_OWORD *)(a2 + 12);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for Extension.PreSharedKey.OfferedPSKs.PSKIdentity(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  outlined consume of Data._Representation(v4, v5);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for Extension.PreSharedKey.OfferedPSKs.PSKIdentity(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 28)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for Extension.PreSharedKey.OfferedPSKs.PSKIdentity(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(_DWORD *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 13;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 28) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 28) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Extension.PreSharedKey.OfferedPSKs.PSKIdentity()
{
  return &type metadata for Extension.PreSharedKey.OfferedPSKs.PSKIdentity;
}

ValueMetadata *type metadata accessor for Extension.PreSharedKey.OfferedPSKs.PSKBinderEntry()
{
  return &type metadata for Extension.PreSharedKey.OfferedPSKs.PSKBinderEntry;
}

uint64_t PartialHandshakeResult.init(handshakeBytesToSend:newEncryptionLevel:sessionTicket:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  *a7 = a1;
  a7[1] = a2;
  a7[2] = a3;
  uint64_t v11 = type metadata accessor for PartialHandshakeResult(0);
  uint64_t result = outlined init with take of PartialHandshakeResult.NewEncryptionLevel?(a4, (uint64_t)a7 + *(int *)(v11 + 20));
  unint64_t v13 = (void *)((char *)a7 + *(int *)(v11 + 24));
  *unint64_t v13 = a5;
  v13[1] = a6;
  return result;
}

uint64_t type metadata accessor for PartialHandshakeResult(uint64_t a1)
{
  return type metadata accessor for PeerCertificateBundle.Bundle(a1, (uint64_t *)&type metadata singleton initialization cache for PartialHandshakeResult);
}

uint64_t outlined init with take of PartialHandshakeResult.NewEncryptionLevel?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PartialHandshakeResult.NewEncryptionLevel?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t PartialHandshakeResult.handshakeBytesToSend.getter()
{
  uint64_t v1 = *(void *)v0;
  outlined copy of ByteBuffer?(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t PartialHandshakeResult.handshakeBytesToSend.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = outlined consume of ByteBuffer?(*v3, v3[1]);
  uint64_t *v3 = a1;
  v3[1] = a2;
  v3[2] = a3;
  return result;
}

uint64_t PartialHandshakeResult.newEncryptionLevel.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PartialHandshakeResult(0) + 20);

  return outlined init with copy of PartialHandshakeResult.NewEncryptionLevel?(v3, a1);
}

uint64_t outlined init with copy of PartialHandshakeResult.NewEncryptionLevel?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PartialHandshakeResult.NewEncryptionLevel?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t PartialHandshakeResult.newEncryptionLevel.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PartialHandshakeResult(0) + 20);

  return outlined assign with take of PartialHandshakeResult.NewEncryptionLevel?(a1, v3);
}

uint64_t outlined assign with take of PartialHandshakeResult.NewEncryptionLevel?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PartialHandshakeResult.NewEncryptionLevel?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*PartialHandshakeResult.newEncryptionLevel.modify())(void)
{
  return CertificateVerify.algorithm.getter;
}

uint64_t PartialHandshakeResult.sessionTicket.getter()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for PartialHandshakeResult(0) + 24);
  uint64_t v2 = *(void *)v1;
  outlined copy of ByteBuffer?(*(void *)v1, *(void *)(v1 + 8));
  return v2;
}

uint64_t PartialHandshakeResult.sessionTicket.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2 + *(int *)(type metadata accessor for PartialHandshakeResult(0) + 24);
  uint64_t result = outlined consume of ByteBuffer?(*(void *)v5, *(void *)(v5 + 8));
  *(void *)uint64_t v5 = a1;
  *(void *)(v5 + 8) = a2;
  return result;
}

uint64_t (*PartialHandshakeResult.sessionTicket.modify())(void)
{
  return CertificateVerify.algorithm.getter;
}

__n128 PartialHandshakeResult.init()@<Q0>(uint64_t a1@<X8>)
{
  *(_OWORD *)a1 = xmmword_1B577F270;
  *(void *)(a1 + 16) = 0;
  uint64_t v2 = type metadata accessor for PartialHandshakeResult(0);
  uint64_t v3 = a1 + *(int *)(v2 + 20);
  uint64_t v4 = type metadata accessor for PartialHandshakeResult.NewEncryptionLevel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  __n128 result = (__n128)xmmword_1B577F270;
  *(_OWORD *)(a1 + *(int *)(v2 + 24)) = xmmword_1B577F270;
  return result;
}

uint64_t type metadata accessor for PartialHandshakeResult.NewEncryptionLevel(uint64_t a1)
{
  return type metadata accessor for PeerCertificateBundle.Bundle(a1, (uint64_t *)&type metadata singleton initialization cache for PartialHandshakeResult.NewEncryptionLevel);
}

uint64_t *initializeBufferWithCopyOfBuffer for PartialHandshakeResult(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    unint64_t v7 = a2[1];
    if (v7 >> 60 == 15)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }
    else
    {
      uint64_t v9 = *a2;
      outlined copy of Data._Representation(*a2, a2[1]);
      *uint64_t v4 = v9;
      v4[1] = v7;
    }
    v4[2] = a2[2];
    uint64_t v10 = *(int *)(a3 + 20);
    uint64_t v11 = (char *)v4 + v10;
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = type metadata accessor for PartialHandshakeResult.NewEncryptionLevel(0);
    uint64_t v14 = *(void *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PartialHandshakeResult.NewEncryptionLevel?);
      memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
      {
        uint64_t v26 = type metadata accessor for SymmetricKey();
        uint64_t v17 = *(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16);
        v17(v11, v12, v26);
        uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (clientSecret: SymmetricKey, serverSecret: SymmetricKey));
        v17(&v11[*(int *)(v18 + 48)], &v12[*(int *)(v18 + 48)], v26);
      }
      else
      {
        uint64_t v19 = type metadata accessor for SymmetricKey();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v11, v12, v19);
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
    }
    uint64_t v20 = *(int *)(a3 + 24);
    uint64_t v21 = (char *)v4 + v20;
    uint64_t v22 = (char *)a2 + v20;
    unint64_t v23 = *((void *)v22 + 1);
    if (v23 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
    }
    else
    {
      uint64_t v24 = *(void *)v22;
      outlined copy of Data._Representation(*(void *)v22, *((void *)v22 + 1));
      *(void *)uint64_t v21 = v24;
      *((void *)v21 + 1) = v23;
    }
  }
  return v4;
}

uint64_t destroy for PartialHandshakeResult(uint64_t *a1, uint64_t a2)
{
  unint64_t v4 = a1[1];
  if (v4 >> 60 != 15) {
    outlined consume of Data._Representation(*a1, v4);
  }
  int v5 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v6 = type metadata accessor for PartialHandshakeResult.NewEncryptionLevel(0);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 1, v6);
  if (!result)
  {
    uint64_t result = swift_getEnumCaseMultiPayload();
    if (result == 2 || result == 1)
    {
      uint64_t v9 = type metadata accessor for SymmetricKey();
      uint64_t v10 = *(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8);
      v10(v5, v9);
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (clientSecret: SymmetricKey, serverSecret: SymmetricKey));
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v10)(&v5[*(int *)(v11 + 48)], v9);
    }
    else if (!result)
    {
      uint64_t v8 = type metadata accessor for SymmetricKey();
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v5, v8);
    }
  }
  uint64_t v12 = (uint64_t *)((char *)a1 + *(int *)(a2 + 24));
  unint64_t v13 = v12[1];
  if (v13 >> 60 != 15)
  {
    uint64_t v14 = *v12;
    return outlined consume of Data._Representation(v14, v13);
  }
  return result;
}

uint64_t initializeWithCopy for PartialHandshakeResult(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v6 = a2[1];
  if (v6 >> 60 == 15)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    uint64_t v7 = *a2;
    outlined copy of Data._Representation(*a2, a2[1]);
    *(void *)a1 = v7;
    *(void *)(a1 + 8) = v6;
  }
  *(void *)(a1 + 16) = a2[2];
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for PartialHandshakeResult.NewEncryptionLevel(0);
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PartialHandshakeResult.NewEncryptionLevel?);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      uint64_t v24 = type metadata accessor for SymmetricKey();
      uint64_t v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16);
      v15(v9, v10, v24);
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (clientSecret: SymmetricKey, serverSecret: SymmetricKey));
      v15(&v9[*(int *)(v16 + 48)], &v10[*(int *)(v16 + 48)], v24);
    }
    else
    {
      uint64_t v17 = type metadata accessor for SymmetricKey();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v9, v10, v17);
    }
    swift_storeEnumTagMultiPayload();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  uint64_t v18 = *(int *)(a3 + 24);
  uint64_t v19 = a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  unint64_t v21 = *((void *)v20 + 1);
  if (v21 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
  }
  else
  {
    uint64_t v22 = *(void *)v20;
    outlined copy of Data._Representation(*(void *)v20, *((void *)v20 + 1));
    *(void *)uint64_t v19 = v22;
    *(void *)(v19 + 8) = v21;
  }
  return a1;
}

uint64_t assignWithCopy for PartialHandshakeResult(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v6 = a2[1];
  if (*(void *)(a1 + 8) >> 60 == 15)
  {
    if (v6 >> 60 == 15)
    {
      long long v7 = *(_OWORD *)a2;
      *(void *)(a1 + 16) = a2[2];
      *(_OWORD *)a1 = v7;
      goto LABEL_10;
    }
    uint64_t v9 = *a2;
    outlined copy of Data._Representation(*a2, a2[1]);
    *(void *)a1 = v9;
    *(void *)(a1 + 8) = v6;
    goto LABEL_8;
  }
  if (v6 >> 60 != 15)
  {
    uint64_t v10 = *a2;
    outlined copy of Data._Representation(*a2, a2[1]);
    uint64_t v11 = *(void *)a1;
    unint64_t v12 = *(void *)(a1 + 8);
    *(void *)a1 = v10;
    *(void *)(a1 + 8) = v6;
    outlined consume of Data._Representation(v11, v12);
LABEL_8:
    uint64_t v8 = a2[2];
    goto LABEL_9;
  }
  outlined destroy of ByteBuffer(a1);
  uint64_t v8 = a2[2];
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_9:
  *(void *)(a1 + 16) = v8;
LABEL_10:
  uint64_t v13 = *(int *)(a3 + 20);
  uint64_t v14 = (char *)(a1 + v13);
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = type metadata accessor for PartialHandshakeResult.NewEncryptionLevel(0);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48);
  int v19 = v18(v14, 1, v16);
  int v20 = v18(v15, 1, v16);
  if (v19)
  {
    if (!v20)
    {
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
      {
        uint64_t v43 = type metadata accessor for SymmetricKey();
        uint64_t v22 = *(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 16);
        v22(v14, v15, v43);
        uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (clientSecret: SymmetricKey, serverSecret: SymmetricKey));
        v22(&v14[*(int *)(v23 + 48)], &v15[*(int *)(v23 + 48)], v43);
      }
      else
      {
        uint64_t v29 = type metadata accessor for SymmetricKey();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 16))(v14, v15, v29);
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
      goto LABEL_25;
    }
LABEL_17:
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PartialHandshakeResult.NewEncryptionLevel?);
    memcpy(v14, v15, *(void *)(*(void *)(v24 - 8) + 64));
    goto LABEL_25;
  }
  if (v20)
  {
    outlined destroy of PartialHandshakeResult.NewEncryptionLevel((uint64_t)v14);
    goto LABEL_17;
  }
  if ((uint64_t *)a1 != a2)
  {
    outlined destroy of PartialHandshakeResult.NewEncryptionLevel((uint64_t)v14);
    int v25 = swift_getEnumCaseMultiPayload();
    if (v25 == 2)
    {
      uint64_t v39 = type metadata accessor for SymmetricKey();
      unint64_t v40 = *(void (**)(char *, char *, uint64_t))(*(void *)(v39 - 8) + 16);
      v40(v14, v15, v39);
      uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (clientSecret: SymmetricKey, serverSecret: SymmetricKey));
      v40(&v14[*(int *)(v41 + 48)], &v15[*(int *)(v41 + 48)], v39);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      if (v25 == 1)
      {
        uint64_t v26 = type metadata accessor for SymmetricKey();
        uint64_t v27 = *(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16);
        v27(v14, v15, v26);
        uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (clientSecret: SymmetricKey, serverSecret: SymmetricKey));
        v27(&v14[*(int *)(v28 + 48)], &v15[*(int *)(v28 + 48)], v26);
      }
      else
      {
        uint64_t v42 = type metadata accessor for SymmetricKey();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 16))(v14, v15, v42);
      }
      swift_storeEnumTagMultiPayload();
    }
  }
LABEL_25:
  uint64_t v30 = *(int *)(a3 + 24);
  uint64_t v31 = (uint64_t *)(a1 + v30);
  uint64_t v32 = (uint64_t *)((char *)a2 + v30);
  unint64_t v33 = *(uint64_t *)((char *)a2 + v30 + 8);
  if (*(void *)(a1 + v30 + 8) >> 60 != 15)
  {
    if (v33 >> 60 != 15)
    {
      uint64_t v35 = *v32;
      outlined copy of Data._Representation(v35, v33);
      uint64_t v36 = *v31;
      unint64_t v37 = v31[1];
      uint64_t *v31 = v35;
      v31[1] = v33;
      outlined consume of Data._Representation(v36, v37);
      return a1;
    }
    outlined destroy of Data((uint64_t)v31);
    goto LABEL_30;
  }
  if (v33 >> 60 == 15)
  {
LABEL_30:
    *(_OWORD *)uint64_t v31 = *(_OWORD *)v32;
    return a1;
  }
  uint64_t v34 = *v32;
  outlined copy of Data._Representation(v34, v33);
  uint64_t *v31 = v34;
  v31[1] = v33;
  return a1;
}

uint64_t outlined destroy of PartialHandshakeResult.NewEncryptionLevel(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PartialHandshakeResult.NewEncryptionLevel(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined destroy of Data(uint64_t a1)
{
  return a1;
}

uint64_t initializeWithTake for PartialHandshakeResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = *(int *)(a3 + 20);
  long long v7 = (char *)(a1 + v6);
  uint64_t v8 = (char *)(a2 + v6);
  uint64_t v9 = type metadata accessor for PartialHandshakeResult.NewEncryptionLevel(0);
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PartialHandshakeResult.NewEncryptionLevel?);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      uint64_t v17 = type metadata accessor for SymmetricKey();
      uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32);
      v13(v7, v8, v17);
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (clientSecret: SymmetricKey, serverSecret: SymmetricKey));
      v13(&v7[*(int *)(v14 + 48)], &v8[*(int *)(v14 + 48)], v17);
    }
    else
    {
      uint64_t v15 = type metadata accessor for SymmetricKey();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v7, v8, v15);
    }
    swift_storeEnumTagMultiPayload();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for PartialHandshakeResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = *(void *)(a1 + 8);
  if (v6 >> 60 == 15) {
    goto LABEL_4;
  }
  unint64_t v7 = *(void *)(a2 + 8);
  if (v7 >> 60 == 15)
  {
    outlined destroy of ByteBuffer(a1);
LABEL_4:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_6;
  }
  uint64_t v8 = *(void *)a1;
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v7;
  outlined consume of Data._Representation(v8, v6);
LABEL_6:
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (char *)(a1 + v9);
  uint64_t v11 = (char *)(a2 + v9);
  uint64_t v12 = type metadata accessor for PartialHandshakeResult.NewEncryptionLevel(0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (v15)
  {
    if (!v16)
    {
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
      {
        uint64_t v37 = type metadata accessor for SymmetricKey();
        uint64_t v18 = *(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 32);
        v18(v10, v11, v37);
        uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (clientSecret: SymmetricKey, serverSecret: SymmetricKey));
        v18(&v10[*(int *)(v19 + 48)], &v11[*(int *)(v19 + 48)], v37);
      }
      else
      {
        uint64_t v25 = type metadata accessor for SymmetricKey();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 32))(v10, v11, v25);
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
      goto LABEL_21;
    }
LABEL_13:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PartialHandshakeResult.NewEncryptionLevel?);
    memcpy(v10, v11, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_21;
  }
  if (v16)
  {
    outlined destroy of PartialHandshakeResult.NewEncryptionLevel((uint64_t)v10);
    goto LABEL_13;
  }
  if (a1 != a2)
  {
    outlined destroy of PartialHandshakeResult.NewEncryptionLevel((uint64_t)v10);
    int v21 = swift_getEnumCaseMultiPayload();
    if (v21 == 2)
    {
      uint64_t v33 = type metadata accessor for SymmetricKey();
      uint64_t v34 = *(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 32);
      v34(v10, v11, v33);
      uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (clientSecret: SymmetricKey, serverSecret: SymmetricKey));
      v34(&v10[*(int *)(v35 + 48)], &v11[*(int *)(v35 + 48)], v33);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      if (v21 == 1)
      {
        uint64_t v22 = type metadata accessor for SymmetricKey();
        uint64_t v23 = *(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 32);
        v23(v10, v11, v22);
        uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (clientSecret: SymmetricKey, serverSecret: SymmetricKey));
        v23(&v10[*(int *)(v24 + 48)], &v11[*(int *)(v24 + 48)], v22);
      }
      else
      {
        uint64_t v36 = type metadata accessor for SymmetricKey();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 32))(v10, v11, v36);
      }
      swift_storeEnumTagMultiPayload();
    }
  }
LABEL_21:
  uint64_t v26 = *(int *)(a3 + 24);
  uint64_t v27 = (uint64_t *)(a1 + v26);
  uint64_t v28 = (uint64_t *)(a2 + v26);
  unint64_t v29 = *(void *)(a1 + v26 + 8);
  if (v29 >> 60 != 15)
  {
    unint64_t v30 = v28[1];
    if (v30 >> 60 != 15)
    {
      uint64_t v31 = *v27;
      *uint64_t v27 = *v28;
      v27[1] = v30;
      outlined consume of Data._Representation(v31, v29);
      return a1;
    }
    outlined destroy of Data((uint64_t)v27);
  }
  *(_OWORD *)uint64_t v27 = *(_OWORD *)v28;
  return a1;
}

uint64_t getEnumTagSinglePayload for PartialHandshakeResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B577CBD8);
}

uint64_t sub_1B577CBD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 11)
  {
    uint64_t v4 = *(void *)(a1 + 8) >> 60;
    BOOL v5 = ((4 * v4) & 0xC) == 0;
    unsigned int v6 = ((4 * v4) & 0xC | (v4 >> 2)) ^ 0xF;
    if (v5) {
      return 0;
    }
    else {
      return v6;
    }
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PartialHandshakeResult.NewEncryptionLevel?);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for PartialHandshakeResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B577CCA4);
}

void *sub_1B577CCA4(void *result, uint64_t a2, int a3, uint64_t a4)
{
  BOOL v5 = result;
  if (a3 == 11)
  {
    *uint64_t result = 0;
    result[1] = (unint64_t)((~a2 >> 2) & 3 | (4 * ~a2)) << 60;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PartialHandshakeResult.NewEncryptionLevel?);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void type metadata completion function for PartialHandshakeResult()
{
  type metadata accessor for PartialHandshakeResult.NewEncryptionLevel?();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void type metadata accessor for PartialHandshakeResult.NewEncryptionLevel?()
{
  if (!lazy cache variable for type metadata for PartialHandshakeResult.NewEncryptionLevel?)
  {
    type metadata accessor for PartialHandshakeResult.NewEncryptionLevel(255);
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for PartialHandshakeResult.NewEncryptionLevel?);
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for PartialHandshakeResult.NewEncryptionLevel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      uint64_t v7 = type metadata accessor for SymmetricKey();
      uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
      v8(a1, a2, v7);
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (clientSecret: SymmetricKey, serverSecret: SymmetricKey));
      v8((uint64_t *)((char *)a1 + *(int *)(v9 + 48)), (uint64_t *)((char *)a2 + *(int *)(v9 + 48)), v7);
    }
    else
    {
      uint64_t v11 = type metadata accessor for SymmetricKey();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for PartialHandshakeResult.NewEncryptionLevel(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 2 || result == 1)
  {
    uint64_t v7 = type metadata accessor for SymmetricKey();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    ((void (*)(void *__return_ptr, uint64_t, uint64_t))v8)((void *)(v7 - 8), a1, v7);
    uint64_t v6 = a1
       + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (clientSecret: SymmetricKey, serverSecret: SymmetricKey))
                + 48);
    uint64_t v5 = v7;
    uint64_t v4 = v8;
  }
  else
  {
    if (result) {
      return result;
    }
    uint64_t v3 = type metadata accessor for SymmetricKey();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    uint64_t v5 = v3;
    uint64_t v6 = a1;
  }

  return v4(v6, v5);
}

uint64_t initializeWithCopy for PartialHandshakeResult.NewEncryptionLevel(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    uint64_t v5 = type metadata accessor for SymmetricKey();
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
    v6(a1, a2, v5);
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (clientSecret: SymmetricKey, serverSecret: SymmetricKey));
    v6(a1 + *(int *)(v7 + 48), a2 + *(int *)(v7 + 48), v5);
  }
  else
  {
    uint64_t v8 = type metadata accessor for SymmetricKey();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for PartialHandshakeResult.NewEncryptionLevel(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    outlined destroy of PartialHandshakeResult.NewEncryptionLevel(a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      uint64_t v5 = type metadata accessor for SymmetricKey();
      uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
      v6(a1, a2, v5);
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (clientSecret: SymmetricKey, serverSecret: SymmetricKey));
      v6(a1 + *(int *)(v7 + 48), a2 + *(int *)(v7 + 48), v5);
    }
    else
    {
      uint64_t v8 = type metadata accessor for SymmetricKey();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for PartialHandshakeResult.NewEncryptionLevel(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    uint64_t v5 = type metadata accessor for SymmetricKey();
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32);
    v6(a1, a2, v5);
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (clientSecret: SymmetricKey, serverSecret: SymmetricKey));
    v6(a1 + *(int *)(v7 + 48), a2 + *(int *)(v7 + 48), v5);
  }
  else
  {
    uint64_t v8 = type metadata accessor for SymmetricKey();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for PartialHandshakeResult.NewEncryptionLevel(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    outlined destroy of PartialHandshakeResult.NewEncryptionLevel(a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      uint64_t v5 = type metadata accessor for SymmetricKey();
      uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32);
      v6(a1, a2, v5);
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (clientSecret: SymmetricKey, serverSecret: SymmetricKey));
      v6(a1 + *(int *)(v7 + 48), a2 + *(int *)(v7 + 48), v5);
    }
    else
    {
      uint64_t v8 = type metadata accessor for SymmetricKey();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t type metadata completion function for PartialHandshakeResult.NewEncryptionLevel()
{
  uint64_t result = type metadata accessor for SymmetricKey();
  if (v1 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8) + 64;
    swift_getTupleTypeLayout2();
    uint64_t v5 = &v3;
    swift_getTupleTypeLayout2();
    uint64_t v6 = &v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

BOOL static Extension.SupportedVersions.__derived_enum_equals(_:_:)(uint64_t a1, char a2, uint64_t a3, char a4)
{
  if (a2) {
    return (a4 & 1) != 0 && (unsigned __int16)a1 == (unsigned __int16)a3;
  }
  else {
    return (a4 & 1) == 0 && specialized static Array<A>.== infix(_:_:)(a1, a3);
  }
}

uint64_t ByteBuffer.writeSupportedVersions(_:)(uint64_t a1, char a2)
{
  v7[5] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    __int16 v6 = a1;
    _OWORD v7[3] = MEMORY[0x1E4FBB2B8];
    v7[4] = MEMORY[0x1E4F27EF0];
    v7[0] = &v6;
    v7[1] = v7;
    __swift_project_boxed_opaque_existential_1(v7, MEMORY[0x1E4FBB2B8]);
    Data._Representation.append(contentsOf:)();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
    return 2;
  }
  else
  {
    outlined copy of Extension.ServerCertificateType(a1, 0);
    unint64_t v4 = specialized ByteBuffer.writeVariableLengthVector<A>(lengthFieldType:_:)(v2, a1);
    outlined consume of Extension.SupportedVersions(a1, 0);
    return v4;
  }
}

char *ByteBuffer.readSupportedVersions(messageType:)(unsigned __int8 a1)
{
  if (a1 != 1)
  {
    if (a1 != 2)
    {
      int v11 = a1 | 0x2B0000;
      lazy protocol witness table accessor for type TLSError and conformance TLSError();
      swift_allocError();
      *(_DWORD *)uint64_t v12 = v11;
      *(unsigned char *)(v12 + 4) = 0;
      goto LABEL_10;
    }
    unsigned int v3 = specialized ByteBuffer.readInteger<A>(as:)();
    if ((v3 & 0x10000) == 0) {
      return (char *)(bswap32(v3) >> 16);
    }
LABEL_8:
    lazy protocol witness table accessor for type TLSError and conformance TLSError();
    swift_allocError();
    *(_DWORD *)uint64_t v10 = 0;
    *(unsigned char *)(v10 + 4) = 1;
    goto LABEL_10;
  }
  uint64_t v5 = *v1;
  unint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  outlined copy of Data._Representation(*v1, v4);
  __int16 v7 = specialized ByteBuffer.readInteger<A>(as:)();
  if ((v7 & 0x100) != 0 || (uint64_t v31 = ByteBuffer.readSlice(length:)(v7), v8 >> 60 == 15))
  {
    outlined consume of Data._Representation(*v1, v1[1]);
    *unint64_t v1 = v5;
    v1[1] = v4;
    v1[2] = v6;
    goto LABEL_8;
  }
  unint64_t v28 = v4;
  uint64_t v14 = v9;
  uint64_t v15 = 0;
  uint64_t v16 = BYTE6(v8);
  switch(v8 >> 62)
  {
    case 1uLL:
      uint64_t v15 = v31 >> 32;
      break;
    case 2uLL:
      uint64_t v15 = *(void *)(v31 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v15 = BYTE6(v8);
      break;
  }
  unint64_t v29 = v8 >> 62;
  unint64_t v30 = v8;
  BOOL v17 = __OFSUB__(v15, v9);
  uint64_t v18 = v15 - v9;
  if (v17) {
    goto LABEL_42;
  }
  uint64_t v19 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, (v18 / 2) & ~((v18 + (v18 < 0)) >> 63), 0, MEMORY[0x1E4FBC860]);
  uint64_t v20 = v14 + 2;
  if (__OFADD__(v14, 2))
  {
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  char v2 = v19;
  while (2)
  {
    uint64_t v21 = v14;
    uint64_t v14 = v20;
    uint64_t v22 = v16;
    switch((int)v29)
    {
      case 1:
        uint64_t v22 = v31 >> 32;
        goto LABEL_21;
      case 2:
        if (*(void *)(v31 + 24) < v20) {
          goto LABEL_32;
        }
        goto LABEL_26;
      case 3:
        if (v20 < 1) {
          goto LABEL_26;
        }
        uint64_t v16 = 0;
        goto LABEL_36;
      default:
LABEL_21:
        if (v22 >= v20)
        {
LABEL_26:
          if (v20 < v21) {
            goto LABEL_41;
          }
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<Int>);
          lazy protocol witness table accessor for type Data and conformance Data();
          lazy protocol witness table accessor for type Range<Int> and conformance Range<A>();
          DataProtocol.copyBytes<A>(to:from:)();
          unint64_t v24 = *((void *)v2 + 2);
          unint64_t v23 = *((void *)v2 + 3);
          if (v24 >= v23 >> 1) {
            char v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v23 > 1), v24 + 1, 1, v2);
          }
          unsigned int v25 = bswap32(0) >> 16;
          *((void *)v2 + 2) = v24 + 1;
          uint64_t v26 = &v2[2 * v24];
          v26[32] = BYTE1(v25);
          v26[33] = v25;
          BOOL v17 = __OFADD__(v20, 2);
          v20 += 2;
          if (v17) {
            goto LABEL_40;
          }
          continue;
        }
LABEL_32:
        if (v29)
        {
          uint64_t v16 = v31 >> 32;
          if (v29 != 1) {
            uint64_t v16 = *(void *)(v31 + 24);
          }
        }
LABEL_36:
        if (__OFSUB__(v16, v21)) {
LABEL_43:
        }
          __break(1u);
        if (v16 == v21)
        {
          outlined consume of ByteBuffer?(v31, v30);
          outlined consume of Data._Representation(v5, v28);
        }
        else
        {
          lazy protocol witness table accessor for type TLSError and conformance TLSError();
          swift_allocError();
          *(_DWORD *)uint64_t v27 = 1;
          *(unsigned char *)(v27 + 4) = 1;
          swift_willThrow();
          swift_bridgeObjectRelease();
          outlined consume of Data._Representation(v31, v30);
          outlined consume of Data._Representation(*v1, v1[1]);
          *unint64_t v1 = v5;
          v1[1] = v28;
          v1[2] = v6;
LABEL_10:
          swift_willThrow();
        }
        return v2;
    }
  }
}

void Extension.SupportedVersions.hash(into:)(uint64_t a1, uint64_t a2, char a3)
{
  if (a3)
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(a2);
    Hasher._combine(_:)(BYTE1(a2));
  }
  else
  {
    Hasher._combine(_:)(0);
    Swift::UInt v4 = *(void *)(a2 + 16);
    Hasher._combine(_:)(v4);
    if (v4)
    {
      uint64_t v5 = (Swift::UInt8 *)(a2 + 33);
      do
      {
        Swift::UInt8 v6 = *(v5 - 1);
        Swift::UInt8 v7 = *v5;
        v5 += 2;
        Hasher._combine(_:)(v6);
        Hasher._combine(_:)(v7);
        --v4;
      }
      while (v4);
    }
  }
}

Swift::Int Extension.SupportedVersions.hashValue.getter(uint64_t a1, char a2)
{
  char v3 = a2 & 1;
  Hasher.init(_seed:)();
  Extension.SupportedVersions.hash(into:)((uint64_t)v5, a1, v3);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Extension.SupportedVersions()
{
  uint64_t v1 = *(void *)v0;
  char v2 = *(unsigned char *)(v0 + 8);
  Hasher.init(_seed:)();
  Extension.SupportedVersions.hash(into:)((uint64_t)v4, v1, v2);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance Extension.SupportedVersions(uint64_t a1)
{
  Extension.SupportedVersions.hash(into:)(a1, *(void *)v1, *(unsigned char *)(v1 + 8));
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Extension.SupportedVersions()
{
  uint64_t v1 = *(void *)v0;
  char v2 = *(unsigned char *)(v0 + 8);
  Hasher.init(_seed:)();
  Extension.SupportedVersions.hash(into:)((uint64_t)v4, v1, v2);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance Extension.SupportedVersions(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)a2;
  char v6 = *(unsigned char *)(a2 + 8);
  if (*(unsigned char *)(a1 + 8)) {
    return (v6 & 1) != 0 && (unsigned __int16)v4 == (unsigned __int16)v5;
  }
  else {
    return (v6 & 1) == 0 && specialized static Array<A>.== infix(_:_:)(v4, v5);
  }
}

unint64_t lazy protocol witness table accessor for type Extension.SupportedVersions and conformance Extension.SupportedVersions()
{
  unint64_t result = lazy protocol witness table cache variable for type Extension.SupportedVersions and conformance Extension.SupportedVersions;
  if (!lazy protocol witness table cache variable for type Extension.SupportedVersions and conformance Extension.SupportedVersions)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Extension.SupportedVersions and conformance Extension.SupportedVersions);
  }
  return result;
}

ValueMetadata *type metadata accessor for Extension.SupportedVersions()
{
  return &type metadata for Extension.SupportedVersions;
}

uint64_t SwiftTLSDefaultClock.now()()
{
  return MEMORY[0x1F40E5378]();
}

ValueMetadata *type metadata accessor for SwiftTLSDefaultClock()
{
  return &type metadata for SwiftTLSDefaultClock;
}

void nwswifttls_get_encryption_level_cold_1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_1B56C5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Invalid encryption level", v0, 2u);
}

uint64_t DataProtocol.copyBytes<A>(to:from:)()
{
  return MEMORY[0x1F40E3450]();
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return MEMORY[0x1F40E37C0]();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return MEMORY[0x1F40E37D0]();
}

uint64_t __DataStorage._bytes.getter()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t __DataStorage.init(length:)()
{
  return MEMORY[0x1F40E37F0]();
}

uint64_t __DataStorage._length.getter()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t __DataStorage._offset.getter()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t type metadata accessor for __DataStorage()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x1F40E3B70]();
}

uint64_t NSFastEnumerationIterator.next()()
{
  return MEMORY[0x1F40E46B8]();
}

uint64_t type metadata accessor for NSFastEnumerationIterator()
{
  return MEMORY[0x1F40E46D0]();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
}

Swift::Void __swiftcall Data.InlineSlice.ensureUniqueReference()()
{
}

uint64_t Data._copyContents(initializing:)()
{
  return MEMORY[0x1F40E4C58]();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return MEMORY[0x1F40E4C80]();
}

uint64_t Data._Representation.resetBytes(in:)()
{
  return MEMORY[0x1F40E4CA0]();
}

uint64_t Data._Representation.replaceSubrange(_:with:count:)()
{
  return MEMORY[0x1F40E4CA8]();
}

uint64_t Data._Representation.append(contentsOf:)()
{
  return MEMORY[0x1F40E4CD8]();
}

uint64_t Data._Representation.subscript.getter()
{
  return MEMORY[0x1F40E4CF8]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x1F40E4D48]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t Data.hash(into:)()
{
  return MEMORY[0x1F40E4DB8]();
}

uint64_t Data.append<A>(contentsOf:)()
{
  return MEMORY[0x1F40E4E20]();
}

uint64_t Data.append(_:)()
{
  return MEMORY[0x1F40E4E30]();
}

uint64_t type metadata accessor for Data.Iterator()
{
  return MEMORY[0x1F40E4E60]();
}

uint64_t Data.Iterator.init(_:at:)()
{
  return MEMORY[0x1F40E4E70]();
}

uint64_t Data.init<A>(_:)()
{
  return MEMORY[0x1F40E4EB8]();
}

uint64_t Date.init(timeIntervalSinceReferenceDate:)()
{
  return MEMORY[0x1F40E4ED0]();
}

uint64_t Date.timeIntervalSinceReferenceDate.getter()
{
  return MEMORY[0x1F40E4EE0]();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return MEMORY[0x1F40E50E0]();
}

uint64_t Date.addingTimeInterval(_:)()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t static Date.< infix(_:_:)()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t static Date.== infix(_:_:)()
{
  return MEMORY[0x1F40E52C0]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x1F4188670]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x1F4188680]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t Curve25519.KeyAgreement.PrivateKey.init()()
{
  return MEMORY[0x1F40DFED8]();
}

uint64_t dispatch thunk of HashFunction.update(bufferPointer:)()
{
  return MEMORY[0x1F40DFF38]();
}

uint64_t dispatch thunk of HashFunction.finalize()()
{
  return MEMORY[0x1F40DFF40]();
}

uint64_t static HashFunction.hash<A>(data:)()
{
  return MEMORY[0x1F40DFF48]();
}

uint64_t HashFunction.update<A>(data:)()
{
  return MEMORY[0x1F40DFF50]();
}

uint64_t dispatch thunk of HashFunction.init()()
{
  return MEMORY[0x1F40DFF58]();
}

uint64_t type metadata accessor for SHA384Digest()
{
  return MEMORY[0x1F40DFF80]();
}

uint64_t type metadata accessor for SharedSecret()
{
  return MEMORY[0x1F40DFFA8]();
}

uint64_t SymmetricKey.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x1F40DFFB0]();
}

uint64_t static SymmetricKey.== infix(_:_:)()
{
  return MEMORY[0x1F40DFFB8]();
}

uint64_t SymmetricKey.init<A>(data:)()
{
  return MEMORY[0x1F40DFFC0]();
}

uint64_t type metadata accessor for SymmetricKey()
{
  return MEMORY[0x1F40DFFD8]();
}

uint64_t type metadata accessor for HashedAuthenticationCode()
{
  return MEMORY[0x1F40E0018]();
}

uint64_t static MessageAuthenticationCode.== infix<A>(_:_:)()
{
  return MEMORY[0x1F40E0020]();
}

uint64_t static HKDF.expand<A, B>(pseudoRandomKey:info:outputByteCount:)()
{
  return MEMORY[0x1F40E00E0]();
}

uint64_t static HKDF.extract<A>(inputKeyMaterial:salt:)()
{
  return MEMORY[0x1F40E00E8]();
}

uint64_t static HMAC.authenticationCode<A>(for:using:)()
{
  return MEMORY[0x1F40E0100]();
}

uint64_t P256.Signing.ECDSASignature.init<A>(derRepresentation:)()
{
  return MEMORY[0x1F40E0248]();
}

uint64_t type metadata accessor for P256.Signing.ECDSASignature()
{
  return MEMORY[0x1F40E0260]();
}

uint64_t P256.Signing.PublicKey.isValidSignature<A>(_:for:)()
{
  return MEMORY[0x1F40E0268]();
}

uint64_t P256.Signing.PublicKey.init<A>(derRepresentation:)()
{
  return MEMORY[0x1F40E0278]();
}

uint64_t P256.Signing.PublicKey.rawRepresentation.getter()
{
  return MEMORY[0x1F40E0280]();
}

uint64_t P256.Signing.PublicKey.init<A>(rawRepresentation:)()
{
  return MEMORY[0x1F40E0288]();
}

uint64_t P256.Signing.PublicKey.init<A>(x963Representation:)()
{
  return MEMORY[0x1F40E0298]();
}

uint64_t type metadata accessor for P256.Signing.PublicKey()
{
  return MEMORY[0x1F40E02A0]();
}

uint64_t P384.KeyAgreement.PrivateKey.init()()
{
  return MEMORY[0x1F40E02F0]();
}

uint64_t dispatch thunk of static Digest.byteCount.getter()
{
  return MEMORY[0x1F40E0470]();
}

uint64_t type metadata accessor for SHA384()
{
  return MEMORY[0x1F40E04B0]();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return MEMORY[0x1F4183740]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x1F4183880]();
}

uint64_t static String._fromUTF8Repairing(_:)()
{
  return MEMORY[0x1F4183950]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x1F41839B0]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t String.init<A>(_:radix:uppercase:)()
{
  return MEMORY[0x1F4183B50]();
}

uint64_t Sequence<>.contains(_:)()
{
  return MEMORY[0x1F4183CE0]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x1F40E6338]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x1F4188700]();
}

uint64_t NSArray.makeIterator()()
{
  return MEMORY[0x1F40E6840]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x1F4184640]();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t UnsafeMutableRawBufferPointer.copyBytes<A>(from:)()
{
  return MEMORY[0x1F4184800]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x1F4184820]();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)()
{
  return MEMORY[0x1F41848C0]();
}

uint64_t dispatch thunk of BinaryInteger._lowWord.getter()
{
  return MEMORY[0x1F4184938]();
}

uint64_t dispatch thunk of BinaryInteger.bitWidth.getter()
{
  return MEMORY[0x1F4184940]();
}

uint64_t dispatch thunk of static BinaryInteger.isSigned.getter()
{
  return MEMORY[0x1F4184950]();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(_:)()
{
  return MEMORY[0x1F4184970]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x1F4184C98]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t dispatch thunk of static FixedWidthInteger.bitWidth.getter()
{
  return MEMORY[0x1F41850E0]();
}

uint64_t dispatch thunk of FixedWidthInteger.bigEndian.getter()
{
  return MEMORY[0x1F4185128]();
}

uint64_t dispatch thunk of FixedWidthInteger.init(bigEndian:)()
{
  return MEMORY[0x1F4185130]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1F4185298]();
}

uint64_t dispatch thunk of static AdditiveArithmetic.zero.getter()
{
  return MEMORY[0x1F41852E0]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x1F4185398]();
}

uint64_t dispatch thunk of _HasContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x1F41853B0]();
}

uint64_t dispatch thunk of _HasContiguousBytes._providesContiguousBytesNoCopy.getter()
{
  return MEMORY[0x1F41853B8]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x1F4185758]();
}

uint64_t dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)()
{
  return MEMORY[0x1F4185A20]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)()
{
  return MEMORY[0x1F4185D58]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t Slice<>.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x1F40E6E70]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x1F4185EB0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt16 a1)
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
  return MEMORY[0x1F4185EF8]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1F40D7178](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFRelease(CFTypeRef cf)
{
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x1F40F6B10](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1F40F6B80](allocator, data);
}

uint64_t SecKeyCopyPublicBytes()
{
  return MEMORY[0x1F40F6E60]();
}

uint64_t SecPolicyCreateSSLWithKeyUsage()
{
  return MEMORY[0x1F40F7090]();
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x1F40F71E0](certificates, policies, trust);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cc_clear()
{
  return MEMORY[0x1F40CA6A0]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

uint64_t nw_array_append()
{
  return MEMORY[0x1F40F2928]();
}

uint64_t nw_array_create()
{
  return MEMORY[0x1F40F2938]();
}

char *__cdecl nw_endpoint_copy_address_string(nw_endpoint_t endpoint)
{
  return (char *)MEMORY[0x1F40F2E38](endpoint);
}

uint64_t nw_endpoint_copy_parent_endpoint()
{
  return MEMORY[0x1F40F2E68]();
}

uint64_t nw_endpoint_copy_proxy_original_endpoint()
{
  return MEMORY[0x1F40F2E78]();
}

uint64_t nw_endpoint_get_bonjour_fullname()
{
  return MEMORY[0x1F40F2ED8]();
}

const char *__cdecl nw_endpoint_get_hostname(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x1F40F2F08](endpoint);
}

uint64_t nw_endpoint_get_parent_endpoint_domain()
{
  return MEMORY[0x1F40F2F18]();
}

uint64_t nw_endpoint_get_srv_name()
{
  return MEMORY[0x1F40F2F30]();
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return MEMORY[0x1F40F2F38](endpoint);
}

uint64_t nw_frame_array_append()
{
  return MEMORY[0x1F40F2FD0]();
}

uint64_t nw_frame_array_first()
{
  return MEMORY[0x1F40F2FE0]();
}

uint64_t nw_frame_array_foreach()
{
  return MEMORY[0x1F40F2FE8]();
}

uint64_t nw_frame_array_init()
{
  return MEMORY[0x1F40F3000]();
}

uint64_t nw_frame_array_is_empty()
{
  return MEMORY[0x1F40F3010]();
}

uint64_t nw_frame_array_remove()
{
  return MEMORY[0x1F40F3030]();
}

uint64_t nw_frame_claim()
{
  return MEMORY[0x1F40F3050]();
}

uint64_t nw_frame_collapse()
{
  return MEMORY[0x1F40F3058]();
}

uint64_t nw_frame_finalize()
{
  return MEMORY[0x1F40F3078]();
}

uint64_t nw_frame_unclaim()
{
  return MEMORY[0x1F40F30D8]();
}

uint64_t nw_frame_unclaimed_bytes()
{
  return MEMORY[0x1F40F30F0]();
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return (nw_protocol_stack_t)MEMORY[0x1F40F3418](parameters);
}

uint64_t nw_parameters_copy_protocol_options_legacy()
{
  return MEMORY[0x1F40F3468]();
}

uint64_t nw_parameters_get_enable_tls_keylog()
{
  return MEMORY[0x1F40F3508]();
}

uint64_t nw_parameters_get_server_mode()
{
  return MEMORY[0x1F40F3550]();
}

uint64_t nw_protocol_copy_quic_connection_definition()
{
  return MEMORY[0x1F40F3A28]();
}

uint64_t nw_protocol_copy_quic_stream_definition()
{
  return MEMORY[0x1F40F3A38]();
}

uint64_t nw_protocol_copy_swift_tls_definition()
{
  return MEMORY[0x1F40F3A48]();
}

nw_protocol_definition_t nw_protocol_copy_tcp_definition(void)
{
  return (nw_protocol_definition_t)MEMORY[0x1F40F3A50]();
}

uint64_t nw_protocol_definition_create_with_identifier()
{
  return MEMORY[0x1F40F3A78]();
}

BOOL nw_protocol_definition_is_equal(nw_protocol_definition_t definition1, nw_protocol_definition_t definition2)
{
  return MEMORY[0x1F40F3A88](definition1, definition2);
}

uint64_t nw_protocol_definition_set_options_allocator()
{
  return MEMORY[0x1F40F3AA0]();
}

uint64_t nw_protocol_definition_set_options_comparator()
{
  return MEMORY[0x1F40F3AA8]();
}

uint64_t nw_protocol_definition_set_options_equality_check()
{
  return MEMORY[0x1F40F3AB0]();
}

uint64_t nw_protocol_metadata_access_handle()
{
  return MEMORY[0x1F40F3AD8]();
}

uint64_t nw_protocol_metadata_create_singleton()
{
  return MEMORY[0x1F40F3AE0]();
}

uint64_t nw_protocol_options_access_handle()
{
  return MEMORY[0x1F40F3AF8]();
}

nw_protocol_definition_t nw_protocol_options_copy_definition(nw_protocol_options_t options)
{
  return (nw_protocol_definition_t)MEMORY[0x1F40F3B00](options);
}

uint64_t nw_protocol_set_default_one_to_one_callbacks()
{
  return MEMORY[0x1F40F3B40]();
}

uint64_t nw_protocol_stack_copy_original_proxied_transport_protocol()
{
  return MEMORY[0x1F40F3B60]();
}

nw_protocol_options_t nw_protocol_stack_copy_transport_protocol(nw_protocol_stack_t stack)
{
  return (nw_protocol_options_t)MEMORY[0x1F40F3B68](stack);
}

sec_protocol_metadata_t nw_tls_copy_sec_protocol_metadata(nw_protocol_metadata_t metadata)
{
  return (sec_protocol_metadata_t)MEMORY[0x1F40F3F50](metadata);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1F40CD630]();
}

sec_trust_t sec_trust_create(SecTrustRef trust)
{
  return (sec_trust_t)MEMORY[0x1F40F75C8](trust);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1F41866A0]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1F41867B0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1F40CEA18](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1F40CEA90](xarray, index);
}

uint64_t xpc_array_get_uint64(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x1F40CEA98](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1F40CEAA8](xarray, index);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1F40CED00](object);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1F40CF330](xuint);
}