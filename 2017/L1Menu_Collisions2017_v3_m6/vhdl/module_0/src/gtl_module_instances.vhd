-- ========================================================
-- from VHDL producer:

-- Module ID: 0

-- Name of L1 Trigger Menu:
-- L1Menu_Collisions2017_v3

-- Unique ID of L1 Trigger Menu:
-- 03973478-d11d-4cea-a950-3da1ab12af5e

-- Unique ID of firmware implementation:
-- bf4bfc65-9d4c-4074-8054-cefe91c0eba5

-- Scale set:
-- scales_2017_05_23

-- VHDL producer version
-- v2.1.1

-- External condition assignment
    single_ext_10333571492942459780 <= ext_cond_bx_0(12); -- single_ext_10333571492942459780
    single_ext_10333571493479462268 <= ext_cond_bx_0(20); -- single_ext_10333571493479462268
    single_ext_1189548080491112364 <= ext_cond_bx_0(4); -- single_ext_1189548080491112364
    single_ext_15141600570663550655 <= ext_cond_bx_0(18); -- single_ext_15141600570663550655
    single_ext_17417807877912935668 <= ext_cond_bx_0(11); -- single_ext_17417807877912935668
    single_ext_6102798787913160053 <= ext_cond_bx_0(33); -- single_ext_6102798787913160053
    single_ext_6102798788181595509 <= ext_cond_bx_0(34); -- single_ext_6102798788181595509
    single_ext_6102799243448260461 <= ext_cond_bx_0(7); -- single_ext_6102799243448260461
    single_ext_6394990348257196279 <= ext_cond_bx_0(32); -- single_ext_6394990348257196279
    single_ext_6909925150529645277 <= ext_cond_bx_p1(7); -- single_ext_6909925150529645277
    single_ext_6909925150529645533 <= ext_cond_bx_m1(7); -- single_ext_6909925150529645533
    single_ext_866206786138065236 <= ext_cond_bx_0(1); -- single_ext_866206786138065236
    single_ext_9945386644737729380 <= ext_cond_bx_0(17); -- single_ext_9945386644737729380
    single_ext_9960888781443116569 <= ext_cond_bx_0(3); -- single_ext_9960888781443116569
-- Instantiations of muon charge correlations - only once for a certain Bx combination, if there is at least one DoubleMuon, TripleMuon, QuadMuon condition
-- or muon-muon correlation condition.
    muon_charge_correlations_bx_m1_bx_0_i: entity work.muon_charge_correlations
	port map(mu_bx_m1, mu_bx_0,
	    ls_charcorr_double_bx_m1_bx_0, os_charcorr_double_bx_m1_bx_0,
	    ls_charcorr_triple_bx_m1_bx_0, os_charcorr_triple_bx_m1_bx_0,
	    ls_charcorr_quad_bx_m1_bx_0, os_charcorr_quad_bx_m1_bx_0);
    muon_charge_correlations_bx_0_bx_0_i: entity work.muon_charge_correlations
	port map(mu_bx_0, mu_bx_0,
	    ls_charcorr_double_bx_0_bx_0, os_charcorr_double_bx_0_bx_0,
	    ls_charcorr_triple_bx_0_bx_0, os_charcorr_triple_bx_0_bx_0,
	    ls_charcorr_quad_bx_0_bx_0, os_charcorr_quad_bx_0_bx_0);

-- Instantiations of eta and phi conversion to muon scale for calo-muon and muon-esums correlation conditions (used for DETA, DPHI, DR and mass) - once for every calo ObjectType in certain Bx used in correlation conditions
    jet_conv_2_muon_bx_0_l: for i in 0 to NR_JET_OBJECTS-1 generate
	jet_eta_conv_2_muon_eta_integer_bx_0(i) <= JET_ETA_CONV_2_MUON_ETA_LUT(CONV_INTEGER(jet_bx_0(i)(D_S_I_JET_V2.eta_high downto D_S_I_JET_V2.eta_low)));
	jet_phi_conv_2_muon_phi_integer_bx_0(i) <= JET_PHI_CONV_2_MUON_PHI_LUT(CONV_INTEGER(jet_bx_0(i)(D_S_I_JET_V2.phi_high downto D_S_I_JET_V2.phi_low)));
    end generate jet_conv_2_muon_bx_0_l;

-- Instantiations of pt, eta, phi, cos-phi and sin-phi for correlation conditions (used for DETA, DPHI, DR, mass, overlap_remover and b_tagging) - once for every ObjectType in certain Bx used in correlation conditions
    mu_data_bx_0_l: for i in 0 to NR_MU_OBJECTS-1 generate
	mu_pt_vector_bx_0(i)(MU_PT_VECTOR_WIDTH-1 downto 0) <= CONV_STD_LOGIC_VECTOR(MU_PT_LUT(CONV_INTEGER(mu_bx_0(i)(D_S_I_MU_V2.pt_high downto D_S_I_MU_V2.pt_low))), MU_PT_VECTOR_WIDTH);
	mu_eta_integer_bx_0(i) <= CONV_INTEGER(signed(mu_bx_0(i)(D_S_I_MU_V2.eta_high downto D_S_I_MU_V2.eta_low)));
	mu_phi_integer_bx_0(i) <= CONV_INTEGER(mu_bx_0(i)(D_S_I_MU_V2.phi_high downto D_S_I_MU_V2.phi_low));
	mu_cos_phi_bx_0(i) <= MUON_COS_PHI_LUT(CONV_INTEGER(mu_bx_0(i)(D_S_I_MU_V2.phi_high downto D_S_I_MU_V2.phi_low)));
	mu_sin_phi_bx_0(i) <= MUON_SIN_PHI_LUT(CONV_INTEGER(mu_bx_0(i)(D_S_I_MU_V2.phi_high downto D_S_I_MU_V2.phi_low)));
    end generate mu_data_bx_0_l;
    eg_data_bx_0_l: for i in 0 to NR_EG_OBJECTS-1 generate
	eg_pt_vector_bx_0(i)(EG_PT_VECTOR_WIDTH-1 downto 0) <= CONV_STD_LOGIC_VECTOR(EG_PT_LUT(CONV_INTEGER(eg_bx_0(i)(D_S_I_EG_V2.et_high downto D_S_I_EG_V2.et_low))), EG_PT_VECTOR_WIDTH);
	eg_eta_integer_bx_0(i) <= CONV_INTEGER(signed(eg_bx_0(i)(D_S_I_EG_V2.eta_high downto D_S_I_EG_V2.eta_low)));
	eg_phi_integer_bx_0(i) <= CONV_INTEGER(eg_bx_0(i)(D_S_I_EG_V2.phi_high downto D_S_I_EG_V2.phi_low));
	eg_cos_phi_bx_0(i) <= CALO_COS_PHI_LUT(CONV_INTEGER(eg_bx_0(i)(D_S_I_EG_V2.phi_high downto D_S_I_EG_V2.phi_low)));
	eg_sin_phi_bx_0(i) <= CALO_SIN_PHI_LUT(CONV_INTEGER(eg_bx_0(i)(D_S_I_EG_V2.phi_high downto D_S_I_EG_V2.phi_low)));
	conv_eg_cos_phi_bx_0(i) <= MUON_COS_PHI_LUT(eg_phi_conv_2_muon_phi_integer_bx_0(i));
	conv_eg_sin_phi_bx_0(i) <= MUON_SIN_PHI_LUT(eg_phi_conv_2_muon_phi_integer_bx_0(i));
    end generate eg_data_bx_0_l;
    tau_data_bx_0_l: for i in 0 to NR_TAU_OBJECTS-1 generate
	tau_pt_vector_bx_0(i)(TAU_PT_VECTOR_WIDTH-1 downto 0) <= CONV_STD_LOGIC_VECTOR(TAU_PT_LUT(CONV_INTEGER(tau_bx_0(i)(D_S_I_TAU_V2.et_high downto D_S_I_TAU_V2.et_low))), TAU_PT_VECTOR_WIDTH);
	tau_eta_integer_bx_0(i) <= CONV_INTEGER(signed(tau_bx_0(i)(D_S_I_TAU_V2.eta_high downto D_S_I_TAU_V2.eta_low)));
	tau_phi_integer_bx_0(i) <= CONV_INTEGER(tau_bx_0(i)(D_S_I_TAU_V2.phi_high downto D_S_I_TAU_V2.phi_low));
	tau_cos_phi_bx_0(i) <= CALO_COS_PHI_LUT(CONV_INTEGER(tau_bx_0(i)(D_S_I_TAU_V2.phi_high downto D_S_I_TAU_V2.phi_low)));
	tau_sin_phi_bx_0(i) <= CALO_SIN_PHI_LUT(CONV_INTEGER(tau_bx_0(i)(D_S_I_TAU_V2.phi_high downto D_S_I_TAU_V2.phi_low)));
	conv_tau_cos_phi_bx_0(i) <= MUON_COS_PHI_LUT(tau_phi_conv_2_muon_phi_integer_bx_0(i));
	conv_tau_sin_phi_bx_0(i) <= MUON_SIN_PHI_LUT(tau_phi_conv_2_muon_phi_integer_bx_0(i));
    end generate tau_data_bx_0_l;
    etm_data_bx_0_l: for i in 0 to NR_ETM_OBJECTS-1 generate
	etm_pt_vector_bx_0(0)(ETM_PT_VECTOR_WIDTH-1 downto 0) <= CONV_STD_LOGIC_VECTOR(ETM_PT_LUT(CONV_INTEGER(etm_bx_0(D_S_I_ETM_V2.et_high downto D_S_I_ETM_V2.et_low))), ETM_PT_VECTOR_WIDTH);
	etm_phi_integer_bx_0(0) <= CONV_INTEGER(etm_bx_0(D_S_I_ETM_V2.phi_high downto D_S_I_ETM_V2.phi_low));
	etm_cos_phi_bx_0(0) <= CALO_COS_PHI_LUT(CONV_INTEGER(etm_bx_0(D_S_I_ETM_V2.phi_high downto D_S_I_ETM_V2.phi_low)));
	etm_sin_phi_bx_0(0) <= CALO_SIN_PHI_LUT(CONV_INTEGER(etm_bx_0(D_S_I_ETM_V2.phi_high downto D_S_I_ETM_V2.phi_low)));
	conv_etm_cos_phi_bx_0(0) <= MUON_COS_PHI_LUT(etm_phi_conv_2_muon_phi_integer_bx_0(0));
	conv_etm_sin_phi_bx_0(0) <= MUON_SIN_PHI_LUT(etm_phi_conv_2_muon_phi_integer_bx_0(0));
    end generate etm_data_bx_0_l;
    mu_data_bx_m1_l: for i in 0 to NR_MU_OBJECTS-1 generate
	mu_pt_vector_bx_m1(i)(MU_PT_VECTOR_WIDTH-1 downto 0) <= CONV_STD_LOGIC_VECTOR(MU_PT_LUT(CONV_INTEGER(mu_bx_m1(i)(D_S_I_MU_V2.pt_high downto D_S_I_MU_V2.pt_low))), MU_PT_VECTOR_WIDTH);
	mu_eta_integer_bx_m1(i) <= CONV_INTEGER(signed(mu_bx_m1(i)(D_S_I_MU_V2.eta_high downto D_S_I_MU_V2.eta_low)));
	mu_phi_integer_bx_m1(i) <= CONV_INTEGER(mu_bx_m1(i)(D_S_I_MU_V2.phi_high downto D_S_I_MU_V2.phi_low));
	mu_cos_phi_bx_m1(i) <= MUON_COS_PHI_LUT(CONV_INTEGER(mu_bx_m1(i)(D_S_I_MU_V2.phi_high downto D_S_I_MU_V2.phi_low)));
	mu_sin_phi_bx_m1(i) <= MUON_SIN_PHI_LUT(CONV_INTEGER(mu_bx_m1(i)(D_S_I_MU_V2.phi_high downto D_S_I_MU_V2.phi_low)));
    end generate mu_data_bx_m1_l;
    jet_data_bx_0_l: for i in 0 to NR_JET_OBJECTS-1 generate
	jet_pt_vector_bx_0(i)(JET_PT_VECTOR_WIDTH-1 downto 0) <= CONV_STD_LOGIC_VECTOR(JET_PT_LUT(CONV_INTEGER(jet_bx_0(i)(D_S_I_JET_V2.et_high downto D_S_I_JET_V2.et_low))), JET_PT_VECTOR_WIDTH);
	jet_eta_integer_bx_0(i) <= CONV_INTEGER(signed(jet_bx_0(i)(D_S_I_JET_V2.eta_high downto D_S_I_JET_V2.eta_low)));
	jet_phi_integer_bx_0(i) <= CONV_INTEGER(jet_bx_0(i)(D_S_I_JET_V2.phi_high downto D_S_I_JET_V2.phi_low));
	jet_cos_phi_bx_0(i) <= CALO_COS_PHI_LUT(CONV_INTEGER(jet_bx_0(i)(D_S_I_JET_V2.phi_high downto D_S_I_JET_V2.phi_low)));
	jet_sin_phi_bx_0(i) <= CALO_SIN_PHI_LUT(CONV_INTEGER(jet_bx_0(i)(D_S_I_JET_V2.phi_high downto D_S_I_JET_V2.phi_low)));
	conv_jet_cos_phi_bx_0(i) <= MUON_COS_PHI_LUT(jet_phi_conv_2_muon_phi_integer_bx_0(i));
	conv_jet_sin_phi_bx_0(i) <= MUON_SIN_PHI_LUT(jet_phi_conv_2_muon_phi_integer_bx_0(i));
    end generate jet_data_bx_0_l;

