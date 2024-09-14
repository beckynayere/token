import Nat8 "mo:base/Nat8";
import Token "mo:icrc1/ICRC1/Canisters/Token";

import Trie "mo:base/Trie";
import Principal "mo:base/Principal";


 // Ensure this import is correct

actor {
    // Define the number of decimals used for token operations
    let decimals = 6; // Replace with your chosen number of decimals

    // Function to handle decimal scaling
    func add_decimals(n: Nat): Nat {
        n * 10 ** decimals
    };

    // Define the principal account for pre-minting tokens
    let pre_mint_account = {
        owner = Principal.fromText("37djg-ct5tg-zzlm2-3xl5p-gdzhr-reqhm-5hcvi-y7ixn-7vder-hxf43-vae");
        subaccount = null;
    };

    // Initialize the token canister with specified parameters
    let token_canister = Token.Token({
        name = "Becky";
        symbol = "Becky";
        decimals = Nat8.fromNat(decimals);
        fee = add_decimals(1);
        max_supply = add_decimals(1_000_000);

        // Pre-mint 100,000 tokens for the account
        initial_balances = [(pre_mint_account, add_decimals(100_000))]; 

        min_burn_amount = add_decimals(10);
        minting_account = null; // Defaults to the canister id of the caller
        advanced_settings = null; 
    });
};

