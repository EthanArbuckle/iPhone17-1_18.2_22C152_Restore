@interface Gpvs7B00ytMM3bTs
- (Gpvs7B00ytMM3bTs)initWithdEyUJuqYjUufZYGN:(id)a3 Po0NnEfbQHpSgzj7:(id)a4 jHoy3L8RogTTbjjB:(_yo6ptGgiZw8VbWk1 *)a5 X5iUjoUzZPsj1b68:(int64_t)a6;
- (Hc1u6WJuVM53BcQE)kernelInfoEvaluator;
- (KII4PpQSDEXNXgDb)smoothFunctionEvaluator;
- (PGiTJtLgUnKcxckL)bindingsEvaluator;
- (id)rk4Hn364TkSyMq2q:(unsigned int)a3 version:(unsigned int)a4;
@end

@implementation Gpvs7B00ytMM3bTs

- (Gpvs7B00ytMM3bTs)initWithdEyUJuqYjUufZYGN:(id)a3 Po0NnEfbQHpSgzj7:(id)a4 jHoy3L8RogTTbjjB:(_yo6ptGgiZw8VbWk1 *)a5 X5iUjoUzZPsj1b68:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  v20.receiver = self;
  v20.super_class = (Class)Gpvs7B00ytMM3bTs;
  v12 = [(Gpvs7B00ytMM3bTs *)&v20 init];
  if (v12)
  {
    v13 = [[PGiTJtLgUnKcxckL alloc] initWithdEyUJuqYjUufZYGN:v10];
    bindingsEvaluator = v12->_bindingsEvaluator;
    v12->_bindingsEvaluator = v13;

    v15 = [[Hc1u6WJuVM53BcQE alloc] initWithdEyUJuqYjUufZYGN:v11];
    kernelInfoEvaluator = v12->_kernelInfoEvaluator;
    v12->_kernelInfoEvaluator = v15;

    v17 = [[KII4PpQSDEXNXgDb alloc] initWithSmoothFunctions:a5 X5iUjoUzZPsj1b68:a6];
    smoothFunctionEvaluator = v12->_smoothFunctionEvaluator;
    v12->_smoothFunctionEvaluator = v17;
  }
  return v12;
}

- (id)rk4Hn364TkSyMq2q:(unsigned int)a3 version:(unsigned int)a4
{
  switch(a3)
  {
    case 0u:
      v4 = [(Gpvs7B00ytMM3bTs *)self bindingsEvaluator];
      break;
    case 1u:
      v5 = LXKFKpCcpHk2mY6n;
      goto LABEL_34;
    case 2u:
      v5 = Sby7psiLlGm5MLDx;
      goto LABEL_34;
    case 3u:
      v5 = AHhsu4ZRdIKDtY02;
      goto LABEL_34;
    case 4u:
      v5 = LazRaN3HgWYPPpKq;
      goto LABEL_34;
    case 5u:
      v5 = FPteRld7NoAzBRMo;
      goto LABEL_34;
    case 6u:
      v5 = Jc1OiXBj3TZTX6fS;
      goto LABEL_34;
    case 7u:
      v5 = LLPrncEYq6on80YB;
      goto LABEL_34;
    case 8u:
      v5 = RIBdWx6IE2Tv357l;
      goto LABEL_34;
    case 9u:
      v4 = [(Gpvs7B00ytMM3bTs *)self kernelInfoEvaluator];
      break;
    case 0xAu:
      v5 = Y1qhGFeay19f76Cw;
      goto LABEL_34;
    case 0xBu:
      v5 = VkXK63cfqO3KtJwc;
      goto LABEL_34;
    case 0xCu:
      v5 = T8eR4ZNlOH8wZjTp;
      goto LABEL_34;
    case 0xEu:
      v5 = LW1stJEQ13Gby8hG;
      goto LABEL_34;
    case 0xFu:
      v5 = IJ2i1jyVHK2GU5Sj;
      goto LABEL_34;
    case 0x10u:
      v5 = A8dT9hzXgBYw0xH1;
      goto LABEL_34;
    case 0x12u:
      v5 = Cb88V9Z9PGLm1XBw;
      goto LABEL_34;
    case 0x13u:
      v5 = BH7wjfNixdWGvjfQ;
      goto LABEL_34;
    case 0x14u:
      v5 = SUdYIiwa8PrJA4HA;
      goto LABEL_34;
    case 0x17u:
      v5 = NRGBoLhNmnH8JrxA;
      goto LABEL_34;
    case 0x18u:
      v5 = FroFlbyYlUw5zsSg;
      goto LABEL_34;
    case 0x19u:
      v5 = GQdxG3xjQCtxhh8w;
      goto LABEL_34;
    case 0x1Au:
      v5 = FdvTdusyTLSA8Wsh;
      goto LABEL_34;
    case 0x1Bu:
      v5 = NDFRjmNSzUL5yu9I;
      goto LABEL_34;
    case 0x1Du:
      v5 = HK6sPflgQIpvwaiG;
      goto LABEL_34;
    case 0x1Eu:
      v5 = CzGuHdtgzKnYoucr;
      goto LABEL_34;
    case 0x1Fu:
      v5 = NiJVUDlOmidQPPQl;
      goto LABEL_34;
    case 0x20u:
      v5 = AaZDqQVspOsBOmNU;
      goto LABEL_34;
    case 0x21u:
      v5 = ZC5UHnWnOtc38V53;
      goto LABEL_34;
    case 0x22u:
      v5 = NeKgVVgVwvD6Xs2O;
      goto LABEL_34;
    case 0x23u:
      v5 = NIEyYkb5fUSqW222;
LABEL_34:
      v4 = (LnikKUnLg4pTiUUG *)objc_alloc_init(v5);
      break;
    default:
      v4 = [[LnikKUnLg4pTiUUG alloc] initWithType:*(void *)&a3];
      break;
  }

  return v4;
}

- (PGiTJtLgUnKcxckL)bindingsEvaluator
{
  return self->_bindingsEvaluator;
}

- (Hc1u6WJuVM53BcQE)kernelInfoEvaluator
{
  return self->_kernelInfoEvaluator;
}

- (KII4PpQSDEXNXgDb)smoothFunctionEvaluator
{
  return self->_smoothFunctionEvaluator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smoothFunctionEvaluator, 0);
  objc_storeStrong((id *)&self->_kernelInfoEvaluator, 0);

  objc_storeStrong((id *)&self->_bindingsEvaluator, 0);
}

@end