-- Instantiations of differences for correlation conditions (used for DETA, DPHI, DR, mass and b_tagging) - once for correlation conditions with two ObjectTypes in certain Bxs
    diff_eg_tau_eta_bx_0_bx_0_i: entity work.sub_eta_integer_obj_vs_obj
	generic map(NR_EG_OBJECTS, NR_TAU_OBJECTS)
	port map(eg_eta_integer_bx_0, tau_eta_integer_bx_0, diff_eg_tau_bx_0_bx_0_eta_integer);
    diff_eg_tau_phi_bx_0_bx_0_i: entity work.sub_phi_integer_obj_vs_obj
	generic map(NR_EG_OBJECTS, NR_TAU_OBJECTS, CALO_PHI_HALF_RANGE_BINS)
	port map(eg_phi_integer_bx_0, tau_phi_integer_bx_0, diff_eg_tau_bx_0_bx_0_phi_integer);
    eg_tau_bx_0_bx_0_l1: for i in 0 to NR_EG_OBJECTS-1 generate
	eg_tau_bx_0_bx_0_l2: for j in 0 to NR_TAU_OBJECTS-1 generate
	    diff_eg_tau_bx_0_bx_0_eta_vector(i,j) <= CONV_STD_LOGIC_VECTOR(EG_TAU_DIFF_ETA_LUT(diff_eg_tau_bx_0_bx_0_eta_integer(i,j)),DETA_DPHI_VECTOR_WIDTH_ALL);
	    diff_eg_tau_bx_0_bx_0_phi_vector(i,j) <= CONV_STD_LOGIC_VECTOR(EG_TAU_DIFF_PHI_LUT(diff_eg_tau_bx_0_bx_0_phi_integer(i,j)),DETA_DPHI_VECTOR_WIDTH_ALL);
	end generate eg_tau_bx_0_bx_0_l2;
    end generate eg_tau_bx_0_bx_0_l1;
    diff_eg_etm_phi_bx_0_bx_0_i: entity work.sub_phi_integer_obj_vs_obj
	generic map(NR_EG_OBJECTS, NR_ETM_OBJECTS, CALO_PHI_HALF_RANGE_BINS)
	port map(eg_phi_integer_bx_0, etm_phi_integer_bx_0, diff_eg_etm_bx_0_bx_0_phi_integer);
    eg_etm_bx_0_bx_0_l1: for i in 0 to NR_EG_OBJECTS-1 generate
	eg_etm_bx_0_bx_0_l2: for j in 0 to NR_ETM_OBJECTS-1 generate
	    diff_eg_etm_bx_0_bx_0_phi_vector(i,j) <= CONV_STD_LOGIC_VECTOR(EG_ETM_DIFF_PHI_LUT(diff_eg_etm_bx_0_bx_0_phi_integer(i,j)),DETA_DPHI_VECTOR_WIDTH_ALL);
	end generate eg_etm_bx_0_bx_0_l2;
    end generate eg_etm_bx_0_bx_0_l1;
    diff_jet_mu_eta_bx_0_bx_0_i: entity work.sub_eta_integer_obj_vs_obj
	generic map(NR_JET_OBJECTS, NR_MU_OBJECTS)
	port map(jet_eta_conv_2_muon_eta_integer_bx_0, mu_eta_integer_bx_0, diff_jet_mu_bx_0_bx_0_eta_integer);
    diff_jet_mu_phi_bx_0_bx_0_i: entity work.sub_phi_integer_obj_vs_obj
	generic map(NR_JET_OBJECTS, NR_MU_OBJECTS, MUON_PHI_HALF_RANGE_BINS)
	port map(jet_phi_conv_2_muon_phi_integer_bx_0, mu_phi_integer_bx_0, diff_jet_mu_bx_0_bx_0_phi_integer);
    jet_mu_bx_0_bx_0_l1: for i in 0 to NR_JET_OBJECTS-1 generate
	jet_mu_bx_0_bx_0_l2: for j in 0 to NR_MU_OBJECTS-1 generate
	    diff_jet_mu_bx_0_bx_0_eta_vector(i,j) <= CONV_STD_LOGIC_VECTOR(JET_MU_DIFF_ETA_LUT(diff_jet_mu_bx_0_bx_0_eta_integer(i,j)),DETA_DPHI_VECTOR_WIDTH_ALL);
	    diff_jet_mu_bx_0_bx_0_phi_vector(i,j) <= CONV_STD_LOGIC_VECTOR(JET_MU_DIFF_PHI_LUT(diff_jet_mu_bx_0_bx_0_phi_integer(i,j)),DETA_DPHI_VECTOR_WIDTH_ALL);
	end generate jet_mu_bx_0_bx_0_l2;
    end generate jet_mu_bx_0_bx_0_l1;
    diff_jet_jet_eta_bx_0_bx_0_i: entity work.sub_eta_integer_obj_vs_obj
	generic map(NR_JET_OBJECTS, NR_JET_OBJECTS)
	port map(jet_eta_integer_bx_0, jet_eta_integer_bx_0, diff_jet_jet_bx_0_bx_0_eta_integer);
    diff_jet_jet_phi_bx_0_bx_0_i: entity work.sub_phi_integer_obj_vs_obj
	generic map(NR_JET_OBJECTS, NR_JET_OBJECTS, CALO_PHI_HALF_RANGE_BINS)
	port map(jet_phi_integer_bx_0, jet_phi_integer_bx_0, diff_jet_jet_bx_0_bx_0_phi_integer);
    jet_jet_bx_0_bx_0_l1: for i in 0 to NR_JET_OBJECTS-1 generate
	jet_jet_bx_0_bx_0_l2: for j in 0 to NR_JET_OBJECTS-1 generate
	    diff_jet_jet_bx_0_bx_0_eta_vector(i,j) <= CONV_STD_LOGIC_VECTOR(JET_JET_DIFF_ETA_LUT(diff_jet_jet_bx_0_bx_0_eta_integer(i,j)),DETA_DPHI_VECTOR_WIDTH_ALL);
	    diff_jet_jet_bx_0_bx_0_phi_vector(i,j) <= CONV_STD_LOGIC_VECTOR(JET_JET_DIFF_PHI_LUT(diff_jet_jet_bx_0_bx_0_phi_integer(i,j)),DETA_DPHI_VECTOR_WIDTH_ALL);
	end generate jet_jet_bx_0_bx_0_l2;
    end generate jet_jet_bx_0_bx_0_l1;
    diff_mu_mu_eta_bx_m1_bx_0_i: entity work.sub_eta_integer_obj_vs_obj
	generic map(NR_MU_OBJECTS, NR_MU_OBJECTS)
	port map(mu_eta_integer_bx_m1, mu_eta_integer_bx_0, diff_mu_mu_bx_m1_bx_0_eta_integer);
    diff_mu_mu_phi_bx_m1_bx_0_i: entity work.sub_phi_integer_obj_vs_obj
	generic map(NR_MU_OBJECTS, NR_MU_OBJECTS, MUON_PHI_HALF_RANGE_BINS)
	port map(mu_phi_integer_bx_m1, mu_phi_integer_bx_0, diff_mu_mu_bx_m1_bx_0_phi_integer);
    mu_mu_bx_m1_bx_0_l1: for i in 0 to NR_MU_OBJECTS-1 generate
	mu_mu_bx_m1_bx_0_l2: for j in 0 to NR_MU_OBJECTS-1 generate
	    diff_mu_mu_bx_m1_bx_0_eta_vector(i,j) <= CONV_STD_LOGIC_VECTOR(MU_MU_DIFF_ETA_LUT(diff_mu_mu_bx_m1_bx_0_eta_integer(i,j)),DETA_DPHI_VECTOR_WIDTH_ALL);
	    diff_mu_mu_bx_m1_bx_0_phi_vector(i,j) <= CONV_STD_LOGIC_VECTOR(MU_MU_DIFF_PHI_LUT(diff_mu_mu_bx_m1_bx_0_phi_integer(i,j)),DETA_DPHI_VECTOR_WIDTH_ALL);
	end generate mu_mu_bx_m1_bx_0_l2;
    end generate mu_mu_bx_m1_bx_0_l1;
    diff_mu_mu_eta_bx_0_bx_0_i: entity work.sub_eta_integer_obj_vs_obj
	generic map(NR_MU_OBJECTS, NR_MU_OBJECTS)
	port map(mu_eta_integer_bx_0, mu_eta_integer_bx_0, diff_mu_mu_bx_0_bx_0_eta_integer);
    diff_mu_mu_phi_bx_0_bx_0_i: entity work.sub_phi_integer_obj_vs_obj
	generic map(NR_MU_OBJECTS, NR_MU_OBJECTS, MUON_PHI_HALF_RANGE_BINS)
	port map(mu_phi_integer_bx_0, mu_phi_integer_bx_0, diff_mu_mu_bx_0_bx_0_phi_integer);
    mu_mu_bx_0_bx_0_l1: for i in 0 to NR_MU_OBJECTS-1 generate
	mu_mu_bx_0_bx_0_l2: for j in 0 to NR_MU_OBJECTS-1 generate
	    diff_mu_mu_bx_0_bx_0_eta_vector(i,j) <= CONV_STD_LOGIC_VECTOR(MU_MU_DIFF_ETA_LUT(diff_mu_mu_bx_0_bx_0_eta_integer(i,j)),DETA_DPHI_VECTOR_WIDTH_ALL);
	    diff_mu_mu_bx_0_bx_0_phi_vector(i,j) <= CONV_STD_LOGIC_VECTOR(MU_MU_DIFF_PHI_LUT(diff_mu_mu_bx_0_bx_0_phi_integer(i,j)),DETA_DPHI_VECTOR_WIDTH_ALL);
	end generate mu_mu_bx_0_bx_0_l2;
    end generate mu_mu_bx_0_bx_0_l1;
    diff_jet_etm_phi_bx_0_bx_0_i: entity work.sub_phi_integer_obj_vs_obj
	generic map(NR_JET_OBJECTS, NR_ETM_OBJECTS, CALO_PHI_HALF_RANGE_BINS)
	port map(jet_phi_integer_bx_0, etm_phi_integer_bx_0, diff_jet_etm_bx_0_bx_0_phi_integer);
    jet_etm_bx_0_bx_0_l1: for i in 0 to NR_JET_OBJECTS-1 generate
	jet_etm_bx_0_bx_0_l2: for j in 0 to NR_ETM_OBJECTS-1 generate
	    diff_jet_etm_bx_0_bx_0_phi_vector(i,j) <= CONV_STD_LOGIC_VECTOR(JET_ETM_DIFF_PHI_LUT(diff_jet_etm_bx_0_bx_0_phi_integer(i,j)),DETA_DPHI_VECTOR_WIDTH_ALL);
	end generate jet_etm_bx_0_bx_0_l2;
    end generate jet_etm_bx_0_bx_0_l1;

-- Instantiations of cosh-deta and cos-dphi LUTs for correlation conditions (used for mass and overlap_remover) - once for correlation conditions with two ObjectTypes in certain Bxs
    eg_tau_bx_0_bx_0_cosh_cos_l1: for i in 0 to NR_EG_OBJECTS-1 generate
	eg_tau_bx_0_bx_0_cosh_cos_l2: for j in 0 to NR_TAU_OBJECTS-1 generate
	    eg_tau_bx_0_bx_0_cosh_deta_vector(i,j) <= CONV_STD_LOGIC_VECTOR(EG_TAU_COSH_DETA_LUT(diff_eg_tau_bx_0_bx_0_eta_integer(i,j)), EG_TAU_COSH_COS_VECTOR_WIDTH);
	    eg_tau_bx_0_bx_0_cos_dphi_vector(i,j) <= CONV_STD_LOGIC_VECTOR(EG_TAU_COS_DPHI_LUT(diff_eg_tau_bx_0_bx_0_phi_integer(i,j)), EG_TAU_COSH_COS_VECTOR_WIDTH);
	end generate eg_tau_bx_0_bx_0_cosh_cos_l2;
    end generate eg_tau_bx_0_bx_0_cosh_cos_l1;
    eg_etm_bx_0_bx_0_cos_dphi_l1: for i in 0 to NR_EG_OBJECTS-1 generate
	eg_etm_bx_0_bx_0_cos_dphi_l2: for j in 0 to NR_ETM_OBJECTS-1 generate
	    eg_etm_bx_0_bx_0_cos_dphi_vector(i,j) <= CONV_STD_LOGIC_VECTOR(EG_ETM_COS_DPHI_LUT(diff_eg_etm_bx_0_bx_0_phi_integer(i,j)), EG_ETM_COSH_COS_VECTOR_WIDTH);
	end generate eg_etm_bx_0_bx_0_cos_dphi_l2;
    end generate eg_etm_bx_0_bx_0_cos_dphi_l1;
    jet_mu_bx_0_bx_0_cosh_cos_l1: for i in 0 to NR_JET_OBJECTS-1 generate
	jet_mu_bx_0_bx_0_cosh_cos_l2: for j in 0 to NR_MU_OBJECTS-1 generate
	    jet_mu_bx_0_bx_0_cosh_deta_vector(i,j) <= CONV_STD_LOGIC_VECTOR(JET_MU_COSH_DETA_LUT(diff_jet_mu_bx_0_bx_0_eta_integer(i,j)), JET_MU_COSH_COS_VECTOR_WIDTH);
	    jet_mu_bx_0_bx_0_cos_dphi_vector(i,j) <= CONV_STD_LOGIC_VECTOR(JET_MU_COS_DPHI_LUT(diff_jet_mu_bx_0_bx_0_phi_integer(i,j)), JET_MU_COSH_COS_VECTOR_WIDTH);
	end generate jet_mu_bx_0_bx_0_cosh_cos_l2;
    end generate jet_mu_bx_0_bx_0_cosh_cos_l1;
    jet_jet_bx_0_bx_0_cosh_cos_l1: for i in 0 to NR_JET_OBJECTS-1 generate
	jet_jet_bx_0_bx_0_cosh_cos_l2: for j in 0 to NR_JET_OBJECTS-1 generate
	    jet_jet_bx_0_bx_0_cosh_deta_vector(i,j) <= CONV_STD_LOGIC_VECTOR(JET_JET_COSH_DETA_LUT(diff_jet_jet_bx_0_bx_0_eta_integer(i,j)), JET_JET_COSH_COS_VECTOR_WIDTH);
	    jet_jet_bx_0_bx_0_cos_dphi_vector(i,j) <= CONV_STD_LOGIC_VECTOR(JET_JET_COS_DPHI_LUT(diff_jet_jet_bx_0_bx_0_phi_integer(i,j)), JET_JET_COSH_COS_VECTOR_WIDTH);
	end generate jet_jet_bx_0_bx_0_cosh_cos_l2;
    end generate jet_jet_bx_0_bx_0_cosh_cos_l1;
    mu_mu_bx_m1_bx_0_cosh_cos_l1: for i in 0 to NR_MU_OBJECTS-1 generate
	mu_mu_bx_m1_bx_0_cosh_cos_l2: for j in 0 to NR_MU_OBJECTS-1 generate
	    mu_mu_bx_m1_bx_0_cosh_deta_vector(i,j) <= CONV_STD_LOGIC_VECTOR(MU_MU_COSH_DETA_LUT(diff_mu_mu_bx_m1_bx_0_eta_integer(i,j)), MU_MU_COSH_COS_VECTOR_WIDTH);
	    mu_mu_bx_m1_bx_0_cos_dphi_vector(i,j) <= CONV_STD_LOGIC_VECTOR(MU_MU_COS_DPHI_LUT(diff_mu_mu_bx_m1_bx_0_phi_integer(i,j)), MU_MU_COSH_COS_VECTOR_WIDTH);
	end generate mu_mu_bx_m1_bx_0_cosh_cos_l2;
    end generate mu_mu_bx_m1_bx_0_cosh_cos_l1;
    mu_mu_bx_0_bx_0_cosh_cos_l1: for i in 0 to NR_MU_OBJECTS-1 generate
	mu_mu_bx_0_bx_0_cosh_cos_l2: for j in 0 to NR_MU_OBJECTS-1 generate
	    mu_mu_bx_0_bx_0_cosh_deta_vector(i,j) <= CONV_STD_LOGIC_VECTOR(MU_MU_COSH_DETA_LUT(diff_mu_mu_bx_0_bx_0_eta_integer(i,j)), MU_MU_COSH_COS_VECTOR_WIDTH);
	    mu_mu_bx_0_bx_0_cos_dphi_vector(i,j) <= CONV_STD_LOGIC_VECTOR(MU_MU_COS_DPHI_LUT(diff_mu_mu_bx_0_bx_0_phi_integer(i,j)), MU_MU_COSH_COS_VECTOR_WIDTH);
	end generate mu_mu_bx_0_bx_0_cosh_cos_l2;
    end generate mu_mu_bx_0_bx_0_cosh_cos_l1;
    jet_etm_bx_0_bx_0_cos_dphi_l1: for i in 0 to NR_JET_OBJECTS-1 generate
	jet_etm_bx_0_bx_0_cos_dphi_l2: for j in 0 to NR_ETM_OBJECTS-1 generate
	    jet_etm_bx_0_bx_0_cos_dphi_vector(i,j) <= CONV_STD_LOGIC_VECTOR(JET_ETM_COS_DPHI_LUT(diff_jet_etm_bx_0_bx_0_phi_integer(i,j)), JET_ETM_COSH_COS_VECTOR_WIDTH);
	end generate jet_etm_bx_0_bx_0_cos_dphi_l2;
    end generate jet_etm_bx_0_bx_0_cos_dphi_l1;

-- Instantiations of conditions
double_eg_14367831859864844127_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	2, true, EG_TYPE,
        (X"002C", X"0014", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, eg_bx_0,
	double_eg_14367831859864844127);


double_eg_14367840655957867231_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	2, true, EG_TYPE,
        (X"0030", X"0022", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, eg_bx_0,
	double_eg_14367840655957867231);


double_eg_9170720688096593570_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	2, true, EG_TYPE,
        (X"002E", X"0014", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"C", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, eg_bx_0,
	double_eg_9170720688096593570);


double_jet_15912440717418279010_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	2, true, JET_TYPE,
        (X"00F0", X"00F0", X"0000", X"0000"),
        (false, false, true, true),
        (X"0044", X"0044", X"0000", X"0000"), (X"00BB", X"00BB", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, jet_bx_0,
	double_jet_15912440717418279010);


double_jet_16307690244847013269_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	2, true, JET_TYPE,
        (X"00C8", X"003C", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, jet_bx_0,
	double_jet_16307690244847013269);


double_jet_4162612533456677351_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	2, true, JET_TYPE,
        (X"00B4", X"003C", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, jet_bx_0,
	double_jet_4162612533456677351);


double_jet_8659370613945584339_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	2, true, JET_TYPE,
        (X"0090", X"0070", X"0000", X"0000"),
        (false, false, true, true),
        (X"0044", X"0044", X"0000", X"0000"), (X"00BB", X"00BB", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, jet_bx_0,
	double_jet_8659370613945584339);


double_jet_8659444281224645331_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	2, true, JET_TYPE,
        (X"00B0", X"0070", X"0000", X"0000"),
        (false, false, true, true),
        (X"0044", X"0044", X"0000", X"0000"), (X"00BB", X"00BB", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, jet_bx_0,
	double_jet_8659444281224645331);


double_jet_8659446377168685779_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	2, true, JET_TYPE,
        (X"00A0", X"00A0", X"0000", X"0000"),
        (false, false, true, true),
        (X"0044", X"0044", X"0000", X"0000"), (X"00BB", X"00BB", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, jet_bx_0,
	double_jet_8659446377168685779);


double_jet_8659448610551679699_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	2, true, JET_TYPE,
        (X"00B0", X"0090", X"0000", X"0000"),
        (false, false, true, true),
        (X"0044", X"0044", X"0000", X"0000"), (X"00BB", X"00BB", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, jet_bx_0,
	double_jet_8659448610551679699);


double_tau_10196652277112847102_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	2, true, TAU_TYPE,
        (X"0048", X"0048", X"0000", X"0000"),
        (false, false, true, true),
        (X"0030", X"0030", X"0000", X"0000"), (X"00CF", X"00CF", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"E", X"E", X"F", X"F"),
	false
    )
    port map(lhc_clk, tau_bx_0,
	double_tau_10196652277112847102);


double_tau_17539608616528615651_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	2, true, TAU_TYPE,
        (X"008C", X"008C", X"0000", X"0000"),
        (false, false, true, true),
        (X"0030", X"0030", X"0000", X"0000"), (X"00CF", X"00CF", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, tau_bx_0,
	double_tau_17539608616528615651);


double_tau_973280238110587646_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	2, true, TAU_TYPE,
        (X"0040", X"0040", X"0000", X"0000"),
        (false, false, true, true),
        (X"0030", X"0030", X"0000", X"0000"), (X"00CF", X"00CF", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"E", X"E", X"F", X"F"),
	false
    )
    port map(lhc_clk, tau_bx_0,
	double_tau_973280238110587646);


single_eg_1139634_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	1, true, EG_TYPE,
        (X"0004", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, eg_bx_0,
	single_eg_1139634);


single_eg_1139637_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	1, true, EG_TYPE,
        (X"000A", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, eg_bx_0,
	single_eg_1139637);


single_eg_12507579852184457792_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	1, true, EG_TYPE,
        (X"002C", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"A", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, eg_bx_0,
	single_eg_12507579852184457792);


single_eg_12507579852190749248_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	1, true, EG_TYPE,
        (X"0038", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"A", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, eg_bx_0,
	single_eg_12507579852190749248);


single_eg_12507579852321821248_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	1, true, EG_TYPE,
        (X"0046", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"A", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, eg_bx_0,
	single_eg_12507579852321821248);


single_eg_14262501759976278963_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	1, true, EG_TYPE,
        (X"0048", X"0000", X"0000", X"0000"),
        (false, true, true, true),
        (X"0030", X"0000", X"0000", X"0000"), (X"00CF", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, eg_bx_0,
	single_eg_14262501759976278963);


single_eg_145873206_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	1, true, EG_TYPE,
        (X"0034", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, eg_bx_0,
	single_eg_145873206);


single_eg_145873328_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	1, true, EG_TYPE,
        (X"003C", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, eg_bx_0,
	single_eg_145873328);


single_eg_145873332_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	1, true, EG_TYPE,
        (X"0044", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, eg_bx_0,
	single_eg_145873332);


single_eg_145873456_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	1, true, EG_TYPE,
        (X"0050", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, eg_bx_0,
	single_eg_145873456);


single_eg_6872811427209405681_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	1, true, EG_TYPE,
        (X"0024", X"0000", X"0000", X"0000"),
        (false, true, true, true),
        (X"0030", X"0000", X"0000", X"0000"), (X"00CF", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"A", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, eg_bx_0,
	single_eg_6872811427209405681);


single_eg_6872947766651249905_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	1, true, EG_TYPE,
        (X"0030", X"0000", X"0000", X"0000"),
        (false, true, true, true),
        (X"0030", X"0000", X"0000", X"0000"), (X"00CF", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"A", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, eg_bx_0,
	single_eg_6872947766651249905);


single_eg_6873084106093094129_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	1, true, EG_TYPE,
        (X"003C", X"0000", X"0000", X"0000"),
        (false, true, true, true),
        (X"0030", X"0000", X"0000", X"0000"), (X"00CF", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"A", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, eg_bx_0,
	single_eg_6873084106093094129);


single_eg_6873087404627977457_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	1, true, EG_TYPE,
        (X"0042", X"0000", X"0000", X"0000"),
        (false, true, true, true),
        (X"0030", X"0000", X"0000", X"0000"), (X"00CF", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"A", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, eg_bx_0,
	single_eg_6873087404627977457);


single_eg_9244881742421986046_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	1, true, EG_TYPE,
        (X"0048", X"0000", X"0000", X"0000"),
        (false, true, true, true),
        (X"0030", X"0000", X"0000", X"0000"), (X"00CF", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"A", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, eg_bx_0,
	single_eg_9244881742421986046);


single_eg_9244883941445241598_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	1, true, EG_TYPE,
        (X"004C", X"0000", X"0000", X"0000"),
        (false, true, true, true),
        (X"0030", X"0000", X"0000", X"0000"), (X"00CF", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"A", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, eg_bx_0,
	single_eg_9244883941445241598);


single_jet_15873314052325834177_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	1, true, JET_TYPE,
        (X"00B4", X"0000", X"0000", X"0000"),
        (false, true, true, true),
        (X"00C3", X"0000", X"0000", X"0000"), (X"008D", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, jet_bx_0,
	single_jet_15873314052325834177);


single_jet_15873314052330193857_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	1, true, JET_TYPE,
        (X"00B4", X"0000", X"0000", X"0000"),
        (false, true, true, true),
        (X"0072", X"0000", X"0000", X"0000"), (X"003C", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, jet_bx_0,
	single_jet_15873314052330193857);


single_jet_20010309814_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	1, true, JET_TYPE,
        (X"0020", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, jet_bx_0,
	single_jet_20010309814);


single_jet_20010310069_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	1, true, JET_TYPE,
        (X"0046", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, jet_bx_0,
	single_jet_20010310069);


single_jet_2561319655728_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	1, true, JET_TYPE,
        (X"00F0", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, jet_bx_0,
	single_jet_2561319655728);


single_jet_2561319656496_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	1, true, JET_TYPE,
        (X"0168", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, jet_bx_0,
	single_jet_2561319656496);


single_jet_5967545309707548871_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	1, true, JET_TYPE,
        (X"0028", X"0000", X"0000", X"0000"),
        (false, true, true, true),
        (X"0044", X"0000", X"0000", X"0000"), (X"00BB", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, jet_bx_0,
	single_jet_5967545309707548871);


single_jet_5967545344469940423_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	1, true, JET_TYPE,
        (X"0056", X"0000", X"0000", X"0000"),
        (false, true, true, true),
        (X"0044", X"0000", X"0000", X"0000"), (X"00BB", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, jet_bx_0,
	single_jet_5967545344469940423);


single_jet_5974075644574252540_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	1, true, JET_TYPE,
        (X"0070", X"0000", X"0000", X"0000"),
        (false, true, true, true),
        (X"00BA", X"0000", X"0000", X"0000"), (X"008D", X"0000", X"0000", X"0000"),
        (false, true, true, true),
        (X"0072", X"0000", X"0000", X"0000"), (X"0045", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, jet_bx_0,
	single_jet_5974075644574252540);


single_jet_5974214183039352316_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	1, true, JET_TYPE,
        (X"0090", X"0000", X"0000", X"0000"),
        (false, true, true, true),
        (X"00BA", X"0000", X"0000", X"0000"), (X"008D", X"0000", X"0000", X"0000"),
        (false, true, true, true),
        (X"0072", X"0000", X"0000", X"0000"), (X"0045", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, jet_bx_0,
	single_jet_5974214183039352316);


single_jet_5974287850318413308_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	1, true, JET_TYPE,
        (X"00B0", X"0000", X"0000", X"0000"),
        (false, true, true, true),
        (X"00BA", X"0000", X"0000", X"0000"), (X"008D", X"0000", X"0000", X"0000"),
        (false, true, true, true),
        (X"0072", X"0000", X"0000", X"0000"), (X"0045", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, jet_bx_0,
	single_jet_5974287850318413308);


single_jet_8640423326801359755_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	1, true, JET_TYPE,
        (X"0078", X"0000", X"0000", X"0000"),
        (false, true, true, true),
        (X"00BA", X"0000", X"0000", X"0000"), (X"008D", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, jet_bx_0,
	single_jet_8640423326801359755);


single_tau_22686292272_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	1, true, TAU_TYPE,
        (X"0028", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, tau_bx_0,
	single_tau_22686292272);


single_tau_3484215725702552004_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	1, true, TAU_TYPE,
        (X"00F0", X"0000", X"0000", X"0000"),
        (false, true, true, true),
        (X"0030", X"0000", X"0000", X"0000"), (X"00CF", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, tau_bx_0,
	single_tau_3484215725702552004);


triple_jet_7930493752634094709_i: entity work.calo_conditions_v5
    generic map(0, 11,  
	3, true, JET_TYPE,
        (X"00B0", X"0090", X"0070", X"0000"),
        (false, false, false, true),
        (X"0044", X"0044", X"0044", X"0000"), (X"00BB", X"00BB", X"00BB", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (X"F", X"F", X"F", X"F"),
	false
    )
    port map(lhc_clk, jet_bx_0,
	triple_jet_7930493752634094709);


double_mu_14617142003772573591_i: entity work.muon_conditions_v5
    generic map(0, 7, 
	2, true,
        (X"0001", X"0001", X"0000", X"0000"),
        (false, false, true, true),
        (X"008A", X"008A", X"0000", X"0000"), (X"0176", X"0176", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        ("ign", "ign", "ign", "ign"),
        (X"F000", X"F000", X"FFFF", X"FFFF"),
        (X"F", X"F", X"F", X"F"),
        "os",
	false
    )
    port map(lhc_clk, mu_bx_0,
	double_mu_14617142003772573591,
        ls_charcorr_double_bx_0_bx_0, os_charcorr_double_bx_0_bx_0,
        ls_charcorr_triple_bx_0_bx_0, os_charcorr_triple_bx_0_bx_0,
        ls_charcorr_quad_bx_0_bx_0, os_charcorr_quad_bx_0_bx_0);


double_mu_16961163303935834116_i: entity work.muon_conditions_v5
    generic map(0, 7, 
	2, true,
        (X"001F", X"000F", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        ("ign", "ign", "ign", "ign"),
        (X"FF00", X"FF00", X"FFFF", X"FFFF"),
        (X"F", X"F", X"F", X"F"),
        "ig",
	false
    )
    port map(lhc_clk, mu_bx_0,
	double_mu_16961163303935834116,
        ls_charcorr_double_bx_0_bx_0, os_charcorr_double_bx_0_bx_0,
        ls_charcorr_triple_bx_0_bx_0, os_charcorr_triple_bx_0_bx_0,
        ls_charcorr_quad_bx_0_bx_0, os_charcorr_quad_bx_0_bx_0);


double_mu_16961163853691648004_i: entity work.muon_conditions_v5
    generic map(0, 7, 
	2, true,
        (X"0019", X"0011", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        ("ign", "ign", "ign", "ign"),
        (X"FF00", X"FF00", X"FFFF", X"FFFF"),
        (X"F", X"F", X"F", X"F"),
        "ig",
	false
    )
    port map(lhc_clk, mu_bx_0,
	double_mu_16961163853691648004,
        ls_charcorr_double_bx_0_bx_0, os_charcorr_double_bx_0_bx_0,
        ls_charcorr_triple_bx_0_bx_0, os_charcorr_triple_bx_0_bx_0,
        ls_charcorr_quad_bx_0_bx_0, os_charcorr_quad_bx_0_bx_0);


double_mu_17582786187978172426_i: entity work.muon_conditions_v5
    generic map(0, 7, 
	2, true,
        (X"000A", X"000A", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        ("ign", "ign", "ign", "ign"),
        (X"F000", X"F000", X"FFFF", X"FFFF"),
        (X"F", X"F", X"F", X"F"),
        "ig",
	false
    )
    port map(lhc_clk, mu_bx_0,
	double_mu_17582786187978172426,
        ls_charcorr_double_bx_0_bx_0, os_charcorr_double_bx_0_bx_0,
        ls_charcorr_triple_bx_0_bx_0, os_charcorr_triple_bx_0_bx_0,
        ls_charcorr_quad_bx_0_bx_0, os_charcorr_quad_bx_0_bx_0);


double_mu_3274363720173353484_i: entity work.muon_conditions_v5
    generic map(0, 7, 
	2, true,
        (X"000D", X"000D", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        ("ign", "ign", "ign", "ign"),
        (X"F000", X"F000", X"FFFF", X"FFFF"),
        (X"F", X"F", X"F", X"F"),
        "os",
	false
    )
    port map(lhc_clk, mu_bx_0,
	double_mu_3274363720173353484,
        ls_charcorr_double_bx_0_bx_0, os_charcorr_double_bx_0_bx_0,
        ls_charcorr_triple_bx_0_bx_0, os_charcorr_triple_bx_0_bx_0,
        ls_charcorr_quad_bx_0_bx_0, os_charcorr_quad_bx_0_bx_0);


quad_mu_509409160461874775_i: entity work.muon_conditions_v5
    generic map(0, 7, 
	4, true,
        (X"0001", X"0001", X"0001", X"0001"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        ("ign", "ign", "ign", "ign"),
        (X"FF00", X"FF00", X"FF00", X"FF00"),
        (X"F", X"F", X"F", X"F"),
        "ig",
	false
    )
    port map(lhc_clk, mu_bx_0,
	quad_mu_509409160461874775,
        ls_charcorr_double_bx_0_bx_0, os_charcorr_double_bx_0_bx_0,
        ls_charcorr_triple_bx_0_bx_0, os_charcorr_triple_bx_0_bx_0,
        ls_charcorr_quad_bx_0_bx_0, os_charcorr_quad_bx_0_bx_0);


single_mu_14243093768255232179_i: entity work.muon_conditions_v5
    generic map(0, 7, 
	1, true,
        (X"0001", X"0000", X"0000", X"0000"),
        (false, true, true, true),
        (X"0049", X"0000", X"0000", X"0000"), (X"01B7", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        ("ign", "ign", "ign", "ign"),
        (X"FFFF", X"FFFF", X"FFFF", X"FFFF"),
        (X"F", X"F", X"F", X"F"),
        "ig",
	false
    )
    port map(lhc_clk, mu_bx_0,
	single_mu_14243093768255232179);


single_mu_14769293018627052229_i: entity work.muon_conditions_v5
    generic map(0, 7, 
	1, true,
        (X"0001", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        ("ign", "ign", "ign", "ign"),
        (X"FFF0", X"FFFF", X"FFFF", X"FFFF"),
        (X"F", X"F", X"F", X"F"),
        "ig",
	false
    )
    port map(lhc_clk, mu_bx_0,
	single_mu_14769293018627052229);


single_mu_14769293157135585733_i: entity work.muon_conditions_v5
    generic map(0, 7, 
	1, true,
        (X"0011", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        ("ign", "ign", "ign", "ign"),
        (X"F000", X"FFFF", X"FFFF", X"FFFF"),
        (X"F", X"F", X"F", X"F"),
        "ig",
	false
    )
    port map(lhc_clk, mu_bx_0,
	single_mu_14769293157135585733);


single_mu_16260934496621930532_i: entity work.muon_conditions_v5
    generic map(0, 7, 
	1, true,
        (X"0001", X"0000", X"0000", X"0000"),
        (false, true, true, true),
        (X"0049", X"0000", X"0000", X"0000"), (X"01B7", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        ("ign", "ign", "ign", "ign"),
        (X"F000", X"FFFF", X"FFFF", X"FFFF"),
        (X"F", X"F", X"F", X"F"),
        "ig",
	false
    )
    port map(lhc_clk, mu_bx_0,
	single_mu_16260934496621930532);


single_mu_17545683038261595717_i: entity work.muon_conditions_v5
    generic map(0, 7, 
	1, true,
        (X"0017", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        ("ign", "ign", "ign", "ign"),
        (X"FF00", X"FFFF", X"FFFF", X"FFFF"),
        (X"F", X"F", X"F", X"F"),
        "ig",
	false
    )
    port map(lhc_clk, mu_bx_0,
	single_mu_17545683038261595717);


single_mu_17545683128212558277_i: entity work.muon_conditions_v5
    generic map(0, 7, 
	1, true,
        (X"0021", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        ("ign", "ign", "ign", "ign"),
        (X"F000", X"FFFF", X"FFFF", X"FFFF"),
        (X"F", X"F", X"F", X"F"),
        "ig",
	false
    )
    port map(lhc_clk, mu_bx_0,
	single_mu_17545683128212558277);


single_mu_17545685310055944645_i: entity work.muon_conditions_v5
    generic map(0, 7, 
	1, true,
        (X"0033", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        ("ign", "ign", "ign", "ign"),
        (X"F000", X"FFFF", X"FFFF", X"FFFF"),
        (X"F", X"F", X"F", X"F"),
        "ig",
	false
    )
    port map(lhc_clk, mu_bx_0,
	single_mu_17545685310055944645);


single_mu_17545687423179854277_i: entity work.muon_conditions_v5
    generic map(0, 7, 
	1, true,
        (X"003D", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        ("ign", "ign", "ign", "ign"),
        (X"F000", X"FFFF", X"FFFF", X"FFFF"),
        (X"F", X"F", X"F", X"F"),
        "ig",
	false
    )
    port map(lhc_clk, mu_bx_0,
	single_mu_17545687423179854277);


single_mu_6225176160372139651_i: entity work.muon_conditions_v5
    generic map(0, 7, 
	1, true,
        (X"002D", X"0000", X"0000", X"0000"),
        (false, true, true, true),
        (X"00E1", X"0000", X"0000", X"0000"), (X"0073", X"0000", X"0000", X"0000"),
        (false, true, true, true),
        (X"018D", X"0000", X"0000", X"0000"), (X"011F", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        ("ign", "ign", "ign", "ign"),
        (X"F000", X"FFFF", X"FFFF", X"FFFF"),
        (X"F", X"F", X"F", X"F"),
        "ig",
	false
    )
    port map(lhc_clk, mu_bx_0,
	single_mu_6225176160372139651);


triple_mu_3324682852515662879_i: entity work.muon_conditions_v5
    generic map(0, 7, 
	3, true,
        (X"0001", X"0001", X"0001", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        ("ign", "ign", "ign", "ign"),
        (X"FF00", X"FF00", X"FF00", X"FFFF"),
        (X"F", X"F", X"F", X"F"),
        "ig",
	false
    )
    port map(lhc_clk, mu_bx_0,
	triple_mu_3324682852515662879,
        ls_charcorr_double_bx_0_bx_0, os_charcorr_double_bx_0_bx_0,
        ls_charcorr_triple_bx_0_bx_0, os_charcorr_triple_bx_0_bx_0,
        ls_charcorr_quad_bx_0_bx_0, os_charcorr_quad_bx_0_bx_0);


triple_mu_3324683353497813023_i: entity work.muon_conditions_v5
    generic map(0, 7, 
	3, true,
        (X"0001", X"0001", X"0001", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        ("ign", "ign", "ign", "ign"),
        (X"FFF0", X"FFF0", X"FFF0", X"FFFF"),
        (X"F", X"F", X"F", X"F"),
        "ig",
	false
    )
    port map(lhc_clk, mu_bx_0,
	triple_mu_3324683353497813023,
        ls_charcorr_double_bx_0_bx_0, os_charcorr_double_bx_0_bx_0,
        ls_charcorr_triple_bx_0_bx_0, os_charcorr_triple_bx_0_bx_0,
        ls_charcorr_quad_bx_0_bx_0, os_charcorr_quad_bx_0_bx_0);


triple_mu_3324685351042537503_i: entity work.muon_conditions_v5
    generic map(0, 7, 
	3, true,
        (X"000B", X"0007", X"0001", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        ("ign", "ign", "ign", "ign"),
        (X"F000", X"F000", X"FF00", X"FFFF"),
        (X"F", X"F", X"F", X"F"),
        "ig",
	false
    )
    port map(lhc_clk, mu_bx_0,
	triple_mu_3324685351042537503,
        ls_charcorr_double_bx_0_bx_0, os_charcorr_double_bx_0_bx_0,
        ls_charcorr_triple_bx_0_bx_0, os_charcorr_triple_bx_0_bx_0,
        ls_charcorr_quad_bx_0_bx_0, os_charcorr_quad_bx_0_bx_0);


triple_mu_3324685732743223327_i: entity work.muon_conditions_v5
    generic map(0, 7, 
	3, true,
        (X"000B", X"0007", X"0001", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        ("ign", "ign", "ign", "ign"),
        (X"F000", X"F000", X"FFF0", X"FFFF"),
        (X"F", X"F", X"F", X"F"),
        "ig",
	false
    )
    port map(lhc_clk, mu_bx_0,
	triple_mu_3324685732743223327,
        ls_charcorr_double_bx_0_bx_0, os_charcorr_double_bx_0_bx_0,
        ls_charcorr_triple_bx_0_bx_0, os_charcorr_triple_bx_0_bx_0,
        ls_charcorr_quad_bx_0_bx_0, os_charcorr_quad_bx_0_bx_0);


triple_mu_3324691786047638559_i: entity work.muon_conditions_v5
    generic map(0, 7, 
	3, true,
        (X"000B", X"0007", X"0007", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        ("ign", "ign", "ign", "ign"),
        (X"FF00", X"FF00", X"FF00", X"FFFF"),
        (X"F", X"F", X"F", X"F"),
        "ig",
	false
    )
    port map(lhc_clk, mu_bx_0,
	triple_mu_3324691786047638559,
        ls_charcorr_double_bx_0_bx_0, os_charcorr_double_bx_0_bx_0,
        ls_charcorr_triple_bx_0_bx_0, os_charcorr_triple_bx_0_bx_0,
        ls_charcorr_quad_bx_0_bx_0, os_charcorr_quad_bx_0_bx_0);


triple_mu_3324694397387754527_i: entity work.muon_conditions_v5
    generic map(0, 7, 
	3, true,
        (X"0009", X"0009", X"0009", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        (true, true, true, true),
        (X"0000", X"0000", X"0000", X"0000"), (X"0000", X"0000", X"0000", X"0000"),
        ("ign", "ign", "ign", "ign"),
        (X"FF00", X"FF00", X"FF00", X"FFFF"),
        (X"F", X"F", X"F", X"F"),
        "ig",
	false
    )
    port map(lhc_clk, mu_bx_0,
	triple_mu_3324694397387754527,
        ls_charcorr_double_bx_0_bx_0, os_charcorr_double_bx_0_bx_0,
        ls_charcorr_triple_bx_0_bx_0, os_charcorr_triple_bx_0_bx_0,
        ls_charcorr_quad_bx_0_bx_0, os_charcorr_quad_bx_0_bx_0);


single_htt_2496626711216_i: entity work.esums_conditions
    generic map(true, HTT_TYPE,
        X"012C",
        true, X"0000", X"0000",
        true, X"0000", X"0000"
        )
    port map(lhc_clk, htt_bx_0, single_htt_2496626711216);


calo_calo_correlation_7041035331710545453_i: entity work.calo_calo_correlation_condition_v2
    generic map(
        true,
        true, false, false, false, 0, false, 
        0, 11, true, JET_TYPE,
        X"00E0",
        false, X"0034", X"00CB",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        X"F",
        0, 11, true, JET_TYPE,
        X"00E0",
        false, X"0034", X"00CB",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        X"F",
        1.6, 0.0,
        0.0, 0.0,
        0.0, 0.0, DETA_DPHI_VECTOR_WIDTH_ALL, JET_JET_DETA_DPHI_PRECISION,
        0.0, 0.0, JET_JET_MASS_PRECISION,
        JET_PT_VECTOR_WIDTH, JET_PT_VECTOR_WIDTH, JET_JET_COSH_COS_PRECISION, JET_JET_COSH_COS_VECTOR_WIDTH,
        0.0, CALO_SIN_COS_VECTOR_WIDTH, JET_JET_PT_PRECISION, JET_JET_SIN_COS_PRECISION
    )
    port map(lhc_clk, jet_bx_0, jet_bx_0,
        diff_jet_jet_bx_0_bx_0_eta_vector, diff_jet_jet_bx_0_bx_0_phi_vector,
        jet_pt_vector_bx_0, jet_pt_vector_bx_0,
        jet_jet_bx_0_bx_0_cosh_deta_vector, jet_jet_bx_0_bx_0_cos_dphi_vector,
        jet_cos_phi_bx_0, jet_cos_phi_bx_0, jet_sin_phi_bx_0, jet_sin_phi_bx_0,
        calo_calo_correlation_7041035331710545453);

calo_calo_correlation_911641502108141008_i: entity work.calo_calo_correlation_condition_v2
    generic map(
        true,
        false, false, true, false, 0, false, 
        0, 11, true, EG_TYPE,
        X"0030",
        false, X"0030", X"00CF",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        X"C",
        0, 11, true, TAU_TYPE,
        X"0036",
        false, X"0030", X"00CF",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        X"E",
        0.0, 0.0,
        0.0, 0.0,
        139.24, 0.09, DETA_DPHI_VECTOR_WIDTH_ALL, EG_TAU_DETA_DPHI_PRECISION,
        0.0, 0.0, EG_TAU_MASS_PRECISION,
        EG_PT_VECTOR_WIDTH, TAU_PT_VECTOR_WIDTH, EG_TAU_COSH_COS_PRECISION, EG_TAU_COSH_COS_VECTOR_WIDTH,
        0.0, CALO_SIN_COS_VECTOR_WIDTH, EG_TAU_PT_PRECISION, EG_TAU_SIN_COS_PRECISION
    )
    port map(lhc_clk, eg_bx_0, tau_bx_0,
        diff_eg_tau_bx_0_bx_0_eta_vector, diff_eg_tau_bx_0_bx_0_phi_vector,
        eg_pt_vector_bx_0, tau_pt_vector_bx_0,
        eg_tau_bx_0_bx_0_cosh_deta_vector, eg_tau_bx_0_bx_0_cos_dphi_vector,
        eg_cos_phi_bx_0, tau_cos_phi_bx_0, eg_sin_phi_bx_0, tau_sin_phi_bx_0,
        calo_calo_correlation_911641502108141008);

invariant_mass_2940638391876117895_i: entity work.calo_calo_correlation_condition_v2
    generic map(
        true,
        false, false, false, true, 0, false, 
        0, 11, true, JET_TYPE,
        X"003C",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        X"F",
        0, 11, true, JET_TYPE,
        X"003C",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        X"F",
        0.0, 0.0,
        0.0, 0.0,
        0.0, 0.0, DETA_DPHI_VECTOR_WIDTH_ALL, JET_JET_DETA_DPHI_PRECISION,
        98000000.0, 192200.0, JET_JET_MASS_PRECISION,
        JET_PT_VECTOR_WIDTH, JET_PT_VECTOR_WIDTH, JET_JET_COSH_COS_PRECISION, JET_JET_COSH_COS_VECTOR_WIDTH,
        0.0, CALO_SIN_COS_VECTOR_WIDTH, JET_JET_PT_PRECISION, JET_JET_SIN_COS_PRECISION
    )
    port map(lhc_clk, jet_bx_0, jet_bx_0,
        diff_jet_jet_bx_0_bx_0_eta_vector, diff_jet_jet_bx_0_bx_0_phi_vector,
        jet_pt_vector_bx_0, jet_pt_vector_bx_0,
        jet_jet_bx_0_bx_0_cosh_deta_vector, jet_jet_bx_0_bx_0_cos_dphi_vector,
        jet_cos_phi_bx_0, jet_cos_phi_bx_0, jet_sin_phi_bx_0, jet_sin_phi_bx_0,
        invariant_mass_2940638391876117895);

invariant_mass_3160759413460650486_i: entity work.calo_calo_correlation_condition_v2
    generic map(
        true,
        true, false, false, true, 0, false, 
        0, 11, true, JET_TYPE,
        X"003C",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        X"F",
        0, 11, true, JET_TYPE,
        X"003C",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        X"F",
        1.5, 0.0,
        0.0, 0.0,
        0.0, 0.0, DETA_DPHI_VECTOR_WIDTH_ALL, JET_JET_DETA_DPHI_PRECISION,
        11549264162.0, 64800.0, JET_JET_MASS_PRECISION,
        JET_PT_VECTOR_WIDTH, JET_PT_VECTOR_WIDTH, JET_JET_COSH_COS_PRECISION, JET_JET_COSH_COS_VECTOR_WIDTH,
        0.0, CALO_SIN_COS_VECTOR_WIDTH, JET_JET_PT_PRECISION, JET_JET_SIN_COS_PRECISION
    )
    port map(lhc_clk, jet_bx_0, jet_bx_0,
        diff_jet_jet_bx_0_bx_0_eta_vector, diff_jet_jet_bx_0_bx_0_phi_vector,
        jet_pt_vector_bx_0, jet_pt_vector_bx_0,
        jet_jet_bx_0_bx_0_cosh_deta_vector, jet_jet_bx_0_bx_0_cos_dphi_vector,
        jet_cos_phi_bx_0, jet_cos_phi_bx_0, jet_sin_phi_bx_0, jet_sin_phi_bx_0,
        invariant_mass_3160759413460650486);

calo_muon_correlation_16240387826857744385_i: entity work.calo_muon_correlation_condition_v2
    generic map(
        true, true, false, false, 0, false, 
        0, 11, true, JET_TYPE,
        X"0020",
        false, X"0044",X"00BB",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        X"F",
        0, 7, true,
        X"0007",
        true, X"0000",X"0000",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        "ign", X"F000", X"F",
        0.4, 0.0,
        0.4, 0.0,
        0.0, 0.0, DETA_DPHI_VECTOR_WIDTH_ALL, JET_MU_DETA_DPHI_PRECISION,
        0.0, 0.0, JET_MU_MASS_PRECISION,
        JET_PT_VECTOR_WIDTH, MU_PT_VECTOR_WIDTH, JET_MU_COSH_COS_PRECISION, JET_MU_COSH_COS_VECTOR_WIDTH,
        0.0, MUON_SIN_COS_VECTOR_WIDTH, JET_MU_PT_PRECISION, JET_MU_SIN_COS_PRECISION
    )
    port map(lhc_clk, jet_bx_0, mu_bx_0,
        diff_jet_mu_bx_0_bx_0_eta_vector, diff_jet_mu_bx_0_bx_0_phi_vector,
        jet_pt_vector_bx_0, mu_pt_vector_bx_0, 
        jet_mu_bx_0_bx_0_cosh_deta_vector, jet_mu_bx_0_bx_0_cos_dphi_vector,
        conv_jet_cos_phi_bx_0, mu_cos_phi_bx_0, conv_jet_sin_phi_bx_0, mu_sin_phi_bx_0,
        calo_muon_correlation_16240387826857744385);

invariant_mass_2342552854377181621_i: entity work.muon_muon_correlation_condition_v2
    generic map(
        true,
        false, false, false, true, 0, false, 
        0, 7, true,
        X"000A",
        false, X"00B8", X"0148",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        "ign", X"F000", X"F",
        true,
        X"000A",
        false, X"00B8",X"0148",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        "ign", X"F000", X"F",
        "os",
        0.0, 0.0,
        0.0, 0.0,
        0.0, 0.0, DETA_DPHI_VECTOR_WIDTH_ALL, MU_MU_DETA_DPHI_PRECISION,
        162.0, 24.5, MU_MU_MASS_PRECISION,
        MU_PT_VECTOR_WIDTH, MU_MU_COSH_COS_PRECISION, MU_MU_COSH_COS_VECTOR_WIDTH,
        0.0, MUON_SIN_COS_VECTOR_WIDTH, MU_MU_PT_PRECISION, MU_MU_SIN_COS_PRECISION
    )
    port map(lhc_clk, mu_bx_0, mu_bx_0,
        ls_charcorr_double_bx_0_bx_0, os_charcorr_double_bx_0_bx_0,
        diff_mu_mu_bx_0_bx_0_eta_vector, diff_mu_mu_bx_0_bx_0_phi_vector,
        mu_pt_vector_bx_0, mu_pt_vector_bx_0,
        mu_mu_bx_0_bx_0_cosh_deta_vector, mu_mu_bx_0_bx_0_cos_dphi_vector,
        mu_cos_phi_bx_0, mu_cos_phi_bx_0, mu_sin_phi_bx_0, mu_sin_phi_bx_0,
        invariant_mass_2342552854377181621);

invariant_mass_3063833799189854821_i: entity work.muon_muon_correlation_condition_v2
    generic map(
        true,
        false, false, false, true, 0, false, 
        0, 7, true,
        X"000B",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        "ign", X"F000", X"F",
        true,
        X"0007",
        true, X"0000",X"0000",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        "ign", X"F000", X"F",
        "os",
        0.0, 0.0,
        0.0, 0.0,
        0.0, 0.0, DETA_DPHI_VECTOR_WIDTH_ALL, MU_MU_DETA_DPHI_PRECISION,
        40.5, 0.0, MU_MU_MASS_PRECISION,
        MU_PT_VECTOR_WIDTH, MU_MU_COSH_COS_PRECISION, MU_MU_COSH_COS_VECTOR_WIDTH,
        0.0, MUON_SIN_COS_VECTOR_WIDTH, MU_MU_PT_PRECISION, MU_MU_SIN_COS_PRECISION
    )
    port map(lhc_clk, mu_bx_0, mu_bx_0,
        ls_charcorr_double_bx_0_bx_0, os_charcorr_double_bx_0_bx_0,
        diff_mu_mu_bx_0_bx_0_eta_vector, diff_mu_mu_bx_0_bx_0_phi_vector,
        mu_pt_vector_bx_0, mu_pt_vector_bx_0,
        mu_mu_bx_0_bx_0_cosh_deta_vector, mu_mu_bx_0_bx_0_cos_dphi_vector,
        mu_cos_phi_bx_0, mu_cos_phi_bx_0, mu_sin_phi_bx_0, mu_sin_phi_bx_0,
        invariant_mass_3063833799189854821);

muon_muon_correlation_11372876368900732981_i: entity work.muon_muon_correlation_condition_v2
    generic map(
        false,
        false, true, false, false, 0, false, 
        0, 7, true,
        X"0007",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        false, X"011F", X"0000",
        true, X"0000", X"0000",
        "ign", X"FFFF", X"F",
        true,
        X"0007",
        true, X"0000",X"0000",
        true, X"0000", X"0000",
        false, X"023F", X"0120",
        true, X"0000", X"0000",
        "ign", X"FFFF", X"F",
        "ig",
        0.0, 0.0,
        3.142, 2.618,
        0.0, 0.0, DETA_DPHI_VECTOR_WIDTH_ALL, MU_MU_DETA_DPHI_PRECISION,
        0.0, 0.0, MU_MU_MASS_PRECISION,
        MU_PT_VECTOR_WIDTH, MU_MU_COSH_COS_PRECISION, MU_MU_COSH_COS_VECTOR_WIDTH,
        0.0, MUON_SIN_COS_VECTOR_WIDTH, MU_MU_PT_PRECISION, MU_MU_SIN_COS_PRECISION
    )
    port map(lhc_clk, mu_bx_m1, mu_bx_0,
        ls_charcorr_double_bx_m1_bx_0, os_charcorr_double_bx_m1_bx_0,
        diff_mu_mu_bx_m1_bx_0_eta_vector, diff_mu_mu_bx_m1_bx_0_phi_vector,
        mu_pt_vector_bx_m1, mu_pt_vector_bx_0,
        mu_mu_bx_m1_bx_0_cosh_deta_vector, mu_mu_bx_m1_bx_0_cos_dphi_vector,
        mu_cos_phi_bx_m1, mu_cos_phi_bx_0, mu_sin_phi_bx_m1, mu_sin_phi_bx_0,
        muon_muon_correlation_11372876368900732981);

muon_muon_correlation_3624461265804720180_i: entity work.muon_muon_correlation_condition_v2
    generic map(
        false,
        false, true, false, false, 0, false, 
        0, 7, true,
        X"0007",
        false, X"0093", X"016D",
        true, X"0000", X"0000",
        false, X"00EF", X"0030",
        true, X"0000", X"0000",
        "ign", X"FFFF", X"F",
        true,
        X"0007",
        false, X"0093",X"016D",
        true, X"0000", X"0000",
        false, X"020F", X"0150",
        true, X"0000", X"0000",
        "ign", X"FFFF", X"F",
        "ig",
        0.0, 0.0,
        3.142, 2.618,
        0.0, 0.0, DETA_DPHI_VECTOR_WIDTH_ALL, MU_MU_DETA_DPHI_PRECISION,
        0.0, 0.0, MU_MU_MASS_PRECISION,
        MU_PT_VECTOR_WIDTH, MU_MU_COSH_COS_PRECISION, MU_MU_COSH_COS_VECTOR_WIDTH,
        0.0, MUON_SIN_COS_VECTOR_WIDTH, MU_MU_PT_PRECISION, MU_MU_SIN_COS_PRECISION
    )
    port map(lhc_clk, mu_bx_m1, mu_bx_0,
        ls_charcorr_double_bx_m1_bx_0, os_charcorr_double_bx_m1_bx_0,
        diff_mu_mu_bx_m1_bx_0_eta_vector, diff_mu_mu_bx_m1_bx_0_phi_vector,
        mu_pt_vector_bx_m1, mu_pt_vector_bx_0,
        mu_mu_bx_m1_bx_0_cosh_deta_vector, mu_mu_bx_m1_bx_0_cos_dphi_vector,
        mu_cos_phi_bx_m1, mu_cos_phi_bx_0, mu_sin_phi_bx_m1, mu_sin_phi_bx_0,
        muon_muon_correlation_3624461265804720180);

muon_muon_correlation_5013543133382208461_i: entity work.muon_muon_correlation_condition_v2
    generic map(
        false,
        false, true, false, false, 0, false, 
        0, 7, true,
        X"0007",
        false, X"0093", X"016D",
        true, X"0000", X"0000",
        false, X"00EF", X"0030",
        true, X"0000", X"0000",
        "ign", X"F000", X"F",
        true,
        X"0007",
        false, X"0093",X"016D",
        true, X"0000", X"0000",
        false, X"020F", X"0150",
        true, X"0000", X"0000",
        "ign", X"F000", X"F",
        "ig",
        0.0, 0.0,
        3.142, 2.618,
        0.0, 0.0, DETA_DPHI_VECTOR_WIDTH_ALL, MU_MU_DETA_DPHI_PRECISION,
        0.0, 0.0, MU_MU_MASS_PRECISION,
        MU_PT_VECTOR_WIDTH, MU_MU_COSH_COS_PRECISION, MU_MU_COSH_COS_VECTOR_WIDTH,
        0.0, MUON_SIN_COS_VECTOR_WIDTH, MU_MU_PT_PRECISION, MU_MU_SIN_COS_PRECISION
    )
    port map(lhc_clk, mu_bx_m1, mu_bx_0,
        ls_charcorr_double_bx_m1_bx_0, os_charcorr_double_bx_m1_bx_0,
        diff_mu_mu_bx_m1_bx_0_eta_vector, diff_mu_mu_bx_m1_bx_0_phi_vector,
        mu_pt_vector_bx_m1, mu_pt_vector_bx_0,
        mu_mu_bx_m1_bx_0_cosh_deta_vector, mu_mu_bx_m1_bx_0_cos_dphi_vector,
        mu_cos_phi_bx_m1, mu_cos_phi_bx_0, mu_sin_phi_bx_m1, mu_sin_phi_bx_0,
        muon_muon_correlation_5013543133382208461);

muon_muon_correlation_7972376774213455602_i: entity work.muon_muon_correlation_condition_v2
    generic map(
        true,
        true, false, false, false, 0, false, 
        0, 7, true,
        X"0001",
        false, X"0081", X"017F",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        "ign", X"FF00", X"F",
        true,
        X"0001",
        false, X"0081",X"017F",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        "ign", X"FF00", X"F",
        "os",
        1.8, 0.0,
        0.0, 0.0,
        0.0, 0.0, DETA_DPHI_VECTOR_WIDTH_ALL, MU_MU_DETA_DPHI_PRECISION,
        0.0, 0.0, MU_MU_MASS_PRECISION,
        MU_PT_VECTOR_WIDTH, MU_MU_COSH_COS_PRECISION, MU_MU_COSH_COS_VECTOR_WIDTH,
        0.0, MUON_SIN_COS_VECTOR_WIDTH, MU_MU_PT_PRECISION, MU_MU_SIN_COS_PRECISION
    )
    port map(lhc_clk, mu_bx_0, mu_bx_0,
        ls_charcorr_double_bx_0_bx_0, os_charcorr_double_bx_0_bx_0,
        diff_mu_mu_bx_0_bx_0_eta_vector, diff_mu_mu_bx_0_bx_0_phi_vector,
        mu_pt_vector_bx_0, mu_pt_vector_bx_0,
        mu_mu_bx_0_bx_0_cosh_deta_vector, mu_mu_bx_0_bx_0_cos_dphi_vector,
        mu_cos_phi_bx_0, mu_cos_phi_bx_0, mu_sin_phi_bx_0, mu_sin_phi_bx_0,
        muon_muon_correlation_7972376774213455602);

calo_esum_correlation_13491612199618123042_i: entity work.calo_esums_correlation_condition_v2
    generic map(
        true, false, TRANSVERSE_MASS_TYPE, false, 
        0, 11, true, JET_TYPE,
        X"0078",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        X"F",
        true, ETM_TYPE,
        X"00C8",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        3.15, 0.4, DETA_DPHI_VECTOR_WIDTH_ALL, JET_ETM_DPHI_PRECISION,
        0.0, 0.0, JET_ETM_MASS_PRECISION,
        JET_PT_VECTOR_WIDTH, ETM_PT_VECTOR_WIDTH, JET_ETM_COSH_COS_PRECISION, JET_ETM_COSH_COS_VECTOR_WIDTH,
        0.0, CALO_SIN_COS_VECTOR_WIDTH, JET_ETM_PT_PRECISION, JET_ETM_SIN_COS_PRECISION
   )
    port map(lhc_clk, jet_bx_0, etm_bx_0,
        diff_jet_etm_bx_0_bx_0_phi_vector,
        jet_pt_vector_bx_0, etm_pt_vector_bx_0,
        jet_etm_bx_0_bx_0_cos_dphi_vector,
        jet_cos_phi_bx_0, etm_cos_phi_bx_0, jet_sin_phi_bx_0, etm_sin_phi_bx_0,
        calo_esum_correlation_13491612199618123042);

calo_esum_correlation_16768129600233686289_i: entity work.calo_esums_correlation_condition_v2
    generic map(
        true, false, TRANSVERSE_MASS_TYPE, false, 
        0, 11, true, JET_TYPE,
        X"0078",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        X"F",
        true, ETM_TYPE,
        X"0096",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        3.15, 0.4, DETA_DPHI_VECTOR_WIDTH_ALL, JET_ETM_DPHI_PRECISION,
        0.0, 0.0, JET_ETM_MASS_PRECISION,
        JET_PT_VECTOR_WIDTH, ETM_PT_VECTOR_WIDTH, JET_ETM_COSH_COS_PRECISION, JET_ETM_COSH_COS_VECTOR_WIDTH,
        0.0, CALO_SIN_COS_VECTOR_WIDTH, JET_ETM_PT_PRECISION, JET_ETM_SIN_COS_PRECISION
   )
    port map(lhc_clk, jet_bx_0, etm_bx_0,
        diff_jet_etm_bx_0_bx_0_phi_vector,
        jet_pt_vector_bx_0, etm_pt_vector_bx_0,
        jet_etm_bx_0_bx_0_cos_dphi_vector,
        jet_cos_phi_bx_0, etm_cos_phi_bx_0, jet_sin_phi_bx_0, etm_sin_phi_bx_0,
        calo_esum_correlation_16768129600233686289);

calo_esum_correlation_16768129600365282577_i: entity work.calo_esums_correlation_condition_v2
    generic map(
        true, false, TRANSVERSE_MASS_TYPE, false, 
        0, 11, true, JET_TYPE,
        X"0078",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        X"F",
        true, ETM_TYPE,
        X"00B4",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        3.15, 0.4, DETA_DPHI_VECTOR_WIDTH_ALL, JET_ETM_DPHI_PRECISION,
        0.0, 0.0, JET_ETM_MASS_PRECISION,
        JET_PT_VECTOR_WIDTH, ETM_PT_VECTOR_WIDTH, JET_ETM_COSH_COS_PRECISION, JET_ETM_COSH_COS_VECTOR_WIDTH,
        0.0, CALO_SIN_COS_VECTOR_WIDTH, JET_ETM_PT_PRECISION, JET_ETM_SIN_COS_PRECISION
   )
    port map(lhc_clk, jet_bx_0, etm_bx_0,
        diff_jet_etm_bx_0_bx_0_phi_vector,
        jet_pt_vector_bx_0, etm_pt_vector_bx_0,
        jet_etm_bx_0_bx_0_cos_dphi_vector,
        jet_cos_phi_bx_0, etm_cos_phi_bx_0, jet_sin_phi_bx_0, etm_sin_phi_bx_0,
        calo_esum_correlation_16768129600365282577);

transverse_mass_3639674040417019497_i: entity work.calo_esums_correlation_condition_v2
    generic map(
        false, true, TRANSVERSE_MASS_TYPE, false, 
        0, 11, true, EG_TYPE,
        X"0042",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        X"A",
        true, ETM_TYPE,
        X"0014",
        true, X"0000", X"0000",
        true, X"0000", X"0000",
        0.0, 0.0, DETA_DPHI_VECTOR_WIDTH_ALL, EG_ETM_DPHI_PRECISION,
        11549264162.0, 968.0, EG_ETM_MASS_PRECISION,
        EG_PT_VECTOR_WIDTH, ETM_PT_VECTOR_WIDTH, EG_ETM_COSH_COS_PRECISION, EG_ETM_COSH_COS_VECTOR_WIDTH,
        0.0, CALO_SIN_COS_VECTOR_WIDTH, EG_ETM_PT_PRECISION, EG_ETM_SIN_COS_PRECISION
   )
    port map(lhc_clk, eg_bx_0, etm_bx_0,
        diff_eg_etm_bx_0_bx_0_phi_vector,
        eg_pt_vector_bx_0, etm_pt_vector_bx_0,
        eg_etm_bx_0_bx_0_cos_dphi_vector,
        eg_cos_phi_bx_0, etm_cos_phi_bx_0, eg_sin_phi_bx_0, etm_sin_phi_bx_0,
        transverse_mass_3639674040417019497);


-- Instantiations of algorithms

-- 1 L1_SingleMuOpen : MU0[MU-QLTY_OPEN]
l1_single_mu_open <= single_mu_14769293018627052229;
algo(11) <= l1_single_mu_open;

-- 2 L1_SingleMuCosmics_BMTF : MU0[MU-ETA_BMTF]
l1_single_mu_cosmics_bmtf <= single_mu_14243093768255232179;
algo(52) <= l1_single_mu_cosmics_bmtf;

-- 5 L1_SingleMu0_BMTF : MU0[MU-QLTY_SNGL,MU-ETA_BMTF]
l1_single_mu0_bmtf <= single_mu_16260934496621930532;
algo(46) <= l1_single_mu0_bmtf;

-- 12 L1_SingleMu11_LowQ : MU11[MU-QLTY_DBLE]
l1_single_mu11_low_q <= single_mu_17545683038261595717;
algo(47) <= l1_single_mu11_low_q;

-- 16 L1_SingleMu16 : MU16[MU-QLTY_SNGL]
l1_single_mu16 <= single_mu_17545683128212558277;
algo(48) <= l1_single_mu16;

-- 22 L1_SingleMu22_EMTF : MU22[MU-QLTY_SNGL,MU-ETA_EMTF_POS,MU-ETA_EMTF_NEG]
l1_single_mu22_emtf <= single_mu_6225176160372139651;
algo(49) <= l1_single_mu22_emtf;

-- 23 L1_SingleMu25 : MU25[MU-QLTY_SNGL]
l1_single_mu25 <= single_mu_17545685310055944645;
algo(50) <= l1_single_mu25;

-- 24 L1_SingleMu30 : MU30[MU-QLTY_SNGL]
l1_single_mu30 <= single_mu_17545687423179854277;
algo(51) <= l1_single_mu30;

-- 33 L1_DoubleMu_12_8 : comb{MU12[MU-QLTY_DBLE],MU8[MU-QLTY_DBLE]}
l1_double_mu_12_8 <= double_mu_16961163853691648004;
algo(58) <= l1_double_mu_12_8;

-- 36 L1_DoubleMu_15_7 : comb{MU15[MU-QLTY_DBLE],MU7[MU-QLTY_DBLE]}
l1_double_mu_15_7 <= double_mu_16961163303935834116;
algo(59) <= l1_double_mu_15_7;

-- 39 L1_TripleMu0 : comb{MU0[MU-QLTY_DBLE],MU0[MU-QLTY_DBLE],MU0[MU-QLTY_DBLE]}
l1_triple_mu0 <= triple_mu_3324682852515662879;
algo(60) <= l1_triple_mu0;

-- 41 L1_TripleMu_4_4_4 : comb{MU4[MU-QLTY_DBLE],MU4[MU-QLTY_DBLE],MU4[MU-QLTY_DBLE]}
l1_triple_mu_4_4_4 <= triple_mu_3324694397387754527;
algo(62) <= l1_triple_mu_4_4_4;

-- 43 L1_TripleMu_5_3_3 : comb{MU5[MU-QLTY_DBLE],MU3[MU-QLTY_DBLE],MU3[MU-QLTY_DBLE]}
l1_triple_mu_5_3_3 <= triple_mu_3324691786047638559;
algo(63) <= l1_triple_mu_5_3_3;

-- 45 L1_QuadMu0 : comb{MU0[MU-QLTY_DBLE],MU0[MU-QLTY_DBLE],MU0[MU-QLTY_DBLE],MU0[MU-QLTY_DBLE]}
l1_quad_mu0 <= quad_mu_509409160461874775;
algo(68) <= l1_quad_mu0;

-- 50 L1_SingleEG5 : EG5
l1_single_eg5 <= single_eg_1139637;
algo(17) <= l1_single_eg5;

-- 55 L1_SingleEG26 : EG26
l1_single_eg26 <= single_eg_145873206;
algo(12) <= l1_single_eg26;

-- 57 L1_SingleEG30 : EG30
l1_single_eg30 <= single_eg_145873328;
algo(13) <= l1_single_eg30;

-- 59 L1_SingleEG34 : EG34
l1_single_eg34 <= single_eg_145873332;
algo(14) <= l1_single_eg34;

-- 62 L1_SingleEG40 : EG40
l1_single_eg40 <= single_eg_145873456;
algo(16) <= l1_single_eg40;

-- 67 L1_SingleEG36er2p1 : EG36[EG-ETA_2p13]
l1_single_eg36er2p1 <= single_eg_14262501759976278963;
algo(15) <= l1_single_eg36er2p1;

-- 71 L1_SingleIsoEG22 : EG22[EG-ISO_0xA]
l1_single_iso_eg22 <= single_eg_12507579852184457792;
algo(19) <= l1_single_iso_eg22;

-- 74 L1_SingleIsoEG28 : EG28[EG-ISO_0xA]
l1_single_iso_eg28 <= single_eg_12507579852190749248;
algo(21) <= l1_single_iso_eg28;

-- 78 L1_SingleIsoEG35 : EG35[EG-ISO_0xA]
l1_single_iso_eg35 <= single_eg_12507579852321821248;
algo(24) <= l1_single_iso_eg35;

-- 83 L1_SingleIsoEG18er2p1 : EG18[EG-ISO_0xA,EG-ETA_2p13]
l1_single_iso_eg18er2p1 <= single_eg_6872811427209405681;
algo(18) <= l1_single_iso_eg18er2p1;

-- 86 L1_SingleIsoEG24er2p1 : EG24[EG-ISO_0xA,EG-ETA_2p13]
l1_single_iso_eg24er2p1 <= single_eg_6872947766651249905;
algo(20) <= l1_single_iso_eg24er2p1;

-- 89 L1_SingleIsoEG30er2p1 : EG30[EG-ISO_0xA,EG-ETA_2p13]
l1_single_iso_eg30er2p1 <= single_eg_6873084106093094129;
algo(22) <= l1_single_iso_eg30er2p1;

-- 91 L1_SingleIsoEG33er2p1 : EG33[EG-ISO_0xA,EG-ETA_2p13]
l1_single_iso_eg33er2p1 <= single_eg_6873087404627977457;
algo(23) <= l1_single_iso_eg33er2p1;

-- 94 L1_SingleIsoEG36er2p1 : EG36[EG-ETA_2p13,EG-ISO_0xA]
l1_single_iso_eg36er2p1 <= single_eg_9244881742421986046;
algo(25) <= l1_single_iso_eg36er2p1;

-- 95 L1_SingleIsoEG38er2p1 : EG38[EG-ETA_2p13,EG-ISO_0xA]
l1_single_iso_eg38er2p1 <= single_eg_9244883941445241598;
algo(26) <= l1_single_iso_eg38er2p1;

-- 98 L1_IsoEG33_Mt44 : mass_trv{EG33[EG-ISO_0xA],ETM10}[MASS_Wmass3]
l1_iso_eg33_mt44 <= transverse_mass_3639674040417019497;
algo(69) <= l1_iso_eg33_mt44;

-- 103 L1_DoubleEG_22_10 : comb{EG22,EG10}
l1_double_eg_22_10 <= double_eg_14367831859864844127;
algo(37) <= l1_double_eg_22_10;

-- 107 L1_DoubleEG_24_17 : comb{EG24,EG17}
l1_double_eg_24_17 <= double_eg_14367840655957867231;
algo(38) <= l1_double_eg_24_17;

-- 115 L1_SingleTau20 : TAU20
l1_single_tau20 <= single_tau_22686292272;
algo(33) <= l1_single_tau20;

-- 118 L1_SingleTau120er2p1 : TAU120[TAU-ETA_2p13]
l1_single_tau120er2p1 <= single_tau_3484215725702552004;
algo(32) <= l1_single_tau120er2p1;

-- 122 L1_DoubleTau70er2p1 : comb{TAU70[TAU-ETA_2p13],TAU70[TAU-ETA_2p13]}
l1_double_tau70er2p1 <= double_tau_17539608616528615651;
algo(44) <= l1_double_tau70er2p1;

-- 125 L1_DoubleIsoTau32er2p1 : comb{TAU32[TAU-ISO_0xE,TAU-ETA_2p13],TAU32[TAU-ISO_0xE,TAU-ETA_2p13]}
l1_double_iso_tau32er2p1 <= double_tau_973280238110587646;
algo(40) <= l1_double_iso_tau32er2p1;

-- 129 L1_DoubleIsoTau36er2p1 : comb{TAU36[TAU-ISO_0xE,TAU-ETA_2p13],TAU36[TAU-ISO_0xE,TAU-ETA_2p13]}
l1_double_iso_tau36er2p1 <= double_tau_10196652277112847102;
algo(41) <= l1_double_iso_tau36er2p1;

-- 131 L1_SingleJet16 : JET16
l1_single_jet16 <= single_jet_20010309814;
algo(28) <= l1_single_jet16;

-- 133 L1_SingleJet35 : JET35
l1_single_jet35 <= single_jet_20010310069;
algo(30) <= l1_single_jet35;

-- 136 L1_SingleJet120 : JET120
l1_single_jet120 <= single_jet_2561319655728;
algo(27) <= l1_single_jet120;

-- 141 L1_SingleJet180 : JET180
l1_single_jet180 <= single_jet_2561319656496;
algo(29) <= l1_single_jet180;

-- 145 L1_SingleJet90_FWD : JET90[JET-ETA_FWD_2p61_NEG] OR JET90[JET-ETA_FWD_2p61_POS]
l1_single_jet90_fwd <= single_jet_15873314052325834177 or single_jet_15873314052330193857;
algo(45) <= l1_single_jet90_fwd;

-- 150 L1_SingleJet60_HFm : JET60[JET-ETA_FWD_NEG]
l1_single_jet60_h_fm <= single_jet_8640423326801359755;
algo(31) <= l1_single_jet60_h_fm;

-- 154 L1_DoubleJet80er3p0 : comb{JET80[JET-ETA_CEN],JET80[JET-ETA_CEN]}
l1_double_jet80er3p0 <= double_jet_8659446377168685779;
algo(43) <= l1_double_jet80er3p0;

-- 157 L1_DoubleJet120er3p0 : comb{JET120[JET-ETA_CEN],JET120[JET-ETA_CEN]}
l1_double_jet120er3p0 <= double_jet_15912440717418279010;
algo(42) <= l1_double_jet120er3p0;

-- 160 L1_TripleJet_88_72_56_VBF : comb{JET88[JET-ETA_CEN],JET72[JET-ETA_CEN],JET56[JET-ETA_CEN]} OR (comb{JET88[JET-ETA_CEN],JET72[JET-ETA_CEN]} AND JET56[JET-ETA_FWD_NEG,JET-ETA_FWD_POS]) OR (comb{JET88[JET-ETA_CEN],JET56[JET-ETA_CEN]} AND JET72[JET-ETA_FWD_NEG,JET-ETA_FWD_POS]) OR (comb{JET72[JET-ETA_CEN],JET56[JET-ETA_CEN]} AND JET88[JET-ETA_FWD_NEG,JET-ETA_FWD_POS])
l1_triple_jet_88_72_56_vbf <= triple_jet_7930493752634094709 or ( double_jet_8659448610551679699 and single_jet_5974075644574252540 ) or ( double_jet_8659444281224645331 and single_jet_5974214183039352316 ) or ( double_jet_8659370613945584339 and single_jet_5974287850318413308 );
algo(67) <= l1_triple_jet_88_72_56_vbf;

-- 205 L1_SingleMuOpen_NotBptxOR : MU0[MU-QLTY_OPEN] AND ( NOT EXT_BPTX_OR_VME)
l1_single_mu_open_not_bptx_or <= single_mu_14769293018627052229 and ( not single_ext_6102799243448260461 );
algo(53) <= l1_single_mu_open_not_bptx_or;

-- 207 L1_SingleJet20er3p0_NotBptxOR : JET20[JET-ETA_CEN] AND ( NOT EXT_BPTX_OR_VME)
l1_single_jet20er3p0_not_bptx_or <= single_jet_5967545309707548871 and ( not single_ext_6102799243448260461 );
algo(35) <= l1_single_jet20er3p0_not_bptx_or;

-- 209 L1_SingleJet43er3p0_NotBptxOR_3BX : JET43[JET-ETA_CEN] AND ( NOT EXT_BPTX_OR_VME-1) AND ( NOT EXT_BPTX_OR_VME) AND ( NOT EXT_BPTX_OR_VME+1)
l1_single_jet43er3p0_not_bptx_or_3_bx <= single_jet_5967545344469940423 and ( not single_ext_6909925150529645533 ) and ( not single_ext_6102799243448260461 ) and ( not single_ext_6909925150529645277 );
algo(36) <= l1_single_jet43er3p0_not_bptx_or_3_bx;

-- 214 L1_DoubleJet30_Mass_Min360_dEta_Max1p5 : mass_inv{JET30,JET30}[MASS_MIN_360,DETA_MAX_1p5]
l1_double_jet30_mass_min360_d_eta_max1p5 <= invariant_mass_3160759413460650486;
algo(80) <= l1_double_jet30_mass_min360_d_eta_max1p5;

-- 246 L1_DoubleJet112er2p3_dEta_Max1p6 : dist{JET112[JET-ETA_2p3],JET112[JET-ETA_2p3]}[DETA_MAX_1p6]
l1_double_jet112er2p3_d_eta_max1p6 <= calo_calo_correlation_7041035331710545453;
algo(71) <= l1_double_jet112er2p3_d_eta_max1p6;

-- 266 L1_ETM90_Jet60_dPhi_Min0p4 : dist{ETM90,JET60}[DPHI_MIN_0p4]
l1_etm90_jet60_d_phi_min0p4 <= calo_esum_correlation_16768129600365282577;
algo(66) <= l1_etm90_jet60_d_phi_min0p4;

-- 267 L1_ETM100_Jet60_dPhi_Min0p4 : dist{ETM100,JET60}[DPHI_MIN_0p4]
l1_etm100_jet60_d_phi_min0p4 <= calo_esum_correlation_13491612199618123042;
algo(64) <= l1_etm100_jet60_d_phi_min0p4;

-- 273 L1_DoubleEG_LooseIso23_10 : comb{EG23[EG-ISO_0xC],EG10}
l1_double_eg_loose_iso23_10 <= double_eg_9170720688096593570;
algo(39) <= l1_double_eg_loose_iso23_10;

-- 276 L1_DoubleJet_90_30_DoubleJet30_Mass_Min620 : comb{JET90,JET30} AND mass_inv{JET30,JET30}[MASS_MIN_620]
l1_double_jet_90_30_double_jet30_mass_min620 <= double_jet_4162612533456677351 and invariant_mass_2940638391876117895;
algo(79) <= l1_double_jet_90_30_double_jet30_mass_min620;

-- 277 L1_DoubleJet_100_30_DoubleJet30_Mass_Min620 : comb{JET100,JET30} AND mass_inv{JET30,JET30}[MASS_MIN_620]
l1_double_jet_100_30_double_jet30_mass_min620 <= double_jet_16307690244847013269 and invariant_mass_2940638391876117895;
algo(78) <= l1_double_jet_100_30_double_jet30_mass_min620;

-- 289 L1_LooseIsoEG24er2p1_IsoTau27er2p1_dR_Min0p3 : dist{EG24[EG-ISO_0xC,EG-ETA_2p13],TAU27[TAU-ISO_0xE,TAU-ETA_2p13]}[DR_MIN_0p3]
l1_loose_iso_eg24er2p1_iso_tau27er2p1_d_r_min0p3 <= calo_calo_correlation_911641502108141008;
algo(81) <= l1_loose_iso_eg24er2p1_iso_tau27er2p1_d_r_min0p3;

-- 371 L1_DoubleMu4p5er2p0_SQ_OS_Mass7to18 : mass_inv{MU4p5[MU-QLTY_SNGL,MU-ETA_2p0],MU4p5[MU-QLTY_SNGL,MU-ETA_2p0]}[MASS_MASS_7to18,CHGCOR_OS]
l1_double_mu4p5er2p0_sq_os_mass7to18 <= invariant_mass_2342552854377181621;
algo(72) <= l1_double_mu4p5er2p0_sq_os_mass7to18;

-- 379 L1_DoubleMu6_SQ_OS : comb{MU6[MU-QLTY_SNGL],MU6[MU-QLTY_SNGL]}[CHGCOR_OS]
l1_double_mu6_sq_os <= double_mu_3274363720173353484;
algo(57) <= l1_double_mu6_sq_os;

-- 382 L1_TripleMu_5SQ_3SQ_0OQ_DoubleMu_5_3_SQ_OS_Mass_Max9 : comb{MU5[MU-QLTY_SNGL],MU3[MU-QLTY_SNGL],MU0[MU-QLTY_OPEN]} AND mass_inv{MU5[MU-QLTY_SNGL],MU3[MU-QLTY_SNGL]}[MASS_MASS_0to9,CHGCOR_OS]
l1_triple_mu_5_sq_3_sq_0_oq_double_mu_5_3_sq_os_mass_max9 <= triple_mu_3324685732743223327 and invariant_mass_3063833799189854821;
algo(76) <= l1_triple_mu_5_sq_3_sq_0_oq_double_mu_5_3_sq_os_mass_max9;

-- 383 L1_TripleMu_5SQ_3SQ_0_DoubleMu_5_3_SQ_OS_Mass_Max9 : comb{MU5[MU-QLTY_SNGL],MU3[MU-QLTY_SNGL],MU0[MU-QLTY_DBLE]} AND mass_inv{MU5[MU-QLTY_SNGL],MU3[MU-QLTY_SNGL]}[MASS_MASS_0to9,CHGCOR_OS]
l1_triple_mu_5_sq_3_sq_0_double_mu_5_3_sq_os_mass_max9 <= triple_mu_3324685351042537503 and invariant_mass_3063833799189854821;
algo(77) <= l1_triple_mu_5_sq_3_sq_0_double_mu_5_3_sq_os_mass_max9;

-- 387 L1_DoubleMu4p5_SQ : comb{MU4p5[MU-QLTY_SNGL],MU4p5[MU-QLTY_SNGL]}
l1_double_mu4p5_sq <= double_mu_17582786187978172426;
algo(56) <= l1_double_mu4p5_sq;

-- 390 L1_DoubleMu0er1p5_SQ_OS : comb{MU0[MU-QLTY_SNGL,MU-ETA_1p5],MU0[MU-QLTY_SNGL,MU-ETA_1p5]}[CHGCOR_OS]
l1_double_mu0er1p5_sq_os <= double_mu_14617142003772573591;
algo(55) <= l1_double_mu0er1p5_sq_os;

-- 394 L1_TripleMu0_OQ : comb{MU0[MU-QLTY_OPEN],MU0[MU-QLTY_OPEN],MU0[MU-QLTY_OPEN]}
l1_triple_mu0_oq <= triple_mu_3324683353497813023;
algo(61) <= l1_triple_mu0_oq;

-- 411 L1_Mu8_HTT150er : MU8[MU-QLTY_SNGL] AND HTT150
l1_mu8_htt150er <= single_mu_14769293157135585733 and single_htt_2496626711216;
algo(54) <= l1_mu8_htt150er;

-- 416 L1_ETM75_Jet60_dPhi_Min0p4 : dist{ETM75,JET60}[DPHI_MIN_0p4]
l1_etm75_jet60_d_phi_min0p4 <= calo_esum_correlation_16768129600233686289;
algo(65) <= l1_etm75_jet60_d_phi_min0p4;

-- 425 L1_DoubleMu0er1p4_dEta_Max1p8_OS : dist{MU0[MU-QLTY_DBLE,MU-ETA_1p4],MU0[MU-QLTY_DBLE,MU-ETA_1p4]}[DETA_MAX_1p8,CHGCOR_OS]
l1_double_mu0er1p4_d_eta_max1p8_os <= muon_muon_correlation_7972376774213455602;
algo(70) <= l1_double_mu0er1p4_d_eta_max1p8_os;

-- 428 L1_Mu3_JetC16_dEta_Max0p4_dPhi_Max0p4 : dist{MU3[MU-QLTY_SNGL],JET16[JET-ETA_CEN]}[DETA_MAX_0p4,DPHI_MAX_0p4]
l1_mu3_jet_c16_d_eta_max0p4_d_phi_max0p4 <= calo_muon_correlation_16240387826857744385;
algo(82) <= l1_mu3_jet_c16_d_eta_max0p4_d_phi_max0p4;

-- 431 L1_SingleEG2_BptxAND : EG2 AND EXT_ZeroBias_BPTX_AND_VME
l1_single_eg2_bptx_and <= single_eg_1139634 and single_ext_1189548080491112364;
algo(34) <= l1_single_eg2_bptx_and;

-- 455 L1_BPTX_BeamGas_Ref2_VME : EXT_BPTX_BeamGas_Ref2_VME
l1_bptx_beam_gas_ref2_vme <= single_ext_866206786138065236;
algo(6) <= l1_bptx_beam_gas_ref2_vme;

-- 457 L1_BPTX_BeamGas_B2_VME : EXT_BPTX_BeamGas_B2_VME
l1_bptx_beam_gas_b2_vme <= single_ext_9960888781443116569;
algo(5) <= l1_bptx_beam_gas_b2_vme;

-- 461 L1_BptxOR : EXT_BPTX_OR_VME
l1_bptx_or <= single_ext_6102799243448260461;
algo(10) <= l1_bptx_or;

-- 465 L1_BPTX_NotOR_VME : EXT_BPTX_NotOR_VME
l1_bptx_not_or_vme <= single_ext_17417807877912935668;
algo(7) <= l1_bptx_not_or_vme;

-- 466 L1_BPTX_AND_Ref2_NIM : EXT_BPTX_AND_Ref2_NIM
l1_bptx_and_ref2_nim <= single_ext_10333571492942459780;
algo(1) <= l1_bptx_and_ref2_nim;

-- 471 L1_BPTX_OR_Ref3_VME : EXT_BPTX_OR_Ref3_VME
l1_bptx_or_ref3_vme <= single_ext_9945386644737729380;
algo(8) <= l1_bptx_or_ref3_vme;

-- 472 L1_BPTX_RefAND_VME : EXT_BPTX_RefAND_VME
l1_bptx_ref_and_vme <= single_ext_15141600570663550655;
algo(9) <= l1_bptx_ref_and_vme;

-- 474 L1_BPTX_AND_Ref4_VME : EXT_BPTX_AND_Ref4_VME
l1_bptx_and_ref4_vme <= single_ext_10333571493479462268;
algo(2) <= l1_bptx_and_ref4_vme;

-- 478 L1_BPTX_AND_NIM : EXT_BPTX_AND_NIM
l1_bptx_and_nim <= single_ext_6394990348257196279;
algo(0) <= l1_bptx_and_nim;

-- 479 L1_BPTX_B1_NIM : EXT_BPTX_B1_NIM
l1_bptx_b1_nim <= single_ext_6102798787913160053;
algo(3) <= l1_bptx_b1_nim;

-- 480 L1_BPTX_B2_NIM : EXT_BPTX_B2_NIM
l1_bptx_b2_nim <= single_ext_6102798788181595509;
algo(4) <= l1_bptx_b2_nim;

-- 493 L1_CDC_3_TOP_DPHI2p618_3p142 : dist{MU3-1[MU-PHI_TOP],MU3[MU-PHI_BOTTOM]}[DPHI_DPHI_MIN2p618_MAX3p142]
l1_cdc_3_top_dphi2p618_3p142 <= muon_muon_correlation_11372876368900732981;
algo(73) <= l1_cdc_3_top_dphi2p618_3p142;

-- 499 L1_CDC_3_er1p6_TOP120_DPHI2p618_3p142 : dist{MU3-1[MU-ETA_1p6,MU-PHI_TOP120],MU3[MU-ETA_1p6,MU-PHI_BOTTOM120]}[DPHI_DPHI_MIN2p618_MAX3p142]
l1_cdc_3_er1p6_top120_dphi2p618_3p142 <= muon_muon_correlation_3624461265804720180;
algo(74) <= l1_cdc_3_er1p6_top120_dphi2p618_3p142;

-- 505 L1_CDC_SingleMu_3_er1p6_TOP120_DPHI2p618_3p142 : dist{MU3-1[MU-ETA_1p6,MU-PHI_TOP120,MU-QLTY_SNGL],MU3[MU-ETA_1p6,MU-PHI_BOTTOM120,MU-QLTY_SNGL]}[DPHI_DPHI_MIN2p618_MAX3p142]
l1_cdc_single_mu_3_er1p6_top120_dphi2p618_3p142 <= muon_muon_correlation_5013543133382208461;
algo(75) <= l1_cdc_single_mu_3_er1p6_top120_dphi2p618_3p142;


-- ========================================